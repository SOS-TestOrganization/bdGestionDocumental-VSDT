CREATE TABLE [dbo].[tbEstructurasArbolVisor] (
    [cnsctvo_cdgo_estrctra_arbl_vsr] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_estrctra_arbl_vsr]         [dbo].[udtCodigo]      NOT NULL,
    [dscrpcn_estrctra_arbl_vsr]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                      DATETIME               NOT NULL,
    [usro_crcn]                      [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                     [dbo].[udtLogico]      NOT NULL
);


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbEstructurasArbolVisor] TO [visosservice_role]
    AS [dbo];

