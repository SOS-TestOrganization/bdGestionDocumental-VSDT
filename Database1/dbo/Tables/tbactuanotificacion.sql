CREATE TABLE [dbo].[tbactuanotificacion] (
    [cnsctvo_ntfccn]            INT          NOT NULL,
    [cnsctvo_cdgo_ofcna]        INT          NOT NULL,
    [cnsctvo_cdgo_mdlo]         INT          NOT NULL,
    [nmro_unco_idntfccn]        INT          NOT NULL,
    [cnsctvo_cdgo_tpo_idntfccn] INT          NOT NULL,
    [nmro_idntfccn]             VARCHAR (20) NOT NULL,
    [prmr_aplldo]               CHAR (50)    NOT NULL,
    [sgndo_aplldo]              CHAR (50)    NOT NULL,
    [prmr_nmbre]                CHAR (20)    NOT NULL,
    [sgndo_nmbre]               CHAR (20)    NOT NULL,
    [cnsctvo_cdgo_pln]          INT          NOT NULL,
    [cnsctvo_cdgo_sde_usro]     INT          NOT NULL,
    [cnsctvo_cdgo_cdd]          INT          NOT NULL,
    [nmro_bnfcro]               TINYINT      NOT NULL,
    [cnsctvo_cdgo_sxo]          INT          NOT NULL,
    [fcha_ncmnto]               DATETIME     NOT NULL,
    [cnsctvo_cdgo_tpo_undd]     INT          NOT NULL,
    [smns_ctzds]                INT          NOT NULL,
    [cnsctvo_cdgo_tpo_afldo]    INT          NOT NULL,
    [cnsctvo_cdgo_prnstco]      INT          NOT NULL,
    [cnsctvo_cdgo_rngo]         INT          NOT NULL,
    [fcha_inco_vgnca]           DATETIME     NOT NULL,
    [fcha_fn_vgnca]             DATETIME     NOT NULL,
    [cnsctvo_cdgo_ips]          CHAR (8)     NOT NULL,
    [nmro_unco_idntfccn_ctznte] INT          NOT NULL,
    [cnsctvo_cdgo_afp]          INT          NOT NULL,
    [usro_ultma_mdfccn]         CHAR (30)    NOT NULL,
    [fcha_ultma_mdfccn]         DATETIME     NOT NULL,
    [mqna_usro]                 CHAR (30)    NOT NULL,
    [cpta]                      CHAR (1)     NULL,
    [fcha_vldcn]                DATETIME     NULL,
    [tme_stmp]                  ROWVERSION   NOT NULL,
    [cnsctvo_cdgo_pln_pc]       INT          NULL,
    [smns_aflcn_ss_ps]          INT          NULL,
    [fcha_rfrnca]               DATETIME     NULL,
    [cnsctvo_cdgo_pln_ps]       INT          NULL,
    [smns_aflcn_ps_ss]          INT          NULL,
    [smns_aflcn_ps_otrs_eps]    INT          NULL,
    [smns_aflcn_pc_ss]          INT          NULL,
    [smns_aflcn_pc_otrs_eps]    INT          NULL,
    [tlfno_actlzdo]             VARCHAR (50) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbactuanotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbactuanotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbactuanotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbactuanotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbactuanotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbactuanotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbactuanotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbactuanotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbactuanotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbactuanotificacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbactuanotificacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbactuanotificacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbactuanotificacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbactuanotificacion] TO [Unibase]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbactuanotificacion] TO [Analista Seguros Asistenciales]
    AS [dbo];

