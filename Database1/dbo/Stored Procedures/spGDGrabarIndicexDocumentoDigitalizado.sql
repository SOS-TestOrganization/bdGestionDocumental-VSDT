
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDGrabarIndicexDocumentoDigitalizado
* Desarrollado por:		<\A	Omar Granados				A\>
* Descripcion:			<\D	Asocia un indice a un documento digitalizado	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P   	P\>
* Variables:			<\V		V\>
* Fecha Creacion:		<\FC	14/04/2010	FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM		AM\>
* Descripcion:				<\DM		DM\>
* Nuevos Parametros:		<\PM		PM\>
* Nuevas Variables:			<\VM		VM\>
* Fecha Modificacion:		<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spGDGrabarIndicexDocumentoDigitalizado]
(
@cnsctvo_dcmto_dgtlzdo		udtConsecutivo,
@cnsctvo_tpo_indce			udtConsecutivo,
@vlr						varchar(255)
)
As
Set Nocount On

Declare		@cnsctvo_cdgo_tpo_dcmntl    udtConsecutivo

Select		@cnsctvo_cdgo_tpo_dcmntl = cnsctvo_cdgo_tpo_dcmntl
From		BDGestionDocumental.dbo.tbDocumentosDigitalizados	With(NoLock)
Where		cnsctvo_cdgo_dcmnto = @cnsctvo_dcmto_dgtlzdo

INSERT INTO [dbo].[tbIndicesxDocumentosDigitalizados]
           ([cnsctvo_cdgo_dcmnto]
           ,[cnsctvo_cdgo_tpo_dcmntl]
           ,[cnsctvo_cdgo_tpo_indce]
           ,[vlr])
SELECT		@cnsctvo_dcmto_dgtlzdo,
			@cnsctvo_cdgo_tpo_dcmntl,
			@cnsctvo_tpo_indce,
			@vlr
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicexDocumentoDigitalizado] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicexDocumentoDigitalizado] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicexDocumentoDigitalizado] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicexDocumentoDigitalizado] TO [visosservice_role]
    AS [dbo];

