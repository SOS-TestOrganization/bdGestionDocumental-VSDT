CREATE TABLE [dbo].[tbTmpRegistrosArchivosIndicesxTemporal] (
    [idntfcdr_unco]          VARCHAR (50)  NULL,
    [cnsctvo_dcmnto_dgtlzdo] INT           NULL,
    [cnsctvo_cdgo_tpo_imgn]  INT           NULL,
    [cnsctvo_prcso_crga]     INT           NULL,
    [rta_archvo_fsco]        VARCHAR (250) NULL,
    [indce1]                 VARCHAR (50)  NULL,
    [indce2]                 VARCHAR (50)  NULL,
    [indce3]                 VARCHAR (50)  NULL,
    [indce4]                 VARCHAR (50)  NULL,
    [indce5]                 VARCHAR (50)  NULL,
    [indce6]                 VARCHAR (50)  NULL,
    [nmro_blsa]              VARCHAR (20)  NULL,
    [tpo_anxo]               VARCHAR (10)  NULL,
    [fcha_dgtlzcn]           VARCHAR (50)  NULL,
    [nmbre_archvo]           VARCHAR (250) NULL,
    [tipo_indce1]            INT           NULL,
    [tipo_indce2]            INT           NULL,
    [tipo_indce3]            INT           NULL,
    [tipo_indce4]            INT           NULL,
    [tipo_indce5]            INT           NULL,
    [tipo_indce6]            INT           NULL,
    [tipo_nmro_blsa]         INT           NULL,
    [tipo_tpo_anxo]          INT           NULL,
    [tipo_fcha_dgtlzcn]      INT           NULL,
    [tipo_nmbre_archvo]      INT           NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTmpRegistrosArchivosIndicesxTemporal] TO [Unibase]
    AS [dbo];

