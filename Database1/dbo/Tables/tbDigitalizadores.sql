CREATE TABLE [dbo].[tbDigitalizadores] (
    [cnsctvo_cdgo_dgtlzdr] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_dgtlzdr]         CHAR (10)              NOT NULL,
    [dscrpcn_dgtlzdr]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]            DATETIME               NOT NULL,
    [usro_crcn]            [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]           [dbo].[udtLogico]      NOT NULL,
    [crpta_srvdr]          VARCHAR (100)          NULL,
    CONSTRAINT [PK_tbDigitalizadores] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_dgtlzdr] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDigitalizadores] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDigitalizadores] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDigitalizadores] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDigitalizadores] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDigitalizadores] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [Unibase]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDigitalizadores] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];

