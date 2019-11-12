/*--------------------------------------------------------------------------------------------------------------------------------------              
* Procedimiento		:  dbo.[spCTCConsultarTiposImagenes]               
* Desarrollado por  : <\A Adriana Cárdenas - Heinsohn Business Technology A\>                
* Descripción		: <\D Procedimiento que permite consultar el tipo de imagen.D\>     
* Observaciones		: <\O Se crea el procedimiento por inspecciones de codigo de la SOS   O\>                
* Parámetros		: <\P    P\>
* Fecha Creación   : <\FC 2015/02/18 FC\>                 
*                
*--------------------------------------------------------------------------------------------------------------------------------------   
* DATOS DE MODIFICACION
*--------------------------------------------------------------------------------------------------------------------------------------   
* Modificado Por		 : <\AM Ing. Victor Hugo Gil Ramos AM\>
* Descripcion			 : <\DM Se ajusta procedimiento con las politicas de desarrollo de SOS DM\>
* Nuevos Parametros	 	 : <\PM PM\>
* Nuevas Variables		 : <\VM VM\>
* Fecha Modificacion	 : <\FM 2016/09/29 FM\>
*--------------------------------------------------------------------------------------------------------------------------------------*/

--exec spCTCConsultarTiposImagenes
CREATE PROCEDURE [dbo].[spCTCConsultarTiposImagenes]
		
AS
SET NOCOUNT ON

Begin

	Declare @visible		Char(1),
			@tipoDocumento	Int     
	
	Create 
	Table #tempTiposImagenes (tipoImagen			Int,
							  descripcionTipoImagen	Varchar(150),
							  fechaInicio			Datetime,
							  fechaFin				Datetime)
	
	Set @visible		= 'S'
	Set @tipoDocumento	= 1						 					 
	
	Insert 
	Into   #tempTiposImagenes(tipoImagen , descripcionTipoImagen,
	                          fechaInicio, fechaFin
							 )
	Select		a.cnsctvo_cdgo_tpo_imgn, a.dscrpcn_tpo_imgn, 
	            b.inco_vgnca	       , b.fn_vgnca
	From		tbTiposImagenes a With (NoLock)
	Inner Join	tbTiposImagenes_Vigencias b With (NoLock)
	On			a.cnsctvo_cdgo_tpo_imgn		= b.cnsctvo_cdgo_tpo_imgn
	Inner Join	tbTiposImagenesxTiposDocumento c With (NoLock)
	On			a.cnsctvo_cdgo_tpo_imgn		= c.cnsctvo_cdgo_tpo_imgn
	Where		b.vsble_usro				= @visible
	And			c.cnsctvo_cdgo_tpo_dcmnto	= @tipoDocumento
	
	Select	tipoImagen , descripcionTipoImagen, 
	        fechaInicio, fechaFin
	From	#tempTiposImagenes With (NoLock) 
	
	Drop Table #tempTiposImagenes
End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCTCConsultarTiposImagenes] TO [ctc_webusr]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCTCConsultarTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCTCConsultarTiposImagenes] TO [visosservice_role]
    AS [dbo];

