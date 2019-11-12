CREATE TABLE [dbo].[tbInformacionConsecutivo] (
    [cnsctvo_cdgo_dcmnto] INT NOT NULL,
    [cnsctvo_cdgo_imgn]   INT NOT NULL,
    CONSTRAINT [PK_tbInformacionConsecutivo] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_dcmnto] ASC)
);


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [900005 Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [900005 Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [900005 Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310009 Autorizadora Notificacion]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310009 Autorizadora Notificacion]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310009 Autorizadora Notificacion]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310004 Consultor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310004 Consultor Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310004 Consultor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Gestion IT]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Gestion IT]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Gestion IT]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Analista Gestion IT]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Analista Gestion IT]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Analista Gestion IT]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auditor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auditor Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auditor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Planeacion Gestion IT]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Planeacion Gestion IT]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Planeacion Gestion IT]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Salud Privilegiado]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Salud Privilegiado]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Consultor Salud Privilegiado]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador Parametros Vision Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador Parametros Vision Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador Parametros Vision Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Red Gestion IT]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Red Gestion IT]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Red Gestion IT]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Juridico Gestion IT]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Juridico Gestion IT]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Administrador Juridico Gestion IT]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInformacionConsecutivo] TO [visosservice_role]
    AS [dbo];

