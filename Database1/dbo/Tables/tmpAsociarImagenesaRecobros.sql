CREATE TABLE [dbo].[tmpAsociarImagenesaRecobros] (
    [nmro_rdccn]          INT NULL,
    [cnsctvo_rdccn_rcbro] INT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpAsociarImagenesaRecobros] TO [Analistas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpAsociarImagenesaRecobros] TO [Analistas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpAsociarImagenesaRecobros] TO [Analistas]
    AS [dbo];

