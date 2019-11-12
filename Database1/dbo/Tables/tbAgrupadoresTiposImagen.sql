CREATE TABLE [dbo].[tbAgrupadoresTiposImagen] (
    [cnsctvo_cdgo_agrpdr_tpo_imgn] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_agrpdr_tpo_imgn]         [dbo].[udtCodigo]      NOT NULL,
    [dscrpcn_agrpdr_tpo_imgn]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                    DATETIME               NOT NULL,
    [usro_crcn]                    [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                   [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbAgrupadoresTiposImagen] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_agrpdr_tpo_imgn] ASC)
);


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadoresTiposImagen] TO [visosservice_role]
    AS [dbo];

