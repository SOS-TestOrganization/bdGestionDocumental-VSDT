CREATE TABLE [dbo].[tbTiposFlujo_Vigencias] (
    [cnsctvo_vgnca_cdgo_tpo_fljo] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_tpo_fljo]       [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_tpo_fljo]               CHAR (4)               NOT NULL,
    [dscrpcn_tpo_fljo]            [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                  DATETIME               NOT NULL,
    [fn_vgnca]                    DATETIME               NOT NULL,
    [fcha_crcn]                   DATETIME               NOT NULL,
    [usro_crcn]                   [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                    [dbo].[udtObservacion] NOT NULL,
    [vsble_usro]                  [dbo].[udtLogico]      NOT NULL,
    [tme_stmp]                    ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbTiposFlujo_Vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_cdgo_tpo_fljo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbTiposFlujo_Vigencias] TO [Unibase]
    AS [dbo];

