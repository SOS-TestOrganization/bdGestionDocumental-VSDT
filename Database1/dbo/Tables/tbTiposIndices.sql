CREATE TABLE [dbo].[tbTiposIndices] (
    [cnsctvo_cdgo_tpo_indce] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_indce]             CHAR (4)               NOT NULL,
    [dscrpcn_tpo_indce]      [dbo].[udtDescripcion] NOT NULL,
    [tpo_dato]               CHAR (1)               NULL,
    [tmno]                   INT                    NULL,
    [fcha_crcn]              DATETIME               NOT NULL,
    [usro_crcn]              [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]             [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbIndices] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_tpo_indce] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposIndices] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposIndices] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Unibase]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Auditor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Auditor Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposIndices] TO [Auditor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposIndices] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposIndices] TO [970009 Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [970009 Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposIndices] TO [970009 Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Auditor Autorizador CNA]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposIndices] TO [Auditor Autorizador CNA]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposIndices] TO [Auditor Autorizador CNA]
    AS [dbo];

