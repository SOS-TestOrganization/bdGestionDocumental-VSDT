CREATE TABLE [dbo].[tbDetalleCondiciones] (
    [cnsctvo_cdgo_dtlle_cndcn] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_cndcn]       [dbo].[udtConsecutivo] NOT NULL,
    [dscrpcn_dtlle_cndcn]      [dbo].[udtObservacion] NOT NULL,
    [inco_vgnca]               DATETIME               NOT NULL,
    [fn_vgnca]                 DATETIME               NOT NULL,
    [fcha_crcn]                DATETIME               NOT NULL,
    [usro_crcn]                [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                 [dbo].[udtObservacion] NOT NULL,
    [vsble_usro]               [dbo].[udtLogico]      NOT NULL,
    [cmpo_cndcn1]              [dbo].[udtDescripcion] NOT NULL,
    [oprdr_cndcn]              [dbo].[udtObservacion] NULL,
    [vlr_1]                    [dbo].[udtObservacion] NULL,
    [cmpo_cndcn2]              [dbo].[udtObservacion] NULL,
    [tme_stmp]                 ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbDetalleCondiciones] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_dtlle_cndcn] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDetalleCondiciones] TO [Unibase]
    AS [dbo];

