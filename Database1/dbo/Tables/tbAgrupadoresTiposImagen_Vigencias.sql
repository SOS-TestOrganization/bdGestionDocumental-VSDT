CREATE TABLE [dbo].[tbAgrupadoresTiposImagen_Vigencias] (
    [cnsctvo_vgnca_agrpdr_tpo_imgn]  [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_agrpdr_tpo_imgn]   [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_agrpdr_tpo_imgn]           [dbo].[udtCodigo]      NOT NULL,
    [dscrpcn_agrpdr_tpo_imgn]        [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                     DATETIME               NOT NULL,
    [fn_vgnca]                       DATETIME               NOT NULL,
    [fcha_crcn]                      DATETIME               NOT NULL,
    [usro_crcn]                      [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                       [dbo].[udtObservacion] NOT NULL,
    [vsble_usro]                     [dbo].[udtLogico]      NOT NULL,
    [tme_stmp]                       ROWVERSION             NOT NULL,
    [cnsctvo_cdgo_estrctra_arbl_vsr] [dbo].[udtConsecutivo] NOT NULL,
    [ordn]                           [dbo].[udtConsecutivo] NOT NULL,
    CONSTRAINT [PK_tbAgrupadoresTiposImagenVigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_agrpdr_tpo_imgn] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IXFK_tbAgrupadoresTiposImagen_Vigencias_tbEstructurasArbolVisor]
    ON [dbo].[tbAgrupadoresTiposImagen_Vigencias]([cnsctvo_cdgo_estrctra_arbl_vsr] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_tbAgrupadoresTiposImagen_Vigencias_tbAgrupadoresTiposImagen]
    ON [dbo].[tbAgrupadoresTiposImagen_Vigencias]([cnsctvo_cdgo_agrpdr_tpo_imgn] ASC);


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen_Vigencias] TO [visosservice_role]
    AS [dbo];

