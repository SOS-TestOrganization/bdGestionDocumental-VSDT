CREATE TABLE [dbo].[tbCampos] (
    [bse_dts]             VARCHAR (128) NOT NULL,
    [tbla]                VARCHAR (128) NOT NULL,
    [cdgo_cmpo]           VARCHAR (128) NOT NULL,
    [dscrpcn_prmtro]      VARCHAR (150) NULL,
    [bse_dts_prmtrs]      VARCHAR (128) NULL,
    [cdgo_cmpo_prmtrs]    VARCHAR (128) NULL,
    [dscrpcn_cmpo_prmtrs] VARCHAR (128) NULL,
    [aplca_scrsl]         CHAR (1)      NULL,
    [brrdo]               CHAR (1)      NULL,
    [usro_ultma_mdfccn]   CHAR (30)     NULL,
    [fcha_ultma_mdfccn]   DATETIME      NULL,
    [tpo_dts]             VARCHAR (25)  NULL,
    [tbla_prmtrs]         VARCHAR (128) NULL,
    [dscrpcn_cmpo]        VARCHAR (150) NULL,
    [tpo_aplccn]          CHAR (2)      NOT NULL,
    [aplca_incdnca]       CHAR (1)      NULL,
    [aplca_cnslta]        CHAR (1)      NULL,
    [tpo_cnslta]          INT           NULL,
    [id_clmna]            INT           NULL,
    [lngtd_cmpo]          INT           NULL,
    [clse_lgca]           CHAR (50)     NULL,
    [dscrpcn_bsqda]       CHAR (50)     NULL,
    [sp_bsqda]            VARCHAR (250) NULL,
    [cmpo_cnsctvo_prmtro] VARCHAR (128) NULL,
    [vsble_usro]          CHAR (1)      NULL,
    CONSTRAINT [PK_tbCampos] PRIMARY KEY CLUSTERED ([bse_dts] ASC, [cdgo_cmpo] ASC, [tbla] ASC) WITH (FILLFACTOR = 95)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampos] TO PUBLIC
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampos] TO PUBLIC
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampos] TO PUBLIC
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampos] TO PUBLIC
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Salud]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampos] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampos] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampos] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampos] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampos] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCampos] TO [Coordinador Cuentas Medicas]
    AS [dbo];

