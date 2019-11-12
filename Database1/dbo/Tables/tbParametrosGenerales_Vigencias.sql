CREATE TABLE [dbo].[tbParametrosGenerales_Vigencias] (
    [cnsctvo_vgnca_prmtro_gnrl] INT           NOT NULL,
    [cnsctvo_cdgo_prmtro_gnrl]  INT           NOT NULL,
    [cdgo_prmtro_gnrl]          CHAR (3)      NOT NULL,
    [dscrpcn_prmtro_gnrl]       VARCHAR (150) NOT NULL,
    [inco_vgnca]                DATETIME      NOT NULL,
    [fn_vgnca]                  DATETIME      NOT NULL,
    [fcha_crcn]                 DATETIME      NOT NULL,
    [usro_crcn]                 CHAR (30)     NOT NULL,
    [obsrvcns]                  VARCHAR (250) NOT NULL,
    [vsble_usro]                CHAR (1)      NOT NULL,
    [tpo_dto_prmtro]            CHAR (1)      NOT NULL,
    [vlr_prmtro_nmrco]          NUMERIC (18)  NULL,
    [vlr_prmtro_crctr]          VARCHAR (150) NULL,
    [vlr_prmtro_fcha]           DATETIME      NULL,
    [cnsctvo_cdgo_tpo_undd]     INT           NULL,
    [tme_stmp]                  ROWVERSION    NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Unibase]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [RespondeService]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales_Vigencias] TO [websos]
    AS [dbo];

