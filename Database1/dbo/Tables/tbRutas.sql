CREATE TABLE [dbo].[tbRutas] (
    [cnsctvo_cdgo_rta]          [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_rta]                  CHAR (4)               NOT NULL,
    [dscrpcn_rta]               [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                DATETIME               NOT NULL,
    [fn_vgnca]                  DATETIME               NOT NULL,
    [fcha_crcn]                 DATETIME               NOT NULL,
    [usro_crcn]                 [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                  [dbo].[udtObservacion] NOT NULL,
    [vsble_usro]                [dbo].[udtLogico]      NOT NULL,
    [cnsctvo_cdgo_fljo]         [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_pso_incl]     [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_pso_fnl]      [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_cndcn]        [dbo].[udtConsecutivo] NULL,
    [rta_exclynte]              [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_tpo_rspnsble] [dbo].[udtConsecutivo] NULL,
    [tmpo_rta]                  [dbo].[udtConsecutivo] NULL,
    [almcnr_dcmnto]             [dbo].[udtConsecutivo] NULL,
    [envo_ntfccn]               [dbo].[udtConsecutivo] NULL,
    [tme_stmp]                  ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbRutas] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_rta] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRutas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRutas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbRutas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRutas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRutas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRutas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRutas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRutas] TO [Unibase]
    AS [dbo];

