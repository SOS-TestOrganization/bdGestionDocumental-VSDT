CREATE TABLE [dbo].[tbParametrosGenerales] (
    [cnsctvo_cdgo_prmtro_gnrl] INT           NOT NULL,
    [cdgo_prmtro_gnrl]         CHAR (3)      NOT NULL,
    [dscrpcn_prmtro_gnrl]      VARCHAR (150) NOT NULL,
    [fcha_crcn]                DATETIME      NOT NULL,
    [usro_crcn]                CHAR (30)     NOT NULL,
    [vsble_usro]               CHAR (1)      NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [Unibase]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbParametrosGenerales] TO [websos]
    AS [dbo];

