CREATE TABLE [dbo].[tbTiposDocumental_Vigencias] (
    [cnsctvo_vgnca_cdgo_tpo_dcmntl] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_tpo_dcmntl]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_dcmntl]               CHAR (3)               NOT NULL,
    [dscrpcn_tpo_dcmntl]            [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                    DATETIME               NOT NULL,
    [fn_vgnca]                      DATETIME               NOT NULL,
    [fcha_crcn]                     DATETIME               NOT NULL,
    [usro_crcn]                     [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                      [dbo].[udtObservacion] NULL,
    [vsble_usro]                    [dbo].[udtLogico]      NOT NULL,
    [tme_stmp]                      ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbTiposDocumental_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_tpo_dcmntl] ASC),
    CONSTRAINT [FK1_tbTiposDocumental_Vigencias_tbTiposDocumental] FOREIGN KEY ([cnsctvo_cdgo_tpo_dcmntl]) REFERENCES [dbo].[tbTiposDocumental] ([cnsctvo_cdgo_tpo_dcmntl]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposDocumental_Vigencias] TO [Unibase]
    AS [dbo];

