CREATE TABLE [dbo].[tbImagenesSoporteNotificacion] (
    [cnsctvo_cdgo_imgn]   INT           NOT NULL,
    [fcha_dgtlzcn]        DATETIME      NULL,
    [cntdd_pgns]          INT           NULL,
    [nmro_dsco]           INT           NULL,
    [nmro_idntfccn]       VARCHAR (150) NULL,
    [nmro_acta]           INT           NULL,
    [nmbre_prsna]         VARCHAR (150) NULL,
    [rzn_scl]             VARCHAR (150) NULL,
    [cdd]                 VARCHAR (150) NULL,
    [arp]                 VARCHAR (150) NULL,
    [fcha]                VARCHAR (150) NULL,
    [blsa]                VARCHAR (150) NULL,
    [nmro]                VARCHAR (150) NULL,
    [tpo_dcmnto]          VARCHAR (150) NULL,
    [rta]                 VARCHAR (150) NULL,
    [cnsctvo_agrpdr_imgn] VARCHAR (150) NULL,
    [nmbre_prvdr]         VARCHAR (150) NULL,
    [cnsctvo_imgn_mgrcn]  INT           NULL,
    [cnsctvo_ntfccn]      INT           NULL,
    [cnsctvo_cdgo_sde]    INT           NULL,
    [cnsctvo_cdgo_ofcna]  INT           NULL,
    [vldccn]              INT           NULL,
    CONSTRAINT [PK_tbImagenesSoporteNotificacion] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_imgn] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_tbImagenesSoporteNotificacionIdentificacion]
    ON [dbo].[tbImagenesSoporteNotificacion]([nmro_idntfccn] ASC)
    ON [FG_INDEXES];


GO
CREATE NONCLUSTERED INDEX [IX_tbImagenesSoporteNotificacionActa]
    ON [dbo].[tbImagenesSoporteNotificacion]([nmro_acta] ASC)
    ON [FG_INDEXES];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesSoporteNotificacion] TO [visosservice_role]
    AS [dbo];

