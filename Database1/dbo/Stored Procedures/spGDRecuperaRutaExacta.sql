
CREATE PROCEDURE spGDRecuperaRutaExacta
AS
BEGIN
	DECLARE @contador	INT,
			@total		INT,
			@ruta		VARCHAR(MAX),
			@outputcmd	INT,
			@cmdstr		VARCHAR(150)

	DECLARE	@resultado	TABLE(outpt VARCHAR(MAX))

	SET		@contador	= 1
	SET		@total		= 1

	SELECT @total = count(cnsctvo) FROM #tbImagenesXDocumentosDigitalizados 

	WHILE  @contador <= @total
	BEGIN
		SELECT	@ruta =  rta_imgn
		FROM	#tbImagenesXDocumentosDigitalizados
		WHERE	cnsctvo = @contador
		--xp_cmdshell 'dir'
		SET @cmdstr = 'DIR ' + @ruta
		Insert into @resultado(outpt)
		EXEC @outputcmd = master..xp_cmdshell @cmdstr

		SELECT * FROM @resultado

		SET @contador = @contador + 1
	END 
END

/*
CREATE TABLE	#tbImagenesXDocumentosDigitalizados(cnsctvo int identity(1,1),cnsctvo_cdgo_dcmnto udtconsecutivo,cnsctvo_cdgo_imgn udtconsecutivo, rta_imgn VARCHAR(MAX))
INSERT INTO		#tbImagenesXDocumentosDigitalizados(cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_imgn,rta_imgn)
SELECT 13334684, 73585677, '\\ATLAS\ImagenOUT2\Digitalizacion\Cuentas Medicas\2012\11\23\00B5A292.TIF' UNION ALL
SELECT 13334684, 73585678, '\\ATLAS\ImagenOUT2\Digitalizacion\Cuentas Medicas\2012\11\23\00B5A294.TIF' UNION ALL
SELECT 13334684, 73585679, '\\ATLAS\ImagenOUT2\Digitalizacion\Cuentas Medicas\2012\11\23\00B5A295.TIF'

EXEC spGDRecuperaRutaExacta
SELECT * FROM #tbImagenesXDocumentosDigitalizados

DROP TABLE #tbImagenesXDocumentosDigitalizados
*/



/*
SELECT dbo.fnRecuperaRutaExacta('\\ATLAS\ImagenOUT2\Digitalizacion\Cuentas Medicas\2012\11\23\00B5A292.TIF')
*/