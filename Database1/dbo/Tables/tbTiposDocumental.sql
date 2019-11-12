CREATE TABLE [dbo].[tbTiposDocumental] (
    [cnsctvo_cdgo_tpo_dcmntl] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_dcmntl]         CHAR (4)               NOT NULL,
    [dscrpcn_tpo_dcmntl]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]               DATETIME               NOT NULL,
    [usro_crcn]               [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]              [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbTiposDocumental] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_tpo_dcmntl] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumental] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumental] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumental] TO [Unibase]
    AS [dbo];

