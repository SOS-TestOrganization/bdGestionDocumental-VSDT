CREATE TABLE [dbo].[tbTemporalRegistrosIndicesAgrupados] (
    [cnsctvo_tmpral]          INT               IDENTITY (1, 1) NOT NULL,
    [idntfcdr_unco]           VARCHAR (20)      NULL,
    [mgrdo]                   [dbo].[udtLogico] CONSTRAINT [DF__tbTempora__mgrdo__10766AC2] DEFAULT ('N') NULL,
    [cnsctvo_dcmnto_dgtlzdo]  INT               NULL,
    [cnsctvo_cdgo_tpo_dcmnto] INT               NULL,
    [numeroImagenes]          INT               NULL,
    [cnsctvo_prcso_crga]      INT               NULL,
    [indce1]                  VARCHAR (50)      NULL,
    [indce2]                  VARCHAR (50)      NULL,
    [indce3]                  VARCHAR (50)      NULL,
    [indce4]                  VARCHAR (50)      NULL,
    [indce5]                  VARCHAR (50)      NULL,
    [indce6]                  VARCHAR (50)      NULL,
    [nmro_blsa]               VARCHAR (20)      NULL,
    [tpo_anxo]                VARCHAR (10)      NULL,
    [fcha_dgtlzcn]            VARCHAR (50)      NULL,
    [nmbre_archvo]            VARCHAR (250)     NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTemporalRegistrosIndicesAgrupados] TO [Unibase]
    AS [dbo];

