CREATE TABLE [dbo].[tbProcedimientosValidacionxTipoDocumento] (
    [cnsctvo_cdgo_prcdmnto_vldcn_pr_tpo_dcmnto] INT           IDENTITY (1, 1) NOT NULL,
    [dscrpcn_prcdmnto_vldcn]                    VARCHAR (150) NULL,
    [fcha_crcn]                                 DATETIME      NULL,
    [usro_crcn]                                 VARCHAR (15)  NULL,
    [vsble_usro]                                CHAR (1)      NULL,
    [cnsctvo_cdgo_tpo_dcmnto]                   INT           NULL,
    CONSTRAINT [PK_tbProcedimientosValidacionxTipoDocumento] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_prcdmnto_vldcn_pr_tpo_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcedimientosValidacionxTipoDocumento] TO [Unibase]
    AS [dbo];

