CREATE TABLE [dbo].[tbtemporal_sislbr01] (
    [nmro_envo]               INT           NULL,
    [nmro_fctra]              INT           NULL,
    [cnsctvo_fctra_sos_rcbro] INT           NULL,
    [nmro_rcbro]              VARCHAR (20)  NULL,
    [nmro_rdccn_fsga]         VARCHAR (20)  NULL,
    [cnsctvo_cdgo_imgn]       INT           NULL,
    [rta_imgn]                VARCHAR (450) NULL,
    [cnsctvo_cdgo_tpo_dcmnto] INT           NULL,
    [cdgo_tpo_dcmnto]         VARCHAR (5)   NULL
);


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbtemporal_sislbr01] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbtemporal_sislbr01] TO [rcbrs_usr]
    AS [dbo];

