
/*-------------------------------------------------------------------------------------------------------------------
* Metodo o PRG 	         :   spTrasladoRutaCombinadaTmpDocDigitalizadosServiciosRecibidos
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

--exec spTrasladoRutaCombinadaTmpDocDigitalizadosServiciosRecibidos '\\Atlas\TestSharedFiles\CTCService\DescargaDoumentosSoporte\2015\2\6\'

CREATE PROCEDURE [dbo].[spTrasladoRutaCombinadaTmpDocDigitalizadosServiciosRecibidos]
	@rta_cmbnda varchar(500)
AS

SET NOCOUNT ON

BEGIN	

		UPDATE tmpDocDigitlizadosServiciosRecibidos SET
			   rta_dcmnto_cmbnda = @rta_cmbnda 
	
END