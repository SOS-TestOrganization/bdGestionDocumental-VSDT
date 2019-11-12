
/*-------------------------------------------------------------------------------------------------------------------
* Metodo o PRG 	         :   spCompletarInformacionTmpDocDigitalizadosServiciosRecibidos
* Desarrollado por		 :  <\A   Javier Andres Agudelo     		A\>
* Descripcion			 :  <\D   									D\>
* Observaciones		     :  <\O										O\>
* Parametros			 :  <\P   									P\>		
* Fecha Creacion		 :  <\FC  2015/02/03						FC\>
*------------------------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION   
*------------------------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM  AM\>
* Descripcion			 : <\DM  DM\>
* Nuevos Parametros	 	 : <\PM  PM\>
* Nuevas Variables		 : <\VM  VM\>
* Fecha Modificacion	 : <\FM  FM\>
*-----------------------------------------------------------------------------------------------------------------*/

--exec spCompletarInformacionTmpDocDigitalizadosServiciosRecibidos 237 

CREATE PROCEDURE [dbo].[spCompletarInformacionTmpDocDigitalizadosServiciosRecibidos]
	@cdgo_prcso int
AS

SET NOCOUNT ON

BEGIN

	Declare @CantidadRegistros   Int,
			@IndiceMaxDocumentos Int,
			@IndiceMaxImagenes   Int;


			--Preparamos las tablas que vamos a utilizar
			Create Table #tmpDocDigitlizadosServiciosRecibidos(
				idDocumento Int Identity (1,1)  NOT NULL,
				cnsctvo_sprte_slctds_rcbds Int  NULL,
				cnsctvo_cdgo_dcmnto BigInt NULL,
				cnsctvo_prcso_crga Int  NULL,
				rta_dcmnto Varchar(500)  NULL,
				rta_dcmnto_cmbnda Varchar(500) NULL
			)

			Create Table #tmpImagenxDocumento(
				cnsctvo_cdgo_dcmnto BigInt NULL,
				rta_dcmnto Varchar(500)  NULL,
				rta_dcmnto_cmbnda Varchar(500) NULL
			)
			
		--Obtenemos la cantidad de registros insertados en TmpDocDigitalizadosServiciosRecibidos para reservar indices
		Select @CantidadRegistros = Count(cnsctvo_sprte_slctds_rcbds) from tmpDocDigitlizadosServiciosRecibidos

		--Obtenemos el IdMaximo de tbDocumentosDigitalizados
		Select @IndiceMaxDocumentos = Max(cnsctvo_cdgo_dcmnto)+1 from tbDocumentosDigitalizados

		--Obtenemos el IdMaximo de tbImagenesxDocumentosDigitalizados
		Select @IndiceMaxImagenes = Max(cnsctvo_cdgo_imgn)+1 from tbImagenesxDocumentosDigitalizados

		--Reservamos los indices para los documentos
		Exec spGDCalcularConsecutivoDocumentoDigitalizado @CantidadRegistros

		--Reservamos los indices para las imagenes
		Exec spGDCalcularConsecutivoImagenDigitalizada @CantidadRegistros			
		    
		--Seteamos el inicio del Indice
		DBCC checkident ('#tmpDocDigitlizadosServiciosRecibidos', reseed, @IndiceMaxDocumentos)

		--Cargamos los Indices de Documentos
		Insert into #tmpDocDigitlizadosServiciosRecibidos
		Select cnsctvo_sprte_slctds_rcbds,
			   cnsctvo_cdgo_dcmnto,
			   cnsctvo_prcso_crga,
			   rta_dcmnto,
			   rta_dcmnto_cmbnda
		From   tmpDocDigitlizadosServiciosRecibidos


		--Actualizamos el numero de documento en la tabla tmpDocDigitlizadosServiciosRecibidos
		Update tmpDocDigitlizadosServiciosRecibidos
		Set    cnsctvo_cdgo_dcmnto = Tabla.idDocumento
		From   (
					Select idDocumento,cnsctvo_sprte_slctds_rcbds
					From   #tmpDocDigitlizadosServiciosRecibidos
			   ) As Tabla

		Where  tmpDocDigitlizadosServiciosRecibidos.cnsctvo_sprte_slctds_rcbds = Tabla.cnsctvo_sprte_slctds_rcbds

		--Pasamos los indices de documentos a tbDocumentosDigitalizados
		Insert Into tbDocumentosDigitalizados
		Select  IdDocumento,
				1,
				1,
				1,
				'2000-08-08 00:00:00',
				cnsctvo_prcso_crga,
				'S'
		From    #tmpDocDigitlizadosServiciosRecibidos
		

		--Cargamos en una tmp la relacion entre las rutas de las imagenes y los nuevos consecutivos de documento
		Insert into #tmpImagenxDocumento
		Select	idDocumento,
				rta_dcmnto,
				rta_dcmnto_cmbnda
	    From #tmpDocDigitlizadosServiciosRecibidos

		--Limpiamos la tabla #tmpDocDigitlizadosServiciosRecibidos
		Truncate Table #tmpDocDigitlizadosServiciosRecibidos


		--Seteamos el inicio del Indice
		DBCC checkident ('#tmpDocDigitlizadosServiciosRecibidos', reseed, @IndiceMaxImagenes)

		--Cargamos los Indices de Imagenes
		Insert into #tmpDocDigitlizadosServiciosRecibidos
		Select cnsctvo_sprte_slctds_rcbds,
			   cnsctvo_cdgo_dcmnto,
			   cnsctvo_prcso_crga,
			   rta_dcmnto,
			   rta_dcmnto_cmbnda
		From   tmpDocDigitlizadosServiciosRecibidos


		--Pasamos los indices de documentos a tbImagenesxDocumentosDigitalizados
		Insert Into tbImagenesxDocumentosDigitalizados
		Select  IdDocumento,
				cnsctvo_cdgo_dcmnto,
				106,
				'',
				'S',
				'A',
				'pdpartner'
		From    #tmpDocDigitlizadosServiciosRecibidos


		--Actualizamos tbImagenesxDocumentoDigitalizados con las rutas de las imagenes 

		Update tbImagenesxDocumentosDigitalizados 
		Set    rta_imgn = Tabla.rta_dcmnto
		From   (
				    Select cnsctvo_cdgo_dcmnto,
					       rta_dcmnto
				    From   #tmpImagenxDocumento
				)As Tabla
		Where   tbImagenesxDocumentosDigitalizados.cnsctvo_cdgo_dcmnto = Tabla.cnsctvo_cdgo_dcmnto


		--Limpiamos las temporales
		Drop Table #tmpDocDigitlizadosServiciosRecibidos
		Drop Table #tmpImagenxDocumento

END