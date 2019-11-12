CREATE TABLE [dbo].[tbNumeroRadicacion] (
    [cnsctvo_cdgo_nmro_rdccn]     [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_nmro_rdccn] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_nmro_rdccn]          [dbo].[udtConsecutivo] NOT NULL,
    [fcha_rdccn]                  VARCHAR (20)           NOT NULL,
    [nmro_rdccn]                  VARCHAR (50)           NOT NULL,
    [cnsctvo_cdgo_dcmnto]         [dbo].[udtConsecutivo] NULL,
    CONSTRAINT [PK_tbNumeroRadicacion] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_nmro_rdccn] ASC),
    CONSTRAINT [FK1_tbNumeroRadicacion_tbTiposNumeroRadicacion] FOREIGN KEY ([cnsctvo_cdgo_tpo_nmro_rdccn]) REFERENCES [dbo].[tbTiposNumeroRadicacion] ([cnsctvo_cdgo_tpo_nmro_rdccn])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [KioskoCer]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [KioskoCer]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [KioskoCer]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [KioskoCer]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [KioskoCer]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbNumeroRadicacion] TO [visosservice_role]
    AS [dbo];

