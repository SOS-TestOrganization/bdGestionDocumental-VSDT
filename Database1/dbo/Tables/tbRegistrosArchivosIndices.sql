CREATE TABLE [dbo].[tbRegistrosArchivosIndices] (
    [cnsctvo_cdgo_indce]           [dbo].[udtConsecutivo] IDENTITY (1, 1) NOT NULL,
    [cnsctvo_cdgo_tpo_dcmnto]      [dbo].[udtConsecutivo] NULL,
    [cnsctvo_cdgo_prcso_crga_imgn] [dbo].[udtConsecutivo] NULL,
    [fcha_crga]                    DATETIME               CONSTRAINT [DF_tbContenidoArchivosIndices_fcha_crga] DEFAULT (getdate()) NULL,
    [indce_mgrdo]                  [dbo].[udtLogico]      CONSTRAINT [DF_tbRegistrosArchivosIndices_indce_mgrdo] DEFAULT ('N') NULL,
    [fcha_dgtlzcn_frmtda]          DATETIME               NULL,
    [rta_archvo_fsco]              VARCHAR (250)          NULL,
    [nmbre_archvo_indce]           VARCHAR (50)           NULL,
    [estdo_vldcn]                  [dbo].[udtConsecutivo] NULL,
    [indce1]                       VARCHAR (50)           NULL,
    [indce2]                       VARCHAR (50)           NULL,
    [indce3]                       VARCHAR (50)           NULL,
    [indce4]                       VARCHAR (50)           NULL,
    [indce5]                       VARCHAR (50)           NULL,
    [indce6]                       VARCHAR (50)           NULL,
    [nmro_blsa]                    VARCHAR (20)           NULL,
    [tpo_anxo]                     VARCHAR (10)           NULL,
    [fcha_dgtlzcn]                 VARCHAR (50)           NULL,
    [nmbre_archvo]                 VARCHAR (250)          NULL,
    CONSTRAINT [PK_tbRegistrosArchivosIndices] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_indce] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [Unibase]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbRegistrosArchivosIndices] TO [visosservice_role]
    AS [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tipo de Documento al que pertenece este registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tbRegistrosArchivosIndices', @level2type = N'COLUMN', @level2name = N'cnsctvo_cdgo_tpo_dcmnto';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de Carga del Registro a Esta Tabla', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tbRegistrosArchivosIndices', @level2type = N'COLUMN', @level2name = N'fcha_crga';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indica Si El Indice Fue Migrado Exitosamente', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tbRegistrosArchivosIndices', @level2type = N'COLUMN', @level2name = N'indce_mgrdo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre del Archivo o Imagen al que se refiere este registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tbRegistrosArchivosIndices', @level2type = N'COLUMN', @level2name = N'nmbre_archvo';

