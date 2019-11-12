CREATE TABLE [dbo].[tbParametrosProgramacionxTiposIndices] (
    [cnsctvo_cdgo_prmtro_prgrmcn_pr_tpo_indce] [dbo].[udtConsecutivo]  IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_prmtro_prgrmcn]              [dbo].[udtConsecutivo]  NOT NULL,
    [cnsctvo_cdgo_tpo_indce]                   [dbo].[udtConsecutivo]  NOT NULL,
    [fcha_crcn]                                DATETIME                NOT NULL,
    [usro_crcn]                                [dbo].[udtUsuario]      NOT NULL,
    [vsble_usro]                               [dbo].[udtLogico]       NOT NULL,
    [clse_lgca]                                [dbo].[udtNombreObjeto] NOT NULL,
    [tpo_dto]                                  CHAR (1)                NOT NULL,
    [lngtd_cmpo]                               INT                     NULL,
    [cnsctvo_cdgo_prmtro]                      VARCHAR (50)            NULL,
    [cmpo_cnsctvo_prmtro]                      [dbo].[udtNombreObjeto] NULL,
    [sp_cnslta_prmtro]                         [dbo].[udtNombreObjeto] NULL,
    [sp_rcpra_vlr_mstr]                        [dbo].[udtNombreObjeto] NULL,
    [cmpo_dscrpcn_prmtro]                      [dbo].[udtNombreObjeto] NULL,
    [tme_stmp]                                 ROWVERSION              NOT NULL,
    CONSTRAINT [PK_tbParametrosxTiposIndices] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_prmtro_prgrmcn_pr_tpo_indce] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosProgramacionxTiposIndices] TO [Unibase]
    AS [dbo];

