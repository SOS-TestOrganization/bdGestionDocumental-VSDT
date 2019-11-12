
CREATE Procedure [dbo].[spGDConsultarDetalleFlujosxDocumento]
--Declare
@cnsctvo_cdgo_fljo		Int,
@cnsctvo_cdgo_dcmnto	Int,
@cnsctvo_cdgo_itrcn		Int

As
Set Nocount On

/*
Set		@cnsctvo_cdgo_fljo		=	1
Set		@cnsctvo_cdgo_dcmnto	=	190927
Set		@cnsctvo_cdgo_itrcn		=	3
*/

Declare @tbflujosareas As Table
(
		dscrpcn_fljo			Varchar(150),
		dscrpcn_ara_fnte		Varchar(150),
		dscrpcn_ara_dstno		Varchar(150),
		cnsctvo_cdgo_itrcn		Int,
		cnsctvo_cdgo_fljo		Int,
		cnsctvo_cdgo_ara_fnte	Int,
		cnsctvo_cdgo_ara_dstno	Int,
		dscrpcn_cmbo_itrcn		Varchar(150),
		dscrpcn_itrcn			Varchar(150),
		rspnsble_itrcn			Varchar(30)
)

Declare	@cntdd_itrcns_fljo		Int
Select	@cntdd_itrcns_fljo	=	Count(cnsctvo_cdgo_itrcn)
From	tbIteracionesxFlujo
Where	cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo

If @cnsctvo_cdgo_itrcn = 0
	Begin
		Insert Into		@tbflujosareas
		Select			f.dscrpcn_fljo,				'',					'',					ifl.cnsctvo_cdgo_itrcn,
						f.cnsctvo_cdgo_fljo,		i.ara_fnte,			i.ara_dstno,		'',
						i.dscrpcn_itrcn,			i.rspnsble_itrcn
		From			dbo.tbFlujos_Vigencias				f
		Inner Join		dbo.tbFlujosxDocumentos				fa	On	fa.cnsctvo_cdgo_fljo			=	f.cnsctvo_cdgo_fljo
		Inner Join		dbo.tbIteracionesxFlujo				ifl On	ifl.cnsctvo_cdgo_fljo			=	f.cnsctvo_cdgo_fljo
		Inner Join		dbo.tbIteraciones_Vigencias			i	On	i.cnsctvo_cdgo_itrcn			=	ifl.cnsctvo_cdgo_itrcn
		Where			fa.cnsctvo_cdgo_fljo	=			@cnsctvo_cdgo_fljo
		And				fa.cnsctvo_cdgo_dcmnto	=			@cnsctvo_cdgo_dcmnto
		And				ifl.cnsctvo_cdgo_itrcn	=			1
	End
Else
	If	@cnsctvo_cdgo_itrcn < @cntdd_itrcns_fljo
		Set	@cnsctvo_cdgo_itrcn	=	@cnsctvo_cdgo_itrcn + 1
		Begin
			Insert Into		@tbflujosareas
			Select			f.dscrpcn_fljo,			'',					'',					ifl.cnsctvo_cdgo_itrcn,
							f.cnsctvo_cdgo_fljo,	i.ara_fnte,			i.ara_dstno,		'',
							i.dscrpcn_itrcn,		i.rspnsble_itrcn
			From			dbo.tbFlujos_Vigencias				f
			Inner Join		dbo.tbFlujosxDocumentos				fa	On	fa.cnsctvo_cdgo_fljo			=	f.cnsctvo_cdgo_fljo
			Inner Join		dbo.tbIteracionesxFlujo				ifl On	ifl.cnsctvo_cdgo_fljo			=	f.cnsctvo_cdgo_fljo
			Inner Join		dbo.tbIteraciones_Vigencias			i	On	i.cnsctvo_cdgo_itrcn			=	ifl.cnsctvo_cdgo_itrcn
			Where			fa.cnsctvo_cdgo_fljo	=			@cnsctvo_cdgo_fljo
			And				fa.cnsctvo_cdgo_dcmnto	=			@cnsctvo_cdgo_dcmnto
			And				ifl.cnsctvo_cdgo_itrcn	=			@cnsctvo_cdgo_itrcn

			/*
			-- Código de prueba
			Set	@cnsctvo_cdgo_itrcn	=	@cnsctvo_cdgo_itrcn - 1

			Update		@tbflujosareas
			Set			rspnsble_itrcn	=	i.rspnsble_itrcn
			From		@tbflujosareas						a
			Inner Join	dbo.tbIteraciones_Vigencias			i	On	i.cnsctvo_cdgo_itrcn			=	a.cnsctvo_cdgo_itrcn-1
			Inner Join	dbo.tbIteracionesxFlujo				ifl On	ifl.cnsctvo_cdgo_fljo			=	a.cnsctvo_cdgo_fljo
			Where		ifl.cnsctvo_cdgo_itrcn		=	@cnsctvo_cdgo_itrcn
			*/
		End

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
Set				dscrpcn_cmbo_itrcn	=	Convert(Varchar(2),cnsctvo_cdgo_itrcn)+'.  '+Ltrim(Rtrim(dscrpcn_ara_fnte))+'  -->  '+Ltrim(Rtrim(dscrpcn_ara_dstno))
From			@tbflujosareas

Select			dscrpcn_fljo,		dscrpcn_ara_fnte,		dscrpcn_ara_dstno,			cnsctvo_cdgo_itrcn,
				cnsctvo_cdgo_fljo,	cnsctvo_cdgo_ara_fnte,	cnsctvo_cdgo_ara_dstno,		dscrpcn_cmbo_itrcn,
				dscrpcn_itrcn,		rspnsble_itrcn
From			@tbflujosareas










GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDetalleFlujosxDocumento] TO [visosservice_role]
    AS [dbo];

