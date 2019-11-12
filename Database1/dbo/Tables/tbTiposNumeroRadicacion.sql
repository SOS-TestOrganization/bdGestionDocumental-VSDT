﻿CREATE TABLE [dbo].[tbTiposNumeroRadicacion] (
    [cnsctvo_cdgo_tpo_nmro_rdccn] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_nmro_rdccn]         CHAR (4)               NOT NULL,
    [dscrpcn_tpo_nmro_rdccn]      [dbo].[udtDescripcion] NOT NULL,
    [prfjo_nmro_rdccn]            [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                   DATETIME               NOT NULL,
    [usro_crcn]                   [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                  [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbTiposNumeroRadicacion] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_tpo_nmro_rdccn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposNumeroRadicacion] TO [visosservice_role]
    AS [dbo];

