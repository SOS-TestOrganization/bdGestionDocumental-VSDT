
CREATE Procedure [dbo].[spGDGrabarIteracionxDocumento]
@cnsctvo_cdgo_fljo		Int,
@cnsctvo_cdgo_dcmnto	Int,
@cnsctvo_cdgo_itrcn		Int,
@usro_crcn				udtUsuario,
@fcha_asgncn_gstn		Datetime,
@fcha_inco_gstn			Datetime,
@fcha_fn_gstn			Datetime,
@obsrvcn				Varchar(7500)

As
Set Nocount On
/*
Set		@cnsctvo_cdgo_fljo		=	1
Set		@cnsctvo_cdgo_dcmnto	=	190930
Set		@cnsctvo_cdgo_itrcn		=	0
*/

Create Table #tmpregistrogestiondocumento
(
cnsctvo_rgstro_gstn_dcmnto	Int,
cnsctvo_cdgo_dcmnto			Int,
cnsctvo_cdgo_tpo_gstn		Int,
cnsctvo_cdgo_estdo_dcmnto	Int,
usro_gstn					Varchar(30),
dscrpcn_gstn				Varchar(5000),
fcha_asgncn					Datetime,
fcha_inco_gstn				Datetime,
fcha_fn_gstn				Datetime
)

Declare		@cnsctvo_cdgo_fljo_pr_dcmnto	Int,
			@cnsctvo_itrcn_actdo			Int,
			@fcha_crcn						Datetime,
			@fcha_asgncn_antrr				Datetime,
			@vsble_usro						Char(1),
			@ttl_itrcns						Int

Set			@fcha_crcn	=	Getdate()
Set			@vsble_usro	=	'S'

Select		@ttl_itrcns			=	nmro_itrcns
From		tbFlujos_Vigencias
Where		cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo

Select		@cnsctvo_cdgo_fljo_pr_dcmnto	=	cnsctvo_cdgo_fljo_pr_dcmnto
From		tbFlujosxDocumentos
Where		cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
And			cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
And			vsble_usro			=	'S'

If Exists	(	Select	1
				From	tbIteracionesxFlujoDocumentos
				Where	cnsctvo_cdgo_fljo_pr_dcmnto	=	@cnsctvo_cdgo_fljo_pr_dcmnto
			)
	Begin
			Select	@cnsctvo_itrcn_actdo	=	Max(cnsctvo_cdgo_itrcn)
			From	tbIteracionesxFlujoDocumentos
			Where	cnsctvo_cdgo_fljo_pr_dcmnto	=	@cnsctvo_cdgo_fljo_pr_dcmnto


			Update	tbIteracionesxFlujoDocumentos
			Set		vsble_usro	=	'N'
			Where	cnsctvo_cdgo_fljo_pr_dcmnto	=	@cnsctvo_cdgo_fljo_pr_dcmnto
			And		cnsctvo_cdgo_itrcn			=	@cnsctvo_itrcn_actdo
	End

Insert Into	dbo.tbIteracionesxFlujoDocumentos
Values
(
@cnsctvo_cdgo_itrcn,				@cnsctvo_cdgo_fljo_pr_dcmnto,			@fcha_crcn,			@usro_crcn,
@vsble_usro,						@obsrvcn
)

If	@cnsctvo_cdgo_itrcn	=	@ttl_itrcns
	Begin
		Update		tbFlujosxDocumentos
		Set			vsble_usro	=	'N'
		Where		cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
		And			cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
	End




-- Insertar registro en la tabla de Registro Gestion por Documento
Insert Into	#tmpregistrogestiondocumento
Select		0,				@cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_itrcn,		@cnsctvo_cdgo_itrcn,
			@usro_crcn,		@obsrvcn,					@fcha_asgncn_gstn,			@fcha_inco_gstn,
			@fcha_fn_gstn				

--Insertar en la tabla real de tbRegistrosGestionxContacto
Declare		@cnsctvo_rgstro_gstn_dcmnto		Int
Select		@cnsctvo_rgstro_gstn_dcmnto		= IsNull(Max(cnsctvo_rgstro_gstn_dcmnto),0) From bdGestionDocumental.dbo.tbRegistrosGestionxDocumento Where cnsctvo_cdgo_dcmnto = @cnsctvo_cdgo_dcmnto

Update		#tmpregistrogestiondocumento
Set			@cnsctvo_rgstro_gstn_dcmnto		= cnsctvo_rgstro_gstn_dcmnto	=	@cnsctvo_rgstro_gstn_dcmnto + 1


If @cnsctvo_rgstro_gstn_dcmnto <> 1
	Begin
		Select		@fcha_asgncn_antrr	=	fcha_fn_gstn
		From		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
		Where		cnsctvo_rgstro_gstn_dcmnto	=	@cnsctvo_rgstro_gstn_dcmnto - 1

		Update		#tmpregistrogestiondocumento
		Set			fcha_asgncn		=	@fcha_asgncn_antrr
	End


Insert 
Into		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
Select		cnsctvo_rgstro_gstn_dcmnto,				cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_gstn,
			cnsctvo_cdgo_estdo_dcmnto,				usro_gstn,						dscrpcn_gstn,
			fcha_asgncn,							fcha_inco_gstn,					fcha_fn_gstn
From		#tmpregistrogestiondocumento

Drop Table	#tmpregistrogestiondocumento

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIteracionxDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIteracionxDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIteracionxDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIteracionxDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIteracionxDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIteracionxDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIteracionxDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIteracionxDocumento] TO [visosservice_role]
    AS [dbo];

