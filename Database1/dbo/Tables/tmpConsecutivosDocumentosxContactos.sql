CREATE TABLE [dbo].[tmpConsecutivosDocumentosxContactos] (
    [cnsctvo_cdgo_dcmnto] [dbo].[udtConsecutivo] NOT NULL,
    [vlr]                 VARCHAR (255)          NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpConsecutivosDocumentosxContactos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpConsecutivosDocumentosxContactos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpConsecutivosDocumentosxContactos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpConsecutivosDocumentosxContactos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpConsecutivosDocumentosxContactos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpConsecutivosDocumentosxContactos] TO [Unibase]
    AS [dbo];

