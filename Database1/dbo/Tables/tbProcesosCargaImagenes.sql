CREATE TABLE [dbo].[tbProcesosCargaImagenes] (
    [cnsctvo_cdgo_prcso_crga_imgn] [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cdgo_prcso_crga_imgn]         CHAR (4)               NOT NULL,
    [dscrpcn_prcso_crga_imgn]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                    DATETIME               CONSTRAINT [DF_tbProcesosCargaImagenes_fcha_crcn] DEFAULT (getdate()) NOT NULL,
    [fcha_fn_prcso]                DATETIME               NULL,
    [usro_crcn]                    [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                   [dbo].[udtLogico]      NOT NULL,
    [cnsctvo_cdgo_dgtlzdr]         [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_dcmnto]      [dbo].[udtConsecutivo] NULL,
    [cntdd_rgstrs_crgds]           [dbo].[udtConsecutivo] NULL,
    [nmbre_archvo_indce]           VARCHAR (MAX)          NULL,
    [estdo]                        [dbo].[udtConsecutivo] NULL,
    [fcha_crga_prvdr]              DATETIME               NULL,
    CONSTRAINT [PK_tbProcesosCargaImagenes] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_prcso_crga_imgn] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_cnsctvo_dgtlzdr]
    ON [dbo].[tbProcesosCargaImagenes]([cnsctvo_cdgo_dgtlzdr] ASC)
    INCLUDE([cnsctvo_cdgo_prcso_crga_imgn], [cnsctvo_cdgo_tpo_dcmnto], [cntdd_rgstrs_crgds], [nmbre_archvo_indce]);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbProcesosCargaImagenes] TO [visosservice_role]
    AS [dbo];

