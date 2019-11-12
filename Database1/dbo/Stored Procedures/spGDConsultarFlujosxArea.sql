CREATE Procedure spGDConsultarFlujosxArea
@cnsctvo_cdgo_ara	Int
As
Set Nocount On
--Set		@cnsctvo_cdgo_ara = 1

Declare @tbflujosareas As Table
(
		dscrpcn_fljo			Varchar(150),
		cnsctvo_cdgo_fljo		Int
)

Insert Into		@tbflujosareas
Select			f.dscrpcn_fljo,				f.cnsctvo_cdgo_fljo
From			dbo.tbFlujos_Vigencias		f
Inner Join		dbo.tbFlujosxAreas			fa	On	fa.cnsctvo_cdgo_fljo	=	f.cnsctvo_cdgo_fljo
Where			fa.cnsctvo_cdgo_ara	= @cnsctvo_cdgo_ara
And				Getdate()	>= f.inco_vgnca
And				Getdate()	<= f.fn_vgnca
And				f.vsble_usro = 'S'
And				fa.vsble_usro = 'S'

Select			*
From			@tbflujosareas


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxArea] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxArea] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxArea] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxArea] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxArea] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxArea] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxArea] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFlujosxArea] TO [visosservice_role]
    AS [dbo];

