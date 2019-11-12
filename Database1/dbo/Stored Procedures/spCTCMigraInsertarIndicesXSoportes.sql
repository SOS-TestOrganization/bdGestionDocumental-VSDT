/*--------------------------------------------------------------------------------------------------------------------------------------              
* Procedimiento		:  dbo.[spCTCMigraInsertarIndicesXSoportes]               
* Desarrollado por  : <\A Ing Warner Valencia - SEIT Consultores A\>                
* Descripción		: <\D Procedimiento que encargado de crear los indices por soportes en el proceso de migracion
							Control de cambios CTC_FCC_037 D\>     
* Observaciones		: <\O    O\>                
* Parámetros		: <\P    P\>
* Fecha Creación   : <\FC 2015/05/05 FC\>                 
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

CREATE  PROCEDURE [dbo].[spCTCMigraInsertarIndicesXSoportes]  
			
As

SET NOCOUNT ON
Begin

		Declare @cnsctvo_indce_dcmnto int, @cnsctvo_cdgo_tpo_dcmntl int

		Set @cnsctvo_cdgo_tpo_dcmntl =0

		Select @cnsctvo_indce_dcmnto = max(cnsctvo_indce_dcmnto) 
		From  dbo.tbIndicesxDocumentosDigitalizados  With (NoLock)
	

		Insert Into  dbo.tbIndicesxDocumentosDigitalizados
		Select  cnsctvo_dcmnto, @cnsctvo_cdgo_tpo_dcmntl, cnsctvo_cdgo_tpo_indce, vlr
		From tmpCTCResultadosSoportesParaGeneracionIndices
	

		--Delete From tmpCTCResultadosSoportesParaGeneracionIndices
End

/*
select * from tmpCTCResultadosSoportesParaGeneracionIndices
*/
