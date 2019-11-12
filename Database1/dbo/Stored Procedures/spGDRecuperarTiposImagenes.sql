
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Metodo o PRG 	        :   spGDRecuperarTiposImagenes
* Desarrollado por		:  <\A 	A\>
* Descripcion			:  <\D  D\>
* Observaciones			:  <\O	O\>
* Parametros			:  <\P	P\>
*						:  <\P  P\>
*						   <\P  P\>
* Variables				:  <\V  V\>
* Fecha Creacion		 :  <\FC FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION   
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Meissner Hernán Preciado  AM\>  
* Descripcion			 : <\DM Se adiciona relación con la tabla tbTiposImagenesxTiposDocumento solamente para Responde para así traer		DM\>
						   <\DM	los tipos de imágenes que allí se maneje y no solamente soporte responde como se venía manejando			DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM 2017/07/06  FM\>
*---------------------------------------------------------------------------------*/

CREATE Procedure [dbo].[spGDRecuperarTiposImagenes]

@cdgo_tpo_imgn				Varchar(15),
@ldFechaReferencia			datetime,
@lcCadenaSeleccion			Varchar(50),
@lcTraerTodosVisibleUsuario Char(1),
@orgn_aplccn				Int


As
Set Nocount On
  
If  @ldFechaReferencia Is Null
 Set @ldFechaReferencia = GetDate()


Declare	@tbtiposimagenes As Table
(
	dscrpcn_tpo_imgn			Varchar(150),
	cdgo_tpo_imgn				Varchar(30),
	cnsctvo_cdgo_tpo_imgn		Int
)

Declare
@tipoDocumentoResponde int,
@tipoDocumentoQuick int

set		@tipoDocumentoResponde	= 21
set		@tipoDocumentoQuick		= 22
 
If @orgn_aplccn		=	1
	Begin
		If @cdgo_tpo_imgn Is Null
			Begin
				If @lcCadenaSeleccion = '+' or @lcCadenaSeleccion Is Null
					Insert Into	@tbtiposimagenes
					Select		dscrpcn_tpo_imgn,				cdgo_tpo_imgn,			a.cnsctvo_cdgo_tpo_imgn
					From		bdGestionDocumental.dbo.tbtiposimagenes_vigencias		as	a
					inner join	bdGestionDocumental.dbo.tbTiposImagenesxTiposDocumento	as	b	On	a.cnsctvo_cdgo_tpo_imgn = b.cnsctvo_cdgo_tpo_imgn
					Where		(a.vsble_usro  = 'S'	Or	@lcTraerTodosVisibleUsuario = 'S')
					And			b.cnsctvo_cdgo_tpo_dcmnto		=	@tipoDocumentoResponde
					Order By	a.dscrpcn_tpo_imgn
				
				Else
					Insert Into	@tbtiposimagenes
					Select		dscrpcn_tpo_imgn,				cdgo_tpo_imgn,			a.cnsctvo_cdgo_tpo_imgn
					From		bdGestionDocumental.dbo.tbtiposimagenes_vigencias		as	a
					inner join	bdGestionDocumental.dbo.tbTiposImagenesxTiposDocumento	as	b	On	a.cnsctvo_cdgo_tpo_imgn = b.cnsctvo_cdgo_tpo_imgn
					Where		dscrpcn_tpo_imgn Like  '%' + ltrim(rtrim(@lcCadenaSeleccion) + '%' )
					And			(a.vsble_usro  = 'S' or @lcTraerTodosVisibleUsuario = 'S')
					And			b.cnsctvo_cdgo_tpo_dcmnto	=	@tipoDocumentoResponde
				End
		Else
			Begin
					Insert Into	@tbtiposimagenes
					Select		dscrpcn_tpo_imgn,				cdgo_tpo_imgn,			a.cnsctvo_cdgo_tpo_imgn
					From		bdGestionDocumental.dbo.tbtiposimagenes_vigencias		as	a
					inner join	bdGestionDocumental.dbo.tbTiposImagenesxTiposDocumento	as	b	On	a.cnsctvo_cdgo_tpo_imgn = b.cnsctvo_cdgo_tpo_imgn
					Where		a.cdgo_tpo_imgn	= @cdgo_tpo_imgn
					And			(a.vsble_usro		=  'S' Or @lcTraerTodosVisibleUsuario ='S')
					And			b.cnsctvo_cdgo_tpo_dcmnto	=	@tipoDocumentoResponde
			End
	End


If @orgn_aplccn		=	2
	Begin
		If @cdgo_tpo_imgn Is Null
			Begin
				If @lcCadenaSeleccion = '+' or @lcCadenaSeleccion Is Null
					Insert Into	@tbtiposimagenes
					Select		dscrpcn_tpo_imgn,				cdgo_tpo_imgn,			cnsctvo_cdgo_tpo_imgn
					From		bdGestionDocumental.dbo.tbtiposimagenes_vigencias
					Where		(vsble_usro  = 'S'	Or	@lcTraerTodosVisibleUsuario = 'S')
					And			cnsctvo_cdgo_tpo_imgn_fnte	=	@tipoDocumentoQuick
					Order By	dscrpcn_tpo_imgn
				Else
					Insert Into	@tbtiposimagenes
					Select		dscrpcn_tpo_imgn,				cdgo_tpo_imgn,			cnsctvo_cdgo_tpo_imgn
					From		bdGestionDocumental.dbo.tbtiposimagenes_vigencias
					Where		dscrpcn_tpo_imgn Like  '%' + ltrim(rtrim(@lcCadenaSeleccion) + '%' )
					And			(vsble_usro  = 'S' or @lcTraerTodosVisibleUsuario = 'S')
					And			cnsctvo_cdgo_tpo_imgn_fnte	=	@tipoDocumentoQuick
				End
		Else
			Begin
				Insert Into	@tbtiposimagenes
				Select		dscrpcn_tpo_imgn,				cdgo_tpo_imgn,			cnsctvo_cdgo_tpo_imgn
				From		bdGestionDocumental.dbo.tbtiposimagenes_vigencias
				Where		cdgo_tpo_imgn	= @cdgo_tpo_imgn
				And			(vsble_usro		=  'S' Or @lcTraerTodosVisibleUsuario ='S')
				And			cnsctvo_cdgo_tpo_imgn_fnte = @tipoDocumentoQuick
			End
	End


Select		cdgo_tpo_imgn,			dscrpcn_tpo_imgn,			cnsctvo_cdgo_tpo_imgn
From		@tbtiposimagenes





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [Administrador Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [Analista Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenes] TO [visosservice_role]
    AS [dbo];

