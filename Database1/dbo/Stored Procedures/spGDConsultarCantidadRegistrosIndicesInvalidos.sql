
-- =============================================
-- Author:		<sisogb01>
-- Create date: <14/07/2009 >
-- Description:	<Devuelve la cantidad de registros indices invalidos de un proceso>
/* Declare @numero int
    Exec dbo.spGDConsultarCantidadRegistrosIndicesInvalidos 140,@numero output
   Select @numero
*/ 
-- =============================================
CREATE PROCEDURE [dbo].[spGDConsultarCantidadRegistrosIndicesInvalidos]
/*1*/	@cnsctvo_cdgo_prcso_crga int,
/*2*/	@numeroInvalidos		 int = Null output 
AS
BEGIN
	SET NOCOUNT ON;

	Select  @numeroInvalidos = count(*)
	From	dbo.tbRegistrosArchivosIndices 
	Where	cnsctvo_cdgo_prcso_crga_imgn = @cnsctvo_cdgo_prcso_crga
	And		estdo_vldcn = 1

	If(@numeroInvalidos > 0) -- Se Marca  para que no entre en los proximos procesos de carga.
	Begin
		Update	dbo.tbConfiguracionMigracionArchivosIndices
		Set		cnfgrcn_actva_indce = 'N',
				cnfgrcn_actva_mgrcn = 'N'
		Where	cnsctvo_cdgo_prcso_crga = @cnsctvo_cdgo_prcso_crga
	End
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarCantidadRegistrosIndicesInvalidos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarCantidadRegistrosIndicesInvalidos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarCantidadRegistrosIndicesInvalidos] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarCantidadRegistrosIndicesInvalidos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarCantidadRegistrosIndicesInvalidos] TO [visosservice_role]
    AS [dbo];

