CREATE TABLE [dbo].[tbRadicacionCuentas] (
    [nmro_rdccn]                INT        NOT NULL,
    [cnsctvo_cdgo_ofcna]        INT        NOT NULL,
    [fcha_rdccn]                DATETIME   NOT NULL,
    [usro_rdccn]                CHAR (30)  NOT NULL,
    [nmro_fctra]                CHAR (20)  NOT NULL,
    [fcha_fctra]                DATETIME   NOT NULL,
    [cdgo_intrno]               CHAR (8)   NOT NULL,
    [nmro_unco_idntfccn_prstdr] INT        NOT NULL,
    [cnsctvo_gnrco]             INT        NOT NULL,
    [vlr_ttl]                   FLOAT (53) NOT NULL,
    [cnsctvo_cdgo_prdo_crte]    INT        NOT NULL,
    [cnsctvo_cdgo_estdo_fctra]  INT        NOT NULL,
    [cnsctvo_cdgo_mtvo]         INT        NOT NULL,
    [cnsctvo_cdgo_tpo_cnta]     INT        NOT NULL,
    [fcha_ultma_mdfccn]         DATETIME   NOT NULL,
    [usro_ultma_mdfccn]         CHAR (30)  NOT NULL,
    [fcha_dgtcn]                DATETIME   NULL,
    [usro_dgtcn]                CHAR (30)  NULL,
    [prfjo_fctra]               CHAR (4)   NULL,
    [sfjo_fctra]                CHAR (16)  NULL,
    [fcha_cntblzcn]             DATETIME   NULL,
    [archvo_cntblzcn]           CHAR (30)  NULL,
    [mqna_cntblzn]              CHAR (22)  NULL,
    [tme_stmp]                  ROWVERSION NOT NULL,
    [cnsctvo_cdgo_pln]          INT        NULL,
    [cnslddo]                   CHAR (1)   NULL,
    [tpo_fctra]                 CHAR (1)   NULL,
    [vlr_cta_mdrdra]            FLOAT (53) NULL,
    [vlr_cpgo]                  FLOAT (53) NULL,
    [vlr_dscnto]                FLOAT (53) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRadicacionCuentas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRadicacionCuentas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbRadicacionCuentas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRadicacionCuentas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRadicacionCuentas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRadicacionCuentas] TO [Unibase]
    AS [dbo];

