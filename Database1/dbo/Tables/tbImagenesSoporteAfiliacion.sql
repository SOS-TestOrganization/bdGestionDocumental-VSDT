CREATE TABLE [dbo].[tbImagenesSoporteAfiliacion] (
    [cnsctvo_cdgo_imgn]    INT           NOT NULL,
    [anno]                 VARCHAR (150) NOT NULL,
    [cnsctvo_agrpdr_imgn]  VARCHAR (150) NULL,
    [fcha_dgtlzcn]         VARCHAR (50)  NULL,
    [cntdd_pgns]           INT           NULL,
    [nmro_dsco]            INT           NULL,
    [nmro_frmlro]          INT           NOT NULL,
    [nmro_idntfccn]        VARCHAR (150) NULL,
    [nmbre_prsna]          VARCHAR (150) NULL,
    [nmro_cntrto]          VARCHAR (150) NULL,
    [nmro_blsa]            INT           NULL,
    [tpo_aflcn]            VARCHAR (150) NULL,
    [nmbre_cntrto]         VARCHAR (150) NULL,
    [sde]                  VARCHAR (150) NULL,
    [tpo_dcmnto]           VARCHAR (150) NULL,
    [fcha_rdccn]           VARCHAR (50)  NULL,
    [nmro]                 VARCHAR (150) NULL,
    [rta]                  VARCHAR (150) NULL,
    [nmbre_prvdr]          VARCHAR (150) NULL,
    [fecha_digitalizacion] DATETIME      NULL,
    [fecha_radicacion]     DATETIME      NULL,
    [cnsctvo_imgn_mgrcn]   INT           NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteAfiliacion] TO [Unibase]
    AS [dbo];

