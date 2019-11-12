/*-------------------------------------------------------------------------------------------------------------------
* Metodo o PRG 	         :   spTrasladoInformacionTmpDocDigitalizadosServiciosRecibidos
* Desarrollado por		 :  <\A   Javier Andres Agudelo     													A\>
* Descripcion			 :  <\D   Actualiza nombre del archivo de  imagene de servicios recibidos				D\>
* Observaciones		     :  <\O																					O\>
* Parametros			 :  <\P   																				P\>		
* Fecha Creacion		 :  <\FC  2015/02/03																	FC\>
*------------------------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION   
*------------------------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM Omar A. Granados AM\>
* Descripcion			 : <\DM Se ajusta calculo de ruta, porque no se estaba eliminando el '0' adicional que se le ingresa
								al calcular el mes, por ejemplo Octubre quedaba asi 010, en lugar de 10. DM\>
* Nuevos Parametros	 	 : <\PM  PM\>
* Nuevas Variables		 : <\VM  VM\>
* Fecha Modificacion	 : <\FM 2015/10/01 FM\>
*-----------------------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION   
*------------------------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM  AM\>
* Descripcion			 : <\DM  DM\>
* Nuevos Parametros	 	 : <\PM  PM\>
* Nuevas Variables		 : <\VM  VM\>
* Fecha Modificacion	 : <\FM  FM\>
*-----------------------------------------------------------------------------------------------------------------*/

--exec spTrasladoActualizaRutaArchivos

CREATE PROCEDURE [dbo].[spTrasladoActualizaRutaArchivos]

AS

SET NOCOUNT ON

BEGIN

	Declare @CantidadRegistros   Int;

	--creamos una tabla temporal para guardar las rutas modificadas
	Create table #tmpDocDigitlizadosServiciosRecibidos(
		cnsctvo_sprte_slctds_rcbds int NOT NULL,
		rutaArchivo varchar(500)
	)

	--Generamos los nuevos nombres de los archivos
	Insert into #tmpDocDigitlizadosServiciosRecibidos
	Select  cnsctvo_sprte_slctds_rcbds,ISNULL(rta_dcmnto_cmbnda,'')+CAST (YEAR(GETDATE()) As Varchar)+'\'+RIGHT('0'+CAST (MONTH(GETDATE()) As Varchar),2) +'\'+RIGHT('0' +CAST (DAY(GETDATE()) As Varchar),2)+'\' + CAST(cnsctvo_sprte_slctds_rcbds As Varchar)+ '_' + REVERSE(LEFT(REVERSE(rta_dcmnto),CHARINDEX('\', REVERSE(rta_dcmnto), 1) - 1)) As rutaArchivo 
	From    tmpDocDigitlizadosServiciosRecibidos With(NoLock) 



	--actualizamos las rutas 
	Update		dsr
	Set		    dsr.rta_dcmnto = tdr.rutaArchivo
	From		tmpDocDigitlizadosServiciosRecibidos As dsr With(NoLock)
	Inner Join	#tmpDocDigitlizadosServiciosRecibidos As tdr With(NoLock)
	On          dsr.cnsctvo_sprte_slctds_rcbds = tdr.cnsctvo_sprte_slctds_rcbds


	--Borramos la tabla temporal
	Drop table #tmpDocDigitlizadosServiciosRecibidos

END