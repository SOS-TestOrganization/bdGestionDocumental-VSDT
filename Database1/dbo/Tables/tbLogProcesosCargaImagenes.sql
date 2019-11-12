CREATE TABLE [dbo].[tbLogProcesosCargaImagenes] (
    [cnsctvo_cdgo_lg]              [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cdgo_lg]                      CHAR (4)               NOT NULL,
    [cnsctvo_cdgo_prcso_crga_imgn] [dbo].[udtConsecutivo] NULL,
    [dscrpcn_lg]                   [dbo].[udtDescripcion] NULL,
    [dto]                          [dbo].[udtDescripcion] NULL,
    [orgn_dto]                     [dbo].[udtDescripcion] NULL,
    [idntfcdr_dto]                 [dbo].[udtDescripcion] NULL,
    [cnsctvo_cdgo_tpo_errr]        [dbo].[udtConsecutivo] NULL,
    [fcha_crcn]                    DATETIME               CONSTRAINT [DF_tbLogCargaImagenes_fcha_crcn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tbLogCargaImagenes] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_lg] ASC),
    CONSTRAINT [FK_tbLogProcesosCargaImagenes_tbTiposErrorLog] FOREIGN KEY ([cnsctvo_cdgo_tpo_errr]) REFERENCES [dbo].[tbTiposErrorLog] ([cnsctvo_cdgo_tpo_errr])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbLogProcesosCargaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbLogProcesosCargaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbLogProcesosCargaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbLogProcesosCargaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbLogProcesosCargaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbLogProcesosCargaImagenes] TO [Unibase]
    AS [dbo];

