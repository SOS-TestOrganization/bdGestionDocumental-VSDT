CREATE TABLE [dbo].[tbafiliadosMarcados] (
    [cnsctvo_ntfccn]                INT            NOT NULL,
    [cnsctvo_cdgo_ofcna]            INT            NOT NULL,
    [cnsctvo_cdgo_mdlo]             INT            NOT NULL,
    [nmro_unco_idntfccn]            INT            NOT NULL,
    [cnsctvo_cdgo_csa_estdo_ntfccn] INT            NULL,
    [cnsctvo_cdgo_dgnstco]          INT            NOT NULL,
    [cnsctvo_cdgo_cntngnca]         INT            NOT NULL,
    [cnsctvo_cdgo_sde]              INT            NOT NULL,
    [fcha_ntfccn]                   DATETIME       NOT NULL,
    [cnsctvo_cdgo_ptlga_ctstrfca]   INT            NOT NULL,
    [cnsctvo_cdgo_clsfccn_evnto]    INT            NOT NULL,
    [cnsctvo_cdgo_estdo_ntfccn]     INT            NOT NULL,
    [cnsctvo_cdgo_ofcna_atrzcn]     INT            NULL,
    [nuam]                          NUMERIC (18)   NULL,
    [fcha_ultma_mdfccn]             DATETIME       NOT NULL,
    [usro_ultma_mdfccn]             CHAR (30)      NOT NULL,
    [obsrvcns]                      NVARCHAR (600) NULL,
    [tme_stmp]                      BINARY (8)     NULL,
    [cnsctvo_cdgo_mtdo_plnfccn]     INT            NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Unibase]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Consultor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Auditor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Auxiliar Prestaciones Medicas y Validacion de Derechos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [Coordinador Juridico Notificaciones]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbafiliadosMarcados] TO [310018 Auditor Salud Central]
    AS [dbo];

