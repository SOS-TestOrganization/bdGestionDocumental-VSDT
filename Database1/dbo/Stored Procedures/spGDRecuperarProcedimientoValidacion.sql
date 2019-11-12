
CREATE Procedure	[dbo].[spGDRecuperarProcedimientoValidacion]
@cnsctvo_cdgo_tpo_dcmnto	Int,
@dscrpcn_prcdmnto_vldcn		Varchar(150)	Output

As
Set Nocount On


Select		@dscrpcn_prcdmnto_vldcn		=	Ltrim(Rtrim(dscrpcn_prcdmnto_vldcn))
From		bdGestionDocumental.dbo.tbProcedimientosValidacionxTipoDocumento
Where		cnsctvo_cdgo_tpo_dcmnto		=	@cnsctvo_cdgo_tpo_dcmnto
And			vsble_usro					=	'S'
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcedimientoValidacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcedimientoValidacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcedimientoValidacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcedimientoValidacion] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcedimientoValidacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarProcedimientoValidacion] TO [visosservice_role]
    AS [dbo];

