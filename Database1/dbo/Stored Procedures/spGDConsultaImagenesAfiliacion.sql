

/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  spGDConsultaImagenesAfiliacion
* Desarrollado por		 	: <\A Ing. Cesar García													A\>
* Descripcion			  	: <\D Consultar Imágenes Digitalizadas de Formularios de Afiliación		D\>
* Observaciones		        : <\O																	O\>
* Parametros			  	: <\P																	P\>
* Variables				  	: <\V  																	V\>
* Fecha Creacion	        : <\FC 2009/03/16														FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por				: <\AM  AM\>
* Descripcion				: <\DM 	DM\>
* Nuevos Parametros			: <\PM 	PM\>
* Nuevas Variables			: <\VM 	VM\>
* Fecha Modificacion			: <\FM 	FM\>
*---------------------------------------------------------------------------------*/

CREATE Procedure [dbo].[spGDConsultaImagenesAfiliacion]
	@nmro_frmlro				Varchar(10),
	@cdgo_tpo_idntfccn			Varchar(3),
	@nmro_idntfccn				Varchar(15),
	@cnsctvo_cdgo_tpo_dcmntl	udtConsecutivo

As

Set Nocount On
--set @cnsctvo_cdgo_rcbro = 184473


Select		'NO SELECCIONADO' AS accn,		b.rta_imgn,			b.prncpl
From		tbIndicesxDocumentosDigitalizados	a
Inner Join	tbImagenesxDocumentosDigitalizados	b	On	b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto
Where		a.cnsctvo_cdgo_tpo_indce	In	(1,7,10)  -- # Número Id - Tipo Id - Número Formulario
And			a.cnsctvo_cdgo_tpo_dcmntl	=	@cnsctvo_cdgo_tpo_dcmntl
And			((a.vlr	= @nmro_frmlro Or @nmro_frmlro Is Null)	Or	(a.vlr	=	@cdgo_tpo_idntfccn Or @cdgo_tpo_idntfccn Is Null)
			Or (a.vlr = @nmro_idntfccn Or @nmro_idntfccn Is Null))
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesAfiliacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesAfiliacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesAfiliacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesAfiliacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesAfiliacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaImagenesAfiliacion] TO [visosservice_role]
    AS [dbo];

