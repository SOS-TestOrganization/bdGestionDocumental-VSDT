CREATE TABLE [dbo].[tbDatosFinalesConsultaFormularios] (
    [cnsctvo_cdgo_dcmnto]          INT          NULL,
    [dscrpcn_tpo_frmlro]           VARCHAR (20) NULL,
    [nmro_frmlro]                  VARCHAR (20) NULL,
    [dscrpcn_tpo_frmlro_gd]        VARCHAR (20) NULL,
    [ttl_imgns]                    INT          NULL,
    [nmro_blsa]                    VARCHAR (10) NULL,
    [fcha_rdccn]                   DATETIME     NULL,
    [fcha_dgtcn_rdccn]             DATETIME     NULL,
    [cnsctvo_tpo_idntfccn_ctznte]  INT          NULL,
    [nmro_idntfccn_ctznte]         VARCHAR (30) NULL,
    [fcha_crga]                    DATETIME     NULL,
    [fcha_dgtlzcn]                 DATETIME     NULL,
    [cnsctvo_cdgo_prcso_crga_imgn] INT          NULL,
    [prvdr]                        VARCHAR (30) NULL,
    [frmlro_afldo]                 INT          NULL,
    [cnsctvo_cdgo_tpo_frmlro]      INT          NULL,
    [nmro_idntfccn_ctznte_gd]      VARCHAR (30) NULL,
    [dscrpcn_prvdr]                VARCHAR (30) NULL,
    [usro_dgtdr]                   VARCHAR (30) NULL,
    [frmlro_exstnte]               INT          NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbDatosFinalesConsultaFormularios] TO [Unibase]
    AS [dbo];

