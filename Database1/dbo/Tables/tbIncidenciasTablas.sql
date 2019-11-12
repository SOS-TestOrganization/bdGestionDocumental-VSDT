CREATE TABLE [dbo].[tbIncidenciasTablas] (
    [cnsctvo_incdnca] [dbo].[udtConsecutivo]  NOT NULL,
    [cmpo_llve]       VARCHAR (100)           NOT NULL,
    [cmpo_llve_vlr]   VARCHAR (100)           NOT NULL,
    [nmbre_tbla]      [dbo].[udtNombreObjeto] NOT NULL,
    [nmbre_cmpo]      [dbo].[udtNombreObjeto] NOT NULL,
    [vlr_antrr]       VARCHAR (200)           NULL,
    [vlr_nvo]         VARCHAR (200)           NOT NULL,
    [usro_incdnca]    [dbo].[udtUsuario]      NOT NULL,
    [fcha_incdnca]    DATETIME                NOT NULL,
    [mqna_incdnca]    [dbo].[udtUsuario]      NOT NULL,
    CONSTRAINT [PK_tbIncidenciasTablas] PRIMARY KEY CLUSTERED ([cnsctvo_incdnca] ASC) WITH (FILLFACTOR = 95)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO PUBLIC
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO PUBLIC
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO PUBLIC
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO PUBLIC
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Salud]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbIncidenciasTablas] TO [Coordinador Cuentas Medicas]
    AS [dbo];

