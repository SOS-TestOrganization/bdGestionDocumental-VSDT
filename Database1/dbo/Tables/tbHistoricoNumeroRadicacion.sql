CREATE TABLE [dbo].[tbHistoricoNumeroRadicacion] (
    [cnsctvo_cdgo_nmro_rdccn]     [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_nmro_rdccn] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_nmro_rdccn]          [dbo].[udtConsecutivo] NOT NULL,
    [fcha_rdccn]                  VARCHAR (20)           NOT NULL,
    [nmro_rdccn]                  VARCHAR (50)           NOT NULL,
    [cnsctvo_cdgo_dcmnto]         [dbo].[udtConsecutivo] NULL,
    CONSTRAINT [PK_tbNumeroRadicacion2] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_nmro_rdccn] ASC),
    CONSTRAINT [FK1_tbNumeroRadicacion2_tbTiposNumeroRadicacion] FOREIGN KEY ([cnsctvo_cdgo_tpo_nmro_rdccn]) REFERENCES [dbo].[tbTiposNumeroRadicacion] ([cnsctvo_cdgo_tpo_nmro_rdccn])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbHistoricoNumeroRadicacion] TO [visosservice_role]
    AS [dbo];

