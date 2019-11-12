CREATE TABLE [dbo].[tbCRRadicacionEventoRecobrable] (
    [cnsctvo_rdccn_rcbro]              INT           NOT NULL,
    [cnsctvo_cdgo_tpo_idntfccn]        INT           NULL,
    [tpo_idntfccn]                     CHAR (3)      NULL,
    [nmro_idntfccn]                    CHAR (20)     NULL,
    [fcha_cnslta]                      DATETIME      NULL,
    [cnsctvo_pln]                      INT           NULL,
    [cdgo_pln]                         CHAR (2)      NULL,
    [dscrpcn_pln]                      VARCHAR (150) NULL,
    [nui_afiliado]                     INT           NULL,
    [fnte_infrmcn]                     CHAR (1)      NULL,
    [prmer_nmbre]                      CHAR (50)     NULL,
    [sgndo_nmbre]                      CHAR (50)     NULL,
    [prmr_aplldo]                      CHAR (20)     NULL,
    [sgndo_aplldo]                     CHAR (20)     NULL,
    [cnsctvo_cdgo_sxo]                 INT           NULL,
    [cdgo_sxo]                         CHAR (2)      NULL,
    [edd]                              INT           NULL,
    [fcha_ncmnto]                      DATETIME      NULL,
    [drccn_rsdnca_afldo]               VARCHAR (80)  NULL,
    [tlfn_rsdnca_afldo]                CHAR (30)     NULL,
    [cnsctvo_cdgo_cdd_rsdnca]          INT           NULL,
    [cdgo_cdd_rsdnca]                  CHAR (8)      NULL,
    [dscrpcn_cdd_rsdnca]               VARCHAR (150) NULL,
    [nui_aprtnte]                      INT           NULL,
    [cnsctvo_cdgo_tpo_idntfccn_emprsa] INT           NULL,
    [cdgo_tpo_idntfccn_emprsa]         CHAR (3)      NULL,
    [nmro_idntfccn_emprsa]             VARCHAR (20)  NULL,
    [rzn_scl_emprsa]                   CHAR (150)    NULL,
    [drccn_emprsa]                     VARCHAR (80)  NULL,
    [tlfno_emprsa]                     CHAR (30)     NULL,
    [cnsctvo_cdgo_rngo_slrl]           INT           NULL,
    [cdgo_rngo_slrl]                   CHAR (2)      NULL,
    [rngo_slrl]                        VARCHAR (150) NULL,
    [cnsctvo_cdgo_tpo_aflcn]           INT           NULL,
    [cdgo_tpo_aflcn]                   CHAR (2)      NULL,
    [tpo_aflcn]                        VARCHAR (150) NULL,
    [cnsctvo_cdgo_sde_ips_prmra]       INT           NULL,
    [cdgo_sde_ips_prmra]               CHAR (3)      NULL,
    [dscrpcn_sde_ips_prmra]            VARCHAR (150) NULL,
    [cdgo_intrno_ips_prmra]            CHAR (8)      NULL,
    [dscrpcn_ips_prmra]                VARCHAR (150) NULL,
    [cdgo_arp_afldo]                   CHAR (8)      NULL,
    [dscrpcn_arp_afldo]                VARCHAR (150) NULL,
    [nui_arp_afldo]                    INT           NULL,
    [tlfno_arp_afldo]                  CHAR (30)     NULL,
    [fx_arp_afldo]                     CHAR (20)     NULL,
    [drccn_arp_afldo]                  VARCHAR (80)  NULL,
    [eml_arp_afldo]                    CHAR (50)     NULL,
    [cdd_arp_afldo]                    CHAR (50)     NULL,
    [tpo_idntfccn_arp_afldo]           CHAR (3)      NULL,
    [nmro_idntfccn_arp_afldo]          VARCHAR (20)  NULL,
    [cnsctvo_cdgo_tpo_cnta]            INT           NULL,
    [glbl_indvdl]                      CHAR (1)      NULL,
    [nmro_rdccn]                       INT           NULL,
    [cnsctvo_cdgo_ofcna_rdccn]         INT           NULL,
    [cdgo_ofcna_rdccn]                 CHAR (5)      NULL,
    [dscrpcn_ofcna_rdccn]              VARCHAR (150) NULL,
    [ips_mdco]                         CHAR (1)      NULL,
    [cdgo_intrno_prstdr]               CHAR (8)      NULL,
    [cnsctvo_cdgo_tpo_idntfccn_prstdr] INT           NULL,
    [cdgo_tpo_idntfccn_prstdr]         CHAR (3)      NULL,
    [nmro_idntfccn_prstdr]             VARCHAR (20)  NULL,
    [rzn_scl_prstdr]                   VARCHAR (150) NULL,
    [fcha_rdccn_prstdr]                DATETIME      NULL,
    [fcha_fctra_ips]                   DATETIME      NULL,
    [nmro_crdto_ips]                   CHAR (20)     NULL,
    [nmro_fctra_ips]                   CHAR (20)     NULL,
    [vlr_fctra_ips]                    BIGINT        NULL,
    [vlr_tcho]                         BIGINT        NULL,
    [cnsctvo_cdgo_clse_atncn]          INT           NULL,
    [cdgo_clse_atncn]                  CHAR (3)      NULL,
    [clse_atncn]                       VARCHAR (150) NULL,
    [cnsctvo_cdgo_dgnstco]             INT           NULL,
    [cdgo_dgnstco]                     CHAR (5)      NULL,
    [dscrpcn_dgnstco]                  VARCHAR (150) NULL,
    [cnsctvo_cdgo_tpo_rcbro]           INT           NULL,
    [cnsctvo_cdgo_estdo]               INT           NULL,
    [cnsctvo_cdgo_estdo_rgstro]        INT           NULL,
    [fcha_crcn]                        DATETIME      NULL,
    [usro_crcn]                        CHAR (8)      NULL,
    [fcha_ultma_mdfccn]                DATETIME      NULL,
    [usro_ultma_mdfccn]                CHAR (8)      NULL,
    [cnsctvo_fctra_sos_rcbro]          INT           NULL,
    [smns_ctzcn_otra_eps]              INT           NULL,
    [smns_ctzcn_sos]                   INT           NULL,
    [smns_ctzcn_sgsss]                 INT           NULL,
    [fcha_rcbdo]                       DATETIME      NULL,
    [fcha_lmte]                        DATETIME      NULL,
    [cnsctvo_cdgo_csa_estdo]           INT           NULL,
    [cdgo_csa_estdo]                   CHAR (3)      NULL,
    [csa_estdo]                        VARCHAR (150) NULL,
    [cnsctvo_cdgo_estdo_ntfccn]        INT           NULL,
    [cdgo_estdo_ntfccn]                CHAR (3)      NULL,
    [dscrpcn_estdo_ntfccn]             VARCHAR (150) NULL,
    [cnsctvo_cdgo_csa_estdo_ntfccn]    INT           NULL,
    [cdgo_csa_estdo_ntfccn]            CHAR (3)      NULL,
    [csa_estdo_ntfccn]                 VARCHAR (150) NULL,
    [fcha_cmncdo_ips]                  DATETIME      NULL,
    [nmro_cmncdo_ips]                  INT           NULL,
    [cnsctvo_cdgo_ofcna_ntfccn]        INT           NULL,
    [cdgo_ofcna_ntfccn]                CHAR (3)      NULL,
    [dscrpcn_ofcna_ntfccn]             VARCHAR (150) NULL,
    [nmro_ntfccn]                      INT           NULL,
    [fcha_ntfccn]                      DATETIME      NULL,
    [usro_lqddr]                       CHAR (8)      NULL,
    [fcha_lqdcn]                       DATETIME      NULL,
    [cdgo_ips_mnstro_sld]              CHAR (10)     NULL,
    [cnsctvo_fctra_sos_rcbro_anlda]    INT           NULL,
    [cnsctvo_cdgo_estdo_drcho]         INT           NULL,
    [cdgo_estdo_drcho]                 CHAR (2)      NULL,
    [dscrpcn_estdo_drcho]              VARCHAR (150) NULL,
    [dscrpcn_drcho]                    VARCHAR (150) NULL,
    [cnsctvo_glsa]                     INT           NULL,
    [cnsctvo_rdccn_rcbro_antrr]        INT           NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCRRadicacionEventoRecobrable] TO [Unibase]
    AS [dbo];

