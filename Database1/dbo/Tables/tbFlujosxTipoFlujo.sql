﻿CREATE TABLE [dbo].[tbFlujosxTipoFlujo] (
    [cnsctvo_cdgo_fljo_pr_tpo_fljo] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_fljo]             [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_fljo]         [dbo].[udtConsecutivo] NOT NULL,
    [fcha_crcn]                     DATETIME               NOT NULL,
    [usro_crcn]                     [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                    [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbFlujosxTipoFlujo] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_fljo_pr_tpo_fljo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbFlujosxTipoFlujo] TO [Unibase]
    AS [dbo];

