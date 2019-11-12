CREATE TABLE [dbo].[tbCasosPruebasCTC] (
    [cnsctvo_rdccn_rcbro] INT          NULL,
    [nmro_acta_ctc]       VARCHAR (20) NULL,
    [nmro_ntfccn]         INT          NULL,
    [cnsctvo_sde_acta]    INT          NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbCasosPruebasCTC] TO [Unibase]
    AS [dbo];

