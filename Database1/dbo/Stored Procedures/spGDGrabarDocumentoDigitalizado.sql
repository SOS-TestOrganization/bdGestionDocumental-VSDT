

/* =============================================
-- Author:		<sisogb01>
-- Create date: <16/03/2009>
-- Description:	< Guarda un nuevo docuemnto digitalizado>
begin tran
exec dbo.spGDGrabarDocumentoDigitalizado 1000000000,1,1,1,'20100415'
rollback tran
-- =============================================
================================================
-- Modified by:	<sisogb01>
-- Modified date: <16/03/2009>
-- Description:	<Se cambia el campo tipo documental por tipo de documento, puesto que en esa campo ([cnsctvo_cdgo_tpo_dcmntl]) de la tabla ([tbDocumentosDigitalizados]) debe ir el tipo de documento>
Begin tran
exec dbo.spGDGrabarDocumentoDigitalizado 1000000000,1,1,1,'20100415'
Rollback tran
-- =============================================
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Omar Granados  AM\>
* Descripcion			 : <\DM  Se modifica la forma de consultar el consecutivo, ahora se usa variable de salida en lugar de retornar desde un Sp DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM 2017/05/18  FM\>
*---------------------------------------------------------------------------------*/

CREATE PROCEDURE [dbo].[spGDGrabarDocumentoDigitalizado]
			@cnsctvo_cdgo_dcmnto udtConsecutivo output,
			@cnsctvo_tpo_dcmnto udtConsecutivo,
			@nmro_imgns udtConsecutivo,
			@cnsctvo_cdgo_dgtlzdr udtConsecutivo,
			@fcha_dgtlzcn datetime
AS
SET NOCOUNT ON
BEGIN

Declare @cnsctvo_cdgo_tpo_dcmntl udtConsecutivo
Declare @nvo_cnsctvo_dcmnto udtConsecutivo

Select @cnsctvo_cdgo_tpo_dcmntl = @cnsctvo_tpo_dcmnto --dbo.fnGDCalcularTipoDocumentalxTipoDocumento(@cnsctvo_tpo_dcmnto ) 

/** Calcular Consecutivo */
Exec [dbo].[spGDCalcularConsecutivo] @cnsctvo_cdgo_dcmnto = @nvo_cnsctvo_dcmnto Output, @cnsctvo_opcn_ejccn = 3

INSERT INTO [bdGestionDocumental].[dbo].[tbDocumentosDigitalizados]
           ([cnsctvo_cdgo_dcmnto]
           ,[cnsctvo_cdgo_tpo_dcmntl]
           ,[nmro_imgns]
           ,[cnsctvo_cdgo_dgtlzdr]
           ,[fcha_dgtlzcn])
VALUES
          (@nvo_cnsctvo_dcmnto,
           @cnsctvo_cdgo_tpo_dcmntl,
           @nmro_imgns,
           @cnsctvo_cdgo_dgtlzdr,
           @fcha_dgtlzcn)

	select @nvo_cnsctvo_dcmnto cnsctvo_cdgo_dcmnto
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizado] TO [800008 Administrador Captacion Ingresos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizado] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizado] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizado] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizado] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizado] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizado] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizado] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizado] TO [visosservice_role]
    AS [dbo];

