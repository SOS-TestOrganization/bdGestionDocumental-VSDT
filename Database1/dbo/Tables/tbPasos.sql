CREATE TABLE [dbo].[tbPasos] (
    [cnsctvo_cdgo_pso]           [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_pso]                   CHAR (4)               NOT NULL,
    [dscrpcn_pso]                VARCHAR (500)          NOT NULL,
    [inco_vgnca]                 DATETIME               NOT NULL,
    [fn_vgnca]                   DATETIME               NOT NULL,
    [fcha_crcn]                  DATETIME               NOT NULL,
    [usro_crcn]                  [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                   [dbo].[udtObservacion] NOT NULL,
    [vsble_usro]                 [dbo].[udtLogico]      NOT NULL,
    [cnsctvo_cdgo_fljo]          [dbo].[udtConsecutivo] NOT NULL,
    [nmbre]                      [dbo].[udtObservacion] NOT NULL,
    [cnsctvo_cndcn_enrtmnto]     [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_tpo_pso]       [dbo].[udtConsecutivo] NOT NULL,
    [nmbre_prcdmnto_ejctr]       [dbo].[udtObservacion] NULL,
    [estdo_dcmnto_pso]           [dbo].[udtObservacion] NULL,
    [prcdmnto_asgncn_rspnsble]   [dbo].[udtObservacion] NULL,
    [cnsctvo_cdgo_tpo_rspnsbldd] [dbo].[udtConsecutivo] NULL,
    [tme_stmp]                   ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbPasos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_pso] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbPasos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbPasos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbPasos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbPasos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbPasos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbPasos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbPasos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbPasos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbPasos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbPasos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbPasos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbPasos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbPasos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbPasos] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbPasos] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbPasos] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbPasos] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbPasos] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbPasos] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbPasos] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbPasos] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbPasos] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbPasos] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbPasos] TO [visosservice_role]
    AS [dbo];

