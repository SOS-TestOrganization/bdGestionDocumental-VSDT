CREATE TABLE [dbo].[tbAgrupadorTiposDocumental] (
    [cnsctvo_cdgo_agrpdr_tpo_dcmntl] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_agrpdr_tpo_dcmntl]         CHAR (4)               NOT NULL,
    [dscrpcn_agrpdr_tpo_dcmntl]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                      DATETIME               NOT NULL,
    [usro_crcn]                      [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                     [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbAgrupadorTiposDocumental] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_agrpdr_tpo_dcmntl] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbAgrupadorTiposDocumental] TO [Unibase]
    AS [dbo];

