CREATE TABLE [dbo].[tbCTCRecobro] (
    [cnsctvo_cdgo_ctc]                      INT            NOT NULL,
    [nmro_unco_idntfccn_mdco]               INT            NOT NULL,
    [nmro_unco_idntfccn_ips]                INT            NOT NULL,
    [nmro_unco_idntfccn_afldo]              INT            NOT NULL,
    [cnsctvo_cdgo_dgnstco]                  INT            NOT NULL,
    [cnsctvo_cdgo_sde]                      INT            NOT NULL,
    [fcha_acta]                             DATETIME       NOT NULL,
    [nmro_acta]                             INT            NOT NULL,
    [fcha_slctd]                            DATETIME       NOT NULL,
    [cnsctvo_cdgo_trtmnto]                  INT            NOT NULL,
    [rsmn_slctd]                            VARCHAR (500)  NULL,
    [tmpo_slctdo]                           INT            NULL,
    [cnsctvo_cdgo_undd_mdda1]               INT            NULL,
    [tmpo_atrzdo]                           INT            NULL,
    [cnsctvo_cdgo_undd_mdda2]               INT            NULL,
    [dscn_cmte]                             VARCHAR (500)  NULL,
    [aprbdo]                                CHAR (1)       NOT NULL,
    [inco_vgnca]                            DATETIME       NULL,
    [fn_vgnca]                              DATETIME       NULL,
    [fcha_crcn]                             DATETIME       NOT NULL,
    [usro_crcn]                             CHAR (30)      NOT NULL,
    [cnsctvo_ntfccn]                        INT            NOT NULL,
    [cnsctvo_cdgo_ofcna]                    INT            NOT NULL,
    [fcha_cnfrmcn]                          DATETIME       NULL,
    [cnsctvo_cdgo_ptlgs_ctstrfcs]           INT            NULL,
    [cnsctvo_ops]                           INT            NULL,
    [cnsctvo_cdgo_ofcna_atrzcn]             INT            NULL,
    [acta_rcbda_mdcna_trbjo]                CHAR (1)       NULL,
    [fcha_rcbdo]                            DATETIME       NULL,
    [nmro_acta_ingrsdo]                     CHAR (20)      NOT NULL,
    [gnrco_ips]                             CHAR (1)       NULL,
    [gnrco_mdco]                            CHAR (1)       NULL,
    [cnsctvo_cdgo_estdo_acta]               INT            NULL,
    [cdgo_intrno]                           CHAR (8)       NULL,
    [jstfccn_tcnca]                         VARCHAR (1000) NULL,
    [jstfccn_nrmtva]                        VARCHAR (500)  NULL,
    [usro_ultma_mdfccn]                     CHAR (30)      NULL,
    [fcha_ultma_mdfccn]                     DATETIME       NULL,
    [nmro_unco_idntfccn_mdco_trnscrptr]     INT            NULL,
    [cnsctvo_cdgo_clsfccn_cdfccn]           INT            NULL,
    [fcha_rcpcn]                            DATETIME       NULL,
    [jstfccn_mdco_trtnte]                   VARCHAR (250)  NULL,
    [fcha_dgnstco]                          DATETIME       NULL,
    [sgns_sntms]                            VARCHAR (250)  NULL,
    [cnsctvo_cdgo_tpo_clse_prstcn_acta_ctc] INT            NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCTCRecobro] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCTCRecobro] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCTCRecobro] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCTCRecobro] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCTCRecobro] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCTCRecobro] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCTCRecobro] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCTCRecobro] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCTCRecobro] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCTCRecobro] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCTCRecobro] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCTCRecobro] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCTCRecobro] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCTCRecobro] TO [Unibase]
    AS [dbo];

