


CREATE Procedure [dbo].[spGDGrabarFlujoTrabajo]
--Declare
@nmbre_fljo				udtDescripcion,
@dscrpcn_fljo			udtDescripcion,
@cnsctvo_cdgo_tpo_fljo	udtConsecutivo,
@ttl_itrcns				udtConsecutivo,
@usro_crcn				udtusuario,
@estdo					Int Output

As
Set Nocount On

Declare		@fcha_crcn	Datetime,
			@inco_vgnca	Datetime,
			@fn_vgnca	Datetime,
			@vsble_usro Char(1)
				
Set			@fcha_crcn	=	Getdate()
Set			@inco_vgnca	=	Getdate()
Set			@fn_vgnca	=	'9999-12-31'
Set			@vsble_usro	=	'S'
Set			@estdo	=	0

Create Table #tmpParametros
(
cnsctvo_vgnca_cdgo_itrcn	Int,
cnsctvo_cdgo_itrcn			Int,
cdgo_itrcn					Char(4),
nmro_itm					Int,
dscrpcn_itm					Varchar(150),
dscrpcn_ara_fnte 			Varchar(150),
dscrpcn_ara_dstno 			Varchar(150),
cnsctvo_cdgo_ara_fnte		Int,
cnsctvo_cdgo_ara_dstno		Int,
rspnsble					Varchar(30),
cnsctvo_rgstro				Int
)

Insert
Into		#tmpParametros
Select		0,							0,							'0',						nmro_itm,
			dscrpcn_itm,				ara_fnte,					ara_dstno,					cnsctvo_cdgo_ara_fnte,
			cnsctvo_cdgo_ara_dstno,		rspnsble,					cnsctvo_rgstro
From		#tmpFlujoTrabajo
Order By	nmro_itm

Declare	@cnsctvo_vgnca_cdgo_fljo	Int,
		@cnsctvo_cdgo_fljo			Int

Select	@cnsctvo_vgnca_cdgo_fljo	=	Max(cnsctvo_vgnca_cdgo_fljo)
From	dbo.tbFlujos_Vigencias

Select	@cnsctvo_cdgo_fljo	=	Max(cnsctvo_cdgo_fljo)
From	dbo.tbFlujos

If @cnsctvo_vgnca_cdgo_fljo Is Null
	Set	@cnsctvo_vgnca_cdgo_fljo = 0
Set	@cnsctvo_vgnca_cdgo_fljo = @cnsctvo_vgnca_cdgo_fljo + 1

If @cnsctvo_cdgo_fljo Is Null
	Set	@cnsctvo_cdgo_fljo = 0
Set	@cnsctvo_cdgo_fljo = @cnsctvo_cdgo_fljo + 1

-- Insertar en las tablas de Flujo
Insert Into	dbo.tbFlujos
Values
(
	@cnsctvo_cdgo_fljo,			Convert(Char(4),@cnsctvo_cdgo_fljo),		@nmbre_fljo,
	@fcha_crcn,					@usro_crcn,									@vsble_usro
)

Insert Into	dbo.tbFlujos_Vigencias
Values
(
	@cnsctvo_vgnca_cdgo_fljo,	@cnsctvo_cdgo_fljo,							Convert(Char(4),@cnsctvo_cdgo_fljo),
	@nmbre_fljo,				@inco_vgnca,								@fn_vgnca,
	@fcha_crcn,					@usro_crcn,									@dscrpcn_fljo,
	@vsble_usro,				@ttl_itrcns,								Null
)

Insert Into	dbo.tbFlujosxTipoFlujo
Values
(
	@cnsctvo_cdgo_fljo,			@cnsctvo_cdgo_tpo_fljo,						@fcha_crcn,
	@usro_crcn,					@vsble_usro
)

Declare @tbareas As Table
(
cnsctvo_cdgo_ara	Int,
cnsctvo_cdgo_fljo	Int
)

Insert Into @tbareas
Select		cnsctvo_cdgo_ara_fnte,		@cnsctvo_cdgo_fljo
From		#tmpParametros

Insert Into @tbareas
Select		a.cnsctvo_cdgo_ara_dstno,	@cnsctvo_cdgo_fljo
From		#tmpParametros	a
Left Join	@tbareas		b On b.cnsctvo_cdgo_ara = a.cnsctvo_cdgo_ara_dstno
Where		b.cnsctvo_cdgo_ara Is Null


-- Insertar Flujo x Areas
Insert Into	dbo.tbFlujosxAreas
Select		cnsctvo_cdgo_fljo,			cnsctvo_cdgo_ara,						@fcha_crcn,
			@usro_crcn,					@vsble_usro
From		@tbareas



-- Insertar en las tablas de Iteraciones
Declare	@cnsctvo_vgnca_cdgo_itrcn	Int,
		@cnsctvo_cdgo_itrcn			Int

Select	@cnsctvo_vgnca_cdgo_itrcn	=	Max(cnsctvo_vgnca_cdgo_itrcn)
From	dbo.tbIteraciones_Vigencias

If @cnsctvo_vgnca_cdgo_itrcn Is Null
	Set @cnsctvo_vgnca_cdgo_itrcn = 0

Select	@cnsctvo_cdgo_itrcn	=	Max(cnsctvo_cdgo_itrcn)
From	dbo.tbIteraciones_Vigencias

If @cnsctvo_cdgo_itrcn Is Null
	Set @cnsctvo_cdgo_itrcn = 0

Update	#tmpParametros
Set		@cnsctvo_vgnca_cdgo_itrcn	=	cnsctvo_vgnca_cdgo_itrcn	=	@cnsctvo_vgnca_cdgo_itrcn + 1,
		@cnsctvo_cdgo_itrcn			=	cnsctvo_cdgo_itrcn			=	@cnsctvo_cdgo_itrcn + 1

Update	#tmpParametros
Set		cdgo_itrcn	=	Convert(char(4),cnsctvo_cdgo_itrcn )


Insert Into	dbo.tbIteraciones
Select		cnsctvo_cdgo_itrcn,			cdgo_itrcn,			dscrpcn_itm,			@fcha_crcn,			@usro_crcn,
			@vsble_usro
From		#tmpParametros

Insert Into	dbo.tbIteraciones_Vigencias
Select		cnsctvo_vgnca_cdgo_itrcn,	cnsctvo_cdgo_itrcn,			cdgo_itrcn,					dscrpcn_itm,
			@inco_vgnca,				@fn_vgnca,					@fcha_crcn,					@usro_crcn,
			'.',						@vsble_usro,				cnsctvo_cdgo_ara_fnte,		cnsctvo_cdgo_ara_dstno,
			Null,						rspnsble,					Null		
From		#tmpParametros

Insert Into	dbo.tbIteracionesxFlujo
Select		cnsctvo_cdgo_itrcn,			@cnsctvo_cdgo_fljo,			@fcha_crcn,					@usro_crcn,
			@vsble_usro	
From		#tmpParametros


Drop Table	#tmpParametros



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarFlujoTrabajo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarFlujoTrabajo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarFlujoTrabajo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarFlujoTrabajo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarFlujoTrabajo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarFlujoTrabajo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarFlujoTrabajo] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarFlujoTrabajo] TO [visosservice_role]
    AS [dbo];

