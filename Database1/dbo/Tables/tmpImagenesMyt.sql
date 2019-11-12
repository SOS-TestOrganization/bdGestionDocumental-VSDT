CREATE TABLE [dbo].[tmpImagenesMyt] (
    [cnsctvo]                 INT                    IDENTITY (1, 1) NOT NULL,
    [cnsctvo_fctra_sos_rcbro] [dbo].[udtConsecutivo] NULL,
    [nmro_fctra_sos]          CHAR (20)              NULL,
    [line]                    CHAR (200)             NULL,
    [rta_orgn]                CHAR (200)             NULL,
    [rta_dstno]               CHAR (200)             NULL,
    [cnsctvo_rdccn_rcbro]     INT                    NULL,
    [cnsctvo_cdgo_imgn]       INT                    NULL,
    [nmro_cnsctvo]            INT                    NULL
);


GO
GRANT ALTER
    ON OBJECT::[dbo].[tmpImagenesMyt] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpImagenesMyt] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpImagenesMyt] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpImagenesMyt] TO [rcbrs_usr]
    AS [dbo];

