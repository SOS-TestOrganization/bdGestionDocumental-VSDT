CREATE TABLE [dbo].[tbImagenesSoporteFactura_faltante] (
    [cnsctvo_cdgo_imgn]   INT           NOT NULL,
    [cntdd_pgns]          INT           NULL,
    [nmro_dsco]           INT           NULL,
    [nmro_fctra]          VARCHAR (150) NULL,
    [nmro_rdccn]          VARCHAR (150) NULL,
    [cnsctvo_cdgo_sde]    INT           NULL,
    [tpo_idntfccn]        VARCHAR (150) NULL,
    [nmro_idntfccn]       VARCHAR (150) NULL,
    [nmro_ops]            VARCHAR (150) NULL,
    [nmro_ops2]           VARCHAR (150) NULL,
    [tpo_dcmnto]          VARCHAR (150) NULL,
    [rta]                 VARCHAR (150) NULL,
    [cnsctvo_agrpdr_imgn] VARCHAR (150) NULL,
    [nmbre_prvdr]         VARCHAR (150) NULL,
    [cnsctvo_rcbro]       INT           NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteFactura_faltante] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura_faltante] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteFactura_faltante] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura_faltante] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteFactura_faltante] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura_faltante] TO [Unibase]
    AS [dbo];

