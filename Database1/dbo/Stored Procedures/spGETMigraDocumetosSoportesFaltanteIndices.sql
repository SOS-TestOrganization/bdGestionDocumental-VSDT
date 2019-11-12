/*--------------------------------------------------------------------------------------------------------------------------------------              
* Procedimiento		:  dbo.spGETMigraDocumetosSoportesFaltanteIndices               
* Desarrollado por  : <\A Ing Dany Ladino - SEIT Consultores A\>                
* Descripción		: <\D Procedimiento que encargado Consultar los ducumentos soportes a los cuales le faltan los indices
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

CREATE  PROCEDURE [dbo].[spGETMigraDocumetosSoportesFaltanteIndices]  
			
As

SET NOCOUNT ON
Begin
	Declare		/*Tipos documentos buscar */
				@ttla 	 					udtConsecutivo = 3,		 --Tutela 
				@fllo_prmra_instnca 	 	udtConsecutivo = 37,	 --Fallo de primera instancia 
				@fllo_sgnda_instnca 	 	udtConsecutivo = 38,	 --Fallo de segunda instancia 
				@fllo_rvsn 	 				udtConsecutivo = 39,	 --Fallo de revisión de la corte constitucional 
				@nldd_dsps_fllo 	 		udtConsecutivo = 40,	 --Nulidad después de un fallo 
				@fllo_nldd_prmra_instnca 	udtConsecutivo = 41,	 --Fallo pos nulidad de Primera Instancia 
				@fllo_nldd_sgnda_instnca 	udtConsecutivo = 42,	 --Fallo pos nulidad de Segunda Instancia 
				@crrccn_fllo_ttla 	 		udtConsecutivo = 43,	 --Corrección de fallo de tutela 
				@ngcn_crrccn_fllo_ttla 	 	udtConsecutivo = 44,	 --Negación a solicitud de corrección de fallo de tutela 
				@aclrcn_fllo_ttla 	 		udtConsecutivo = 45,	 --Aclaración fallo tutela 
				@ngcn_aclrcn_fllo_ttla 	 	udtConsecutivo = 46,	 --Negación a solicitud de aclaración de fallo tutela 
				@sntnca_cmplmntra 	 		udtConsecutivo = 47,	 --Sentencia complementaria 
				@indmsn_impgncn 	 		udtConsecutivo = 48,	 --Inadmisión de la impugnación 
				@admsn_impgncn 	 			udtConsecutivo = 49,	 --Admisión de la impugnación
				@prcdnca_rvsn 	 			udtConsecutivo = 50,	 --Procedencia de la revisión
				@imprcdnca_rvsn 	 		udtConsecutivo = 51,	 --Improcedencia de la revisión
				@amplcn_ttla 	 			udtConsecutivo = 52,	 --Ampliación de Tutela
				@ngcn_prbs 	 				udtConsecutivo = 53,	 --Negación de Pruebas
				@mdda_prvsnal 	 			udtConsecutivo = 54,	 --Medida Provisional
				@nldd_ante_fllo 	 		udtConsecutivo = 55,	 --Nulidad Antes del Fallo
				@dsstmnto 	 				udtConsecutivo = 56		--Desistimiento

	 --Tabla temporal para el manejo de los tipos de documentos a buscar
	 Create table #tiposDocumentos (cnsctvo_cdgo_tpo_dcmntl udtConsecutivo) 
	 --Tabla temporal para los ducumentos sin indices
	  --Create table tmpGETDocumentosFaltantesXIndices (cnsctvo_cdgo_dcmnto udtConsecutivo,cnsctvo_cdgo_tpo_dcmntl udtConsecutivo) 

	 Create table #tbdocumentosIndicesMigrados(cnsctvo_cdgo_dcmnto int)

	 Create table #tbDocumentoUnicoTutela (cnsctvo_cdgo_dcmnto int)

	 -- Insertar los tipos de documentos a buscar
	 Insert Into #tiposDocumentos (cnsctvo_cdgo_tpo_dcmntl)
	 Values (@ttla)						,	(@fllo_prmra_instnca)		,	(@fllo_sgnda_instnca)		,	
			(@fllo_rvsn)				,	(@nldd_dsps_fllo)			,	(@fllo_nldd_prmra_instnca )	,		
			(@fllo_nldd_sgnda_instnca)	,	(@crrccn_fllo_ttla)			,	(@ngcn_crrccn_fllo_ttla)	,
			(@aclrcn_fllo_ttla)			,	(@ngcn_aclrcn_fllo_ttla)	,	(@sntnca_cmplmntra)			,
			(@indmsn_impgncn)			,	(@admsn_impgncn)			,	(@prcdnca_rvsn)				,
			(@imprcdnca_rvsn)			,	(@amplcn_ttla)				,	(@ngcn_prbs)				,
			(@mdda_prvsnal)				,	(@nldd_ante_fllo)			,	(@dsstmnto)
	
	--Borrar tabla temporal
	Truncate table  tmpGETDocumentosFaltantesXIndices

  /*
  Recupera el numero único de tutela de aquellos documentos digitalizados 
  que aun no tienen asociado los indices de numero de notificación ni consecutivo código oficina.

  select * from tmpGETDocumentosFaltantesXIndices
  */
	Insert #tbDocumentoUnicoTutela(cnsctvo_cdgo_dcmnto)
	Select cnsctvo_cdgo_dcmnto
	from BDGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados With (NoLock) 
	where cnsctvo_cdgo_tpo_indce=83


  Insert #tbdocumentosIndicesMigrados(cnsctvo_cdgo_dcmnto )
  Select b.cnsctvo_cdgo_dcmnto 
  from #tbDocumentoUnicoTutela as a inner join  BDGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados  b
  on a.cnsctvo_cdgo_dcmnto=b.cnsctvo_cdgo_dcmnto
  Where b.cnsctvo_cdgo_tpo_indce IN (5 /*Número de Notificación*/, 21 /*Consecutivo Codigo Oficina*/)
  --and b.cnsctvo_cdgo_dcmnto=16393799

  
	--Se insertan los documentos sin indices
  Insert Into tmpGETDocumentosFaltantesXIndices (
		cnsctvo_cdgo_dcmnto			,
		cnsctvo_cdgo_tpo_dcmntl		,
		cnsctvo_cdgo_ttla
		)
	--Se consulta los cnsctvo_cdgo_dcmnto que no tienen indices
  SELECT	indTut.cnsctvo_cdgo_dcmnto		,	/*documento*/
			indTut.cnsctvo_cdgo_tpo_dcmntl	,	/*tipo de documento*/
            indTut.vlr							/*Numero Único de Tutela*/
  FROM  BDGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados indTut  With (NoLock)
        LEFT JOIN #tbdocumentosIndicesMigrados indAdc  With (NoLock)
        ON indTut.cnsctvo_cdgo_dcmnto = indAdc.cnsctvo_cdgo_dcmnto
       	Inner Join #tiposDocumentos tmp
		On indTut.cnsctvo_cdgo_tpo_dcmntl = tmp.cnsctvo_cdgo_tpo_dcmntl
  WHERE indTut.cnsctvo_cdgo_tpo_indce = 83 /*Numero Único de Tutela*/
  AND indAdc.cnsctvo_cdgo_dcmnto IS NULL
  



	--Borrado de tablas temporales
	Drop table #tiposDocumentos

End

