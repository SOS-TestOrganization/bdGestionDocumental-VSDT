CREATE TABLE [dbo].[tbInfoFormulariosSio] (
    [tpo_frmlro]         VARCHAR (50) NULL,
    [nmro_frmlro]        VARCHAR (50) NULL,
    [ga_frmlro]          BIGINT       NULL,
    [tpo_dcmnto_afldo]   CHAR (3)     NULL,
    [nmro_dcmnto_afldo]  VARCHAR (25) NULL,
    [prmr_nmbre_afldo]   VARCHAR (50) NULL,
    [sgndo_nmbre_afldo]  VARCHAR (50) NULL,
    [prmr_aplldo_afldo]  VARCHAR (50) NULL,
    [sgndo_aplldo_afldo] VARCHAR (50) NULL,
    [tpo_dcmnto_empldr]  CHAR (3)     NULL,
    [nmro_dcmnto_empldr] VARCHAR (25) NULL,
    [rlcn_frmlro]        VARCHAR (50) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbInfoFormulariosSio] TO [Unibase]
    AS [dbo];

