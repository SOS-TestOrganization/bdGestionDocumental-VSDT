CREATE TABLE [dbo].[tbDocumentosAnexosResponde] (
    [cnsctvo_cdgo_dcmnto]            INT           NOT NULL,
    [cnsctvo_cdgo_cntcto]            INT           NOT NULL,
    [fcha_dcmnto]                    DATETIME      NOT NULL,
    [nmbre_dcmnto]                   VARCHAR (150) NOT NULL,
    [fcha_rdccn_dcmnto]              DATETIME      NOT NULL,
    [nmro_rdccn]                     CHAR (50)     NOT NULL,
    [cnsctvo_cdgo_frmto_dcmnto]      INT           NOT NULL,
    [nmro_fls]                       DECIMAL (4)   NOT NULL,
    [nmro_cps]                       DECIMAL (4)   NOT NULL,
    [cnsctvo_archvo_dcmnto]          BIGINT        NOT NULL,
    [rta_archvo_orgnl_dcmnto]        VARCHAR (150) NOT NULL,
    [cnsctvo_cdgo_orgn_dcmnto]       INT           NOT NULL,
    [cnsctvo_cdgo_tpo_rmtnte_dcmnto] INT           NOT NULL,
    [cnsctvo_cdgo_sre_dcmnto]        INT           NOT NULL,
    [cnsctvo_cdgo_sb_sre_dcmnto]     INT           NOT NULL,
    [cnsctvo_cdgo_tpo_dcmnto]        INT           NULL,
    [obsrvcns]                       VARCHAR (250) NOT NULL,
    [cnsctvo_cdgo_rmtnte]            INT           NOT NULL,
    [cpa_elctrnca]                   CHAR (1)      NOT NULL,
    [fcha_ultma_mdfccn]              DATETIME      NOT NULL,
    [usro_ultma_mdfccn]              CHAR (30)     NOT NULL,
    [actvo]                          CHAR (1)      NOT NULL,
    [extnsn_archvo]                  CHAR (5)      NOT NULL,
    [fcha_crpta_archvo]              CHAR (6)      NULL,
    [cnsctvo_cdgo_dcmnto_gd]         INT           NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDocumentosAnexosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDocumentosAnexosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDocumentosAnexosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosAnexosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDocumentosAnexosResponde] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDocumentosAnexosResponde] TO [Unibase]
    AS [dbo];

