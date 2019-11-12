

/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDGrabarImagenxDocumentosDigitalizado
* Desarrollado por:		<\A	Ing. Omar Grandados	A\>
* Descripcion:			<\D	Ingresa Indice de Imagen Digitalizada	D\>
* Parametros:			<\P   	P\>
* Fecha Creacion:		<\FC	15/04/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM	Andres Taborda	AM\>
* Descripcion:				<\DM	Ajuste Para Orion no Guarde el nombre del Servidor	DM\>
* Nuevos Parametros:		<\PM		PM\>
* Nuevas Variables:			<\VM		VM\>
* Fecha Modificacion:		<\FM	2016/09/02	FM\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM	Omar Granados	AM\>
* Descripcion:				<\DM	Ajuste para que no se use el 'cnsctvo_cdgo_dcmnto' generado, sino que se use el que entra como parametro	DM\>
* Nuevos Parametros:		<\PM		PM\>
* Nuevas Variables:			<\VM		VM\>
* Fecha Modificacion:		<\FM	2017/08/02	FM\>
*---------------------------------------------------------------------------------*/

CREATE PROCEDURE [dbo].[spGDGrabarImagenxDocumentosDigitalizado]
(
		   @cnsctvo_cdgo_dcmnto   udtConsecutivo,
           @cnsctvo_cdgo_tpo_imgn udtConsecutivo,
           @rta_imgn			  varchar(250),
           @prncpl				  char(1)
)
AS 
SET NOCOUNT ON
DECLARE @cnsctvo_cdgo_imgn	udtConsecutivo,
		@cnsctvo_opcn_ejccn	udtConsecutivo,
		@servidorImagenes varchar(150),
		@lnConsecutivoServImagenes int=6,
		@cnsctvo_cdgo_dcmnto_actl udtConsecutivo


Select @servidorImagenes= vlr_prmtro_crctr 
from BDGestionDocumental.dbo.tbParametrosGenerales_Vigencias 
where cnsctvo_cdgo_prmtro_gnrl= @lnConsecutivoServImagenes
and getdate() between inco_vgnca and fn_vgnca



-- Ajuste siscgm01 2012-07-18
Set		@cnsctvo_opcn_ejccn = 2
Exec	spGDCalcularConsecutivo @cnsctvo_cdgo_dcmnto_actl Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn
-- Ajuste siscgm01 2012-07-18

set @rta_imgn=  replace(@rta_imgn,@servidorImagenes,'')


INSERT INTO [bdGestionDocumental].[dbo].[tbImagenesxDocumentosDigitalizados]
           (cnsctvo_cdgo_imgn
			,[cnsctvo_cdgo_dcmnto]
           ,[cnsctvo_cdgo_tpo_imgn]
           ,[rta_imgn]
           ,[prncpl])
     VALUES
           (@cnsctvo_cdgo_imgn,
		   @cnsctvo_cdgo_dcmnto,
           @cnsctvo_cdgo_tpo_imgn,
           @rta_imgn ,
           @prncpl)


Select  @cnsctvo_cdgo_imgn as cnsctvo_cdgo_imgn


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenxDocumentosDigitalizado] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenxDocumentosDigitalizado] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenxDocumentosDigitalizado] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenxDocumentosDigitalizado] TO [visosservice_role]
    AS [dbo];

