CREATE TABLE [dbo].[tbTiposImagenesxTiposDocumento] (
    [cnsctvo_cdgo_tpo_imgn_pr_tpo_dcmnto] INT       NOT NULL,
    [cnsctvo_cdgo_tpo_dcmnto]             INT       NOT NULL,
    [cnsctvo_cdgo_tpo_imgn]               INT       NOT NULL,
    [fcha_crcn]                           DATETIME  NOT NULL,
    [usro_crcn]                           CHAR (30) NOT NULL,
    [vsble_usro]                          CHAR (1)  NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposImagenesxTiposDocumento] TO [visosservice_role]
    AS [dbo];

