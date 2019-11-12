
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDGrabarIndicexImagenDigitalizada
* Desarrollado por:		<\A	Omar Granados				A\>
* Descripcion:			<\D	Asocia un indice a un documento digitalizado	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P   	P\>
* Variables:			<\V		V\>
* Fecha Creacion:		<\FC	15/04/2010	FC\>
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
CREATE PROCEDURE [dbo].[spGDGrabarIndicexImagenDigitalizada]
(
@cnsctvo_dcmto_dgtlzdo		udtConsecutivo,
@cnsctvo_cdgo_imgn			udtConsecutivo,
@cnsctvo_tpo_indce			udtConsecutivo,
@vlr						varchar(255)
)

As
Set Nocount On

Declare		@cnsctvo_cdgo_tpo_dcmntl    udtConsecutivo

Select		@cnsctvo_cdgo_tpo_dcmntl = cnsctvo_cdgo_tpo_dcmntl
From		BDGestionDocumental.dbo.tbDocumentosDigitalizados	With(NoLock)
Where		cnsctvo_cdgo_dcmnto = @cnsctvo_dcmto_dgtlzdo

INSERT INTO [bdGestionDocumental].[dbo].[tbIndicesxImagenesDigitalizadas]
           ([cnsctvo_cdgo_imgn]
           ,[cnsctvo_cdgo_dcmnto]
           ,[cnsctvo_cdgo_tpo_dcmntl]
           ,[cnsctvo_cdgo_tpo_indce]
           ,[vlr])
     VALUES
           (@cnsctvo_cdgo_imgn
           ,@cnsctvo_dcmto_dgtlzdo
           ,@cnsctvo_cdgo_tpo_dcmntl
           ,@cnsctvo_tpo_indce
           ,@vlr)
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicexImagenDigitalizada] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicexImagenDigitalizada] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicexImagenDigitalizada] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicexImagenDigitalizada] TO [visosservice_role]
    AS [dbo];

