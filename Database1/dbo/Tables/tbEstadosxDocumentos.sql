CREATE TABLE [dbo].[tbEstadosxDocumentos] (
    [cnsctvo_cdgo_estdo_pr_dcmnto] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_dcmnto]          [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_estdo_dcmnto]    [dbo].[udtConsecutivo] NOT NULL,
    [fcha_cmbo_estdo]              DATETIME               NOT NULL,
    [usro_cmbo_estdo]              [dbo].[udtUsuario]     NOT NULL,
    CONSTRAINT [PK_tbEstadosxDocumentos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_estdo_pr_dcmnto] ASC),
    CONSTRAINT [FK1_tbEstadosxDocumentos_tbDocumentosCorrespondencia] FOREIGN KEY ([cnsctvo_cdgo_dcmnto]) REFERENCES [dbo].[tbDocumentos] ([cnsctvo_cdgo_dcmnto]),
    CONSTRAINT [FK2_tbEstadosxDocumentos_tbEstadosDocumento] FOREIGN KEY ([cnsctvo_cdgo_estdo_dcmnto]) REFERENCES [dbo].[tbEstadosDocumento] ([cnsctvo_cdgo_estdo_dcmnto]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [KioskoCer]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [KioskoCer]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [KioskoCer]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [KioskoCer]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [KioskoCer]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstadosxDocumentos] TO [visosservice_role]
    AS [dbo];

