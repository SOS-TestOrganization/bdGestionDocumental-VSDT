CREATE TABLE [dbo].[tbDocumentos] (
    [cnsctvo_cdgo_dcmnto]     [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_nmro_rdccn] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_dcmnto]             VARCHAR (100)          NULL,
    [cnsctvo_cdgo_tpo_dcmnto] [dbo].[udtConsecutivo] NULL,
    [dscrpcn_dcmnto]          TEXT                   NULL,
    [fcha_crcn]               DATETIME               NOT NULL,
    CONSTRAINT [PK_tbDocumentos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_dcmnto] ASC),
    CONSTRAINT [FK1_tbDocumentosCorrespondencia_tbNumeroRadicacion] FOREIGN KEY ([cnsctvo_cdgo_nmro_rdccn]) REFERENCES [dbo].[tbNumeroRadicacion] ([cnsctvo_cdgo_nmro_rdccn])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentos] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDocumentos] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentos] TO [KioskoCer]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [KioskoCer]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDocumentos] TO [KioskoCer]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [KioskoCer]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [KioskoCer]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentos] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDocumentos] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentos] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentos] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDocumentos] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentos] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentos] TO [visosservice_role]
    AS [dbo];

