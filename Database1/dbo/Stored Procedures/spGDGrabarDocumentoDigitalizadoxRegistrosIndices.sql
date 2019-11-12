
-- =============================================
-- Author:		<sisogb01>
-- Create date: <17/03/2009>
-- Description:	<...>
-- =============================================

/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDGrabarDocumentoDigitalizadoxRegistrosIndices
* Desarrollado por		 :  <\A   sisogb01		A\>
* Descripcion			 :  <\D  Inserta los registros no agrupados desde tbTemporalRegistrosIndicesAgrupados hasta tbDocumentosDigitalizados D\>
* Observaciones		     :  <\O	     O\>
* Parametros			 :  <\P   @idntfcdr_unco: Es el numero unico identificador del proceso P\>
						 :  <\P   @cnsctvo_cdgo_dgtlzdr: Es el consecutivo del digitalizador P\>
* Variables				 :  <\V					V\>
* Fecha Creacion		 :  <\FC	17/03/2009	FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM  sisogb01 AM\>
* Descripcion			 : <\DM  Se modifica para que use los consecutivos devueltos por el procedimiento  spGDCalcularConsecutivoDocumentoDigitalizado DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  22/09/2011 FM\>
/*
Update tbTemporalRegistrosIndicesAgrupados
Set mgrdo = 'N',cnsctvo_prcso_crga =  -10000,cnsctvo_dcmnto_dgtlzdo=Null
Where  cnsctvo_prcso_crga = ?
	Exec [spGDGrabarDocumentoDigitalizadoxRegistrosIndices] '2011771249890',2

Select * From dbo.tbDocumentosDigitalizados where cnsctvo_prcso_crga = -10000
Delete From dbo.tbDocumentosDigitalizados where cnsctvo_prcso_crga = -10000
*/
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spGDGrabarDocumentoDigitalizadoxRegistrosIndices]
			@idntfcdr_unco			 [varchar](20),
			@cnsctvo_cdgo_dgtlzdr	 int
AS
BEGIN

Declare @consecFin Int,@consecIni Int,@total Int
Declare @tbConsecutivos Table(consecFin Int,consecIni Int)

Select		@total = count(*)
From		dbo.tbTemporalRegistrosIndicesAgrupados
Where		idntfcdr_unco = @idntfcdr_unco
And			mgrdo = 'N'
And			cnsctvo_dcmnto_dgtlzdo Is Null

--print 'total '+ cast(@total as varchar(10))
If(@total = 0)
Begin
	/*No hay registros */
	Return 0
End

/** Calcular */
Insert into @tbConsecutivos(consecFin,consecIni)
Exec spGDCalcularConsecutivoDocumentoDigitalizado @total

Select	@consecFin = consecFin,
		@consecIni = consecIni
From	@tbConsecutivos

--print 'consecFin '+ cast(@consecFin as varchar(10))
--print 'consecIni '+ cast(@consecIni as varchar(10))


Begin Tran insertDocsDigits
	INSERT INTO [dbo].[tbDocumentosDigitalizados](
				[cnsctvo_cdgo_dcmnto]
			   ,[cnsctvo_cdgo_tpo_dcmntl],		[nmro_imgns]
			   ,[cnsctvo_cdgo_dgtlzdr],			[fcha_dgtlzcn]
			   ,cnsctvo_prcso_crga,estdo_rgstro
	)
	SELECT		(cnsctvo_tmpral + @consecIni) as	cnsctvo_dcmnto_dgtlzdo,
				cnsctvo_cdgo_tpo_dcmnto,		numeroImagenes,
				@cnsctvo_cdgo_dgtlzdr,			Convert(datetime,fcha_dgtlzcn,103) as fcha_dgtlzcn,
				cnsctvo_prcso_crga,'S'
	FROM		dbo.tbTemporalRegistrosIndicesAgrupados
	WHERE		idntfcdr_unco = @idntfcdr_unco
	AND			mgrdo = 'N'
	AND			cnsctvo_dcmnto_dgtlzdo Is Null

Commit Tran insertDocsDigits	

	-- Se marca mgrdo = 'S' para evitar que se migre mas de una vez
	Update		dbo.tbTemporalRegistrosIndicesAgrupados
	Set			mgrdo = 'S',
				cnsctvo_dcmnto_dgtlzdo = (cnsctvo_tmpral + @consecIni)
	Where		idntfcdr_unco = @idntfcdr_unco
	AND			mgrdo = 'N'
	And			cnsctvo_dcmnto_dgtlzdo Is Null 

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizadoxRegistrosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizadoxRegistrosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizadoxRegistrosIndices] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizadoxRegistrosIndices] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizadoxRegistrosIndices] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizadoxRegistrosIndices] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizadoxRegistrosIndices] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentoDigitalizadoxRegistrosIndices] TO [visosservice_role]
    AS [dbo];

