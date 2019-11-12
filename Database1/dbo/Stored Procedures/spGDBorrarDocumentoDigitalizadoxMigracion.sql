

-- =============================================
-- Author:		<sisogb01>
-- Create date: <26/03/2009>
-- Description:	<Borra todo lo que se hizo en yun proceso de migracion, cuando ha habido un error>
-- Exec dbo.spGDBorrarDocumentoDigitalizadoxMigracion '2009330154256998'Null,60007424,60007500
-- Exec dbo.spGDBorrarDocumentoDigitalizadoxMigracion 110
-- =============================================
CREATE PROCEDURE [dbo].[spGDBorrarDocumentoDigitalizadoxMigracion]
	@idntfcdr_unco varchar(100),
	@cnsctvo_cdgo_dcmnto_incl int = null,
	@cnsctvo_cdgo_dcmnto_fnl int = null,
	@cnsctvo_cdgo_prcso	int	 = null
AS
BEGIN
--SET NOCOUNT ON;

--GOTO Salida;


create table #idsDocs(cnsctvo_cdgo_dcmnto int)

if(@idntfcdr_unco is not null)
begin
	Insert Into  #idsDocs
	SELECT	cnsctvo_dcmnto_dgtlzdo
	FROM	dbo.tbTemporalRegistrosIndicesAgrupados with (nolock)
	where	(idntfcdr_unco like @idntfcdr_unco Or (@idntfcdr_unco Is Null))
	And		((@cnsctvo_cdgo_dcmnto_incl is Null Or cnsctvo_dcmnto_dgtlzdo >= @cnsctvo_cdgo_dcmnto_incl)
	And		(@cnsctvo_cdgo_dcmnto_fnl is Null Or cnsctvo_dcmnto_dgtlzdo <= @cnsctvo_cdgo_dcmnto_fnl))
	And		(cnsctvo_dcmnto_dgtlzdo Is Not Null)
end
if(@cnsctvo_cdgo_prcso is not null)
begin
	Insert Into  #idsDocs
	SELECT	cnsctvo_cdgo_dcmnto
	FROM	dbo.tbDocumentosDigitalizados with(nolock)
	where	cnsctvo_prcso_crga = @cnsctvo_cdgo_prcso
end


	----Inicio Borrado
	create table #idsImagenes (cnsctvo_cdgo_imgn int)

	Insert Into  #idsImagenes
	Select	a.cnsctvo_cdgo_imgn 
	From	dbo.tbImagenesxDocumentosDigitalizados	a  with(nolock)
	Inner Join	#idsDocs b On(a.cnsctvo_cdgo_dcmnto = b.cnsctvo_cdgo_dcmnto)

	Delete from dbo.tbIndicesxImagenesDigitalizadas with(rowlock)
	Where	cnsctvo_cdgo_imgn In (
		Select  cnsctvo_cdgo_imgn
		From	#idsImagenes
	)

	Delete from dbo.tbImagenesxDocumentosDigitalizados with(rowlock)
	Where	cnsctvo_cdgo_imgn In(
		Select  cnsctvo_cdgo_imgn
		From	#idsImagenes
	)

	Delete from dbo.tbIndicesxDocumentosDigitalizados with(rowlock)
	Where	cnsctvo_cdgo_dcmnto	In (
		Select  cnsctvo_cdgo_dcmnto
		From	#idsDocs
	)

	Delete from dbo.tbDocumentosDigitalizados with(rowlock)
	Where	cnsctvo_cdgo_dcmnto	 In(
		Select  cnsctvo_cdgo_dcmnto
		From	#idsDocs
	)

IF(@cnsctvo_cdgo_prcso is not null)
BEGIN
	Update  dbo.tbProcesosCargaImagenes with(rowlock)
	set		estdo = 2 --Borrado
	Where	cnsctvo_cdgo_prcso_crga_imgn = @cnsctvo_cdgo_prcso
END


--Salida:
  --  SELECT getdate()

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDBorrarDocumentoDigitalizadoxMigracion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDBorrarDocumentoDigitalizadoxMigracion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDBorrarDocumentoDigitalizadoxMigracion] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDBorrarDocumentoDigitalizadoxMigracion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDBorrarDocumentoDigitalizadoxMigracion] TO [visosservice_role]
    AS [dbo];

