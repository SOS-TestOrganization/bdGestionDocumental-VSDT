CREATE TABLE [dbo].[tbAgrupadoresTiposImagenxTiposImagenes] (
    [cnsctvo_cdgo_agrpdr_tpo_imgn_x_tpo_imgn] [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                               DATETIME               NOT NULL,
    [usro_crcn]                               [dbo].[udtUsuario]     NOT NULL,
    [cnsctvo_cdgo_agrpdr_tpo_imgn]            [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_imgn]                   [dbo].[udtConsecutivo] NOT NULL,
    CONSTRAINT [PK_tbAgrupadoresTiposImagenxTiposImagenes] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_agrpdr_tpo_imgn_x_tpo_imgn] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IXFK_tbAgrupadoresTiposImagenxTiposImagenes_tbTiposImagenes]
    ON [dbo].[tbAgrupadoresTiposImagenxTiposImagenes]([cnsctvo_cdgo_tpo_imgn] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_tbAgrupadoresTiposImagenxTiposImagenes_tbAgrupadoresTiposImagen]
    ON [dbo].[tbAgrupadoresTiposImagenxTiposImagenes]([cnsctvo_cdgo_agrpdr_tpo_imgn] ASC);


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagenxTiposImagenes] TO [visosservice_role]
    AS [dbo];

