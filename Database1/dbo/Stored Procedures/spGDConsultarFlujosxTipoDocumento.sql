


CREATE Procedure [dbo].[spGDConsultarFlujosxTipoDocumento]
@cnsctvo_cdgo_tpo_dcmnto	Int

As
Set Nocount On
--Set		@cnsctvo_cdgo_ara = 1

Declare @tbflujosdocumento As Table
(
		dscrpcn_fljo			Varchar(150),
		cnsctvo_cdgo_fljo		Int
)

Insert Into		@tbflujosdocumento
Select			f.dscrpcn_fljo,				f.cnsctvo_cdgo_fljo
From			dbo.tbFlujos_Vigencias			f
Inner Join		dbo.tbFlujosxTipoDocumentos		fa	On	fa.cnsctvo_cdgo_fljo	=	f.cnsctvo_cdgo_fljo
Where			fa.cnsctvo_cdgo_tpo_dcmnto		=	@cnsctvo_cdgo_tpo_dcmnto
And				Getdate()		>= f.inco_vgnca
And				Getdate()		<= f.fn_vgnca
And				f.vsble_usro	= 'S'
And				fa.vsble_usro	= 'S'

Select			*
From			@tbflujosdocumento





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxTipoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxTipoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxTipoDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxTipoDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxTipoDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxTipoDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxTipoDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxTipoDocumento] TO [visosservice_role]
    AS [dbo];

