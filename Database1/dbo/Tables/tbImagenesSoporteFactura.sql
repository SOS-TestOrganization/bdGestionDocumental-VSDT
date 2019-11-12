CREATE TABLE [dbo].[tbImagenesSoporteFactura] (
    [cnsctvo_cdgo_imgn]   INT                    NOT NULL,
    [cntdd_pgns]          INT                    NULL,
    [nmro_dsco]           INT                    NULL,
    [nmro_fctra]          VARCHAR (150)          NULL,
    [nmro_rdccn]          VARCHAR (150)          NULL,
    [cnsctvo_cdgo_sde]    INT                    NULL,
    [tpo_idntfccn]        VARCHAR (150)          NULL,
    [nmro_idntfccn]       VARCHAR (150)          NULL,
    [nmro_ops]            VARCHAR (150)          NULL,
    [nmro_ops2]           VARCHAR (150)          NULL,
    [tpo_dcmnto]          VARCHAR (150)          NULL,
    [rta]                 VARCHAR (150)          NULL,
    [cnsctvo_agrpdr_imgn] VARCHAR (150)          NULL,
    [nmbre_prvdr]         VARCHAR (150)          NULL,
    [cnsctvo_rcbro]       [dbo].[udtConsecutivo] NULL,
    CONSTRAINT [PK_tbImagenesSoporteFactura] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_imgn] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_tbImagenesSoporteFacturaIdentificacion]
    ON [dbo].[tbImagenesSoporteFactura]([nmro_idntfccn] ASC)
    ON [FG_INDEXES];


GO
CREATE NONCLUSTERED INDEX [IX_tbImagenesSoporteFacturaNoFactura]
    ON [dbo].[tbImagenesSoporteFactura]([nmro_fctra] ASC)
    ON [FG_INDEXES];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteFactura] TO [visosservice_role]
    AS [dbo];

