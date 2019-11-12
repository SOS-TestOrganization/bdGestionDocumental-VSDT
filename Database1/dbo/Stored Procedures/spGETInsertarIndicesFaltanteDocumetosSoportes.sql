/*--------------------------------------------------------------------------------------------------------------------------------------              
* Procedimiento		:  dbo.spGETInsertarIndicesFaltanteDocumetosSoportes               
* Desarrollado por  : <\A Ing Dany Ladino - SEIT Consultores A\>                
* Descripción		: <\D Procedimiento que encargado insertar los indices faltantes
						  Por oficina y notificación
					   D\>     
* Observaciones		: <\O    O\>                
* Parámetros		: <\P    P\>
* Fecha Creación   : <\FC 2016/07/12 FC\>                 
*                
*---------------------------------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM  DM\>
* Nuevos Parametros	 	 : <\PM PM\>
* Nuevas Variables		 : <\VM VM\>
* Fecha Modificacion	 : <\FM  FM\>

*--------------------------------------------------------------------------------------------------------------------------*/

CREATE  PROCEDURE dbo.spGETInsertarIndicesFaltanteDocumetosSoportes
			
As

SET NOCOUNT ON
Begin
	--- Inserta en la tabla fisica
  	Insert Into tbIndicesxDocumentosDigitalizados 
		(
			cnsctvo_cdgo_dcmnto		,	cnsctvo_cdgo_tpo_dcmntl ,
			cnsctvo_cdgo_tpo_indce  ,	vlr						
		)

	Select 
			cnsctvo_cdgo_dcmnto		,	cnsctvo_cdgo_tpo_dcmntl ,
			cnsctvo_cdgo_tpo_indce  ,	vlr				   

	From tmpGETIndicesFaltantesxDocumentos

End

