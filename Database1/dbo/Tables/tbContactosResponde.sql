CREATE TABLE [dbo].[tbContactosResponde] (
    [cnsctvo_cdgo_cntcto]        INT            NOT NULL,
    [cnsctvo_cdgo_nvl_stsfccn]   INT            NULL,
    [cnsctvo_cdgo_tpo_clnte]     INT            NULL,
    [cnsctvo_cdgo_mdo_cntcto]    INT            NULL,
    [cdgo_cntcto]                CHAR (15)      NOT NULL,
    [fcha_ingrso_cntcto]         DATETIME       NOT NULL,
    [nmro_unco_idntfccn_clnte]   INT            NOT NULL,
    [slctd_clnte]                VARCHAR (7500) NULL,
    [cnsctvo_cdgo_mtvo_cntcto]   INT            NOT NULL,
    [cnsctvo_cdgo_csa_cntcto]    INT            NOT NULL,
    [cnsctvo_cdgo_sbcsa_cntcto]  INT            NOT NULL,
    [cnsctvo_cdgo_tpo_cntcto]    INT            NOT NULL,
    [cnsctvo_cdgo_tpo_lgr_evnto] INT            NULL,
    [cnsctvo_cdgo_estdo_cntcto]  INT            NOT NULL,
    [ultmo_cnsctvo_cmprmso]      INT            NULL,
    [ultmo_cnsctvo_rgstro_gstn]  INT            NULL,
    [usro_rspnsble_cntcto]       CHAR (30)      NULL,
    [fcha_evnto]                 DATETIME       NULL,
    [cnsctvo_dprtmnto_evnto]     INT            NULL,
    [cnsctvo_cdd_evnto]          INT            NULL,
    [cnsctvo_cdgo_ofcna]         INT            NULL,
    [cnsctvo_cdgo_prspcto]       INT            NULL,
    [cnsctvo_cdgo_tpo_prcso]     INT            NULL,
    [cnsctvo_cdgo_pln]           INT            NULL,
    [cnsctvo_cdgo_prvdr]         INT            NULL,
    [cnsctvo_cdgo_lgr_evnto]     INT            NULL,
    [cntdd_asgncn_cntcto]        INT            NULL,
    [fcha_crre_cntcto]           DATETIME       NULL,
    [nmro_unco_idntfccn_aprtnte] INT            NULL,
    [cnsctvo_cdgo_clse_aprtnte]  INT            NULL,
    [cdgo_intrno]                CHAR (8)       NULL,
    [tme_stmp]                   VARBINARY (8)  NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbContactosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbContactosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbContactosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbContactosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbContactosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbContactosResponde] TO [Unibase]
    AS [dbo];

