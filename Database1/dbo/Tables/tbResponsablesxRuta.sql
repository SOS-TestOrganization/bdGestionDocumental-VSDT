CREATE TABLE [dbo].[tbResponsablesxRuta] (
    [cnsctvo_cdgo_rspnsble_pr_rta] INT                    IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_rspnsble]        [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_rta]             [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                    DATETIME               NULL,
    [usro_crcn]                    CHAR (30)              NULL,
    [vsble_usro]                   CHAR (1)               NULL,
    CONSTRAINT [PK_tbResponsablesxRuta] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_rspnsble_pr_rta] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbResponsablesxRuta] TO [Unibase]
    AS [dbo];

