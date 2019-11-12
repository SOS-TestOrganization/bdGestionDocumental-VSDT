

CREATE Procedure [dbo].[spGDConsultarDetalleFlujosxArea]
@cnsctvo_cdgo_ara	Int
As
Set Nocount On
--Set		@cnsctvo_cdgo_ara = 1

Declare @tbflujosareas As Table
(
		dscrpcn_fljo			Varchar(150),
		dscrpcn_ara_fnte		Varchar(150),
		dscrpcn_ara_dstno		Varchar(150),
		cnsctvo_cdgo_itrcn		Int,
		cnsctvo_cdgo_fljo		Int,
		cnsctvo_cdgo_ara_fnte	Int,
		cnsctvo_cdgo_ara_dstno	Int,
		dscrpcn_itrcn			Varchar(150)
)

Insert Into		@tbflujosareas
Select			f.dscrpcn_fljo,		'', '', ifl.cnsctvo_cdgo_itrcn,		f.cnsctvo_cdgo_fljo,
				i.ara_fnte,					i.ara_dstno, ''
From			dbo.tbFlujos_Vigencias		f
Inner Join		dbo.tbFlujosxAreas			fa	On	fa.cnsctvo_cdgo_fljo	=	f.cnsctvo_cdgo_fljo
Inner Join		dbo.tbIteracionesxFlujo		ifl On	ifl.cnsctvo_cdgo_fljo	=	f.cnsctvo_cdgo_fljo
Inner Join		dbo.tbIteraciones_Vigencias	i	On	i.cnsctvo_cdgo_itrcn	=	ifl.cnsctvo_cdgo_itrcn
Where			fa.cnsctvo_cdgo_ara	= @cnsctvo_cdgo_ara

Update			@tbflujosareas
Set				dscrpcn_ara_fnte	=	a.dscrpcn_ara
From			bdServiciocliente.dbo.tbAreas_Vigencias	a
Inner Join		@tbflujosareas							f On f.cnsctvo_cdgo_ara_fnte = a.cnsctvo_cdgo_ara
Where			Getdate() >= a.inco_vgnca
And				Getdate() <= a.fn_vgnca

Update			@tbflujosareas
Set				dscrpcn_ara_dstno	=	a.dscrpcn_ara
From			bdServiciocliente.dbo.tbAreas_Vigencias	a
Inner Join		@tbflujosareas							f On f.cnsctvo_cdgo_ara_dstno = a.cnsctvo_cdgo_ara
Where			Getdate() >= a.inco_vgnca
And				Getdate() <= a.fn_vgnca


Update			@tbflujosareas
Set				dscrpcn_itrcn	=	Convert(Varchar(2),cnsctvo_cdgo_itrcn)+'.  '+Ltrim(Rtrim(dscrpcn_ara_fnte))+'  -->  '+Ltrim(Rtrim(dscrpcn_ara_dstno))
From			@tbflujosareas

Select			dscrpcn_fljo,		dscrpcn_ara_fnte,		dscrpcn_ara_dstno,			cnsctvo_cdgo_itrcn,
				cnsctvo_cdgo_fljo,	cnsctvo_cdgo_ara_fnte,	cnsctvo_cdgo_ara_dstno,		dscrpcn_itrcn
From			@tbflujosareas




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxArea] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxArea] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxArea] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxArea] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxArea] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxArea] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxArea] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxArea] TO [visosservice_role]
    AS [dbo];

