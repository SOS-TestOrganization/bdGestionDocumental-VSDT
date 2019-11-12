CREATE TABLE [dbo].[tbComentariosDocumentos] (
    [cnsctvo_cdgo_cmntro_dcmnto] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_cmntro]        [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_dcmnto]        [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_fljo]          [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_rta]           [dbo].[udtConsecutivo] NULL,
    [cmntro]                     VARCHAR (7500)         NULL,
    [fcha_cmntro]                DATETIME               NULL,
    [usro_cmntro]                [dbo].[udtUsuario]     NULL,
    CONSTRAINT [PK_tbComentariosDocumentos] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_cmntro_dcmnto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbComentariosDocumentos] TO [Unibase]
    AS [dbo];

