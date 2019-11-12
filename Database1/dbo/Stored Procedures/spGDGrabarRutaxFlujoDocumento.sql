
CREATE Procedure	[dbo].[spGDGrabarRutaxFlujoDocumento]
@cnsctvo_cdgo_fljo			Int,
@cnsctvo_cdgo_dcmnto		Int,
@cnsctvo_cdgo_rta			Int,
@cnsctvo_cdgo_rta_antrr		Int,
@usro_crcn					Varchar(30),
@usro_rspnsble				Varchar(30),
@cnsctvo_cdgo_tpo_gstn		Int,
@cnsctvo_cdgo_tpo_ingrso	Int,
@fcha_asgncn_gstn			Datetime,
@fcha_inco_gstn				Datetime,
@fcha_fn_gstn				Datetime,
@obsrvcn					Varchar(7500)	=	Null,
@cmntro						Varchar(7500),
@ttl_rgstrs					Int,
@actlza_usro				Int,
@estdo						Int	Output

As
Set Nocount On

/*
Set			@cnsctvo_cdgo_fljo		=	1
Set			@cnsctvo_cdgo_dcmnto	=	190927
Set			@cnsctvo_cdgo_rta		=	0
Set			@fcha_crcn				=	Getdate()
Set			@usro_crcn				=	'siscgm01'
Set			@vsble_usro				=	'S'
*/
Declare		@cnsctvo_cdgo_rta_pr_fljo_dcmnto	Int,
			@cnsctvo_rgstro_gstn_dcmnto			Int,
			@fcha_crcn							Datetime,
			@vsble_usro							Char(1),
			@dscrpcn_rta_antrr					Varchar(150),
			@cnsctvo_cdgo_rgstro_gstn_dcmnto	Int,
			@fnlzcn_fljo						Char(1),
			@fcha_fnlzcn						Datetime
Set			@cnsctvo_cdgo_rta_pr_fljo_dcmnto	=	0
Set			@estdo								=	0
Set			@fcha_crcn							=	Getdate()
Set			@vsble_usro							=	'S'
Set			@fnlzcn_fljo						=	'N'
Set			@fcha_fnlzcn						=	Null

Select		@dscrpcn_rta_antrr	=	dscrpcn_rta
From		bdGestionDocumental.dbo.tbRutas
Where		cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
And			cnsctvo_cdgo_rta	=	@cnsctvo_cdgo_rta_antrr

Select		@fnlzcn_fljo	=	Case	When r.cnsctvo_cdgo_pso_fnl = 99999 Then 'S'
										Else	'N'
								End
From		bdGestionDocumental.dbo.tbRutas	r
Where		r.cnsctvo_cdgo_rta	=	@cnsctvo_cdgo_rta


If Not Exists	(	Select	1
					From	bdGestionDocumental.dbo.tbRutasxFlujosDocumentos
					Where	cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
					And		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
				)
	Begin
		--Set	@cnsctvo_cdgo_rta			=	1
		Set	@cnsctvo_rgstro_gstn_dcmnto	=	1

		Insert Into		bdGestionDocumental.dbo.tbRutasxFlujosDocumentos
		Values			(	@cnsctvo_cdgo_rta,	@cnsctvo_cdgo_fljo,		@cnsctvo_cdgo_dcmnto,		@fcha_crcn,
							@usro_crcn,			@vsble_usro
						)
			If @@Error != 0
				Begin
					Rollback Transaction
					Return -1
					Set	@estdo = 1
				End


		-- Insertar primer registro cuando el documento va a iniciar el flujo
		Insert Into		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
		Values			(		@cnsctvo_rgstro_gstn_dcmnto,				@cnsctvo_cdgo_dcmnto,			@cnsctvo_cdgo_fljo,
								@cnsctvo_cdgo_tpo_gstn,						@cnsctvo_cdgo_rta_antrr,		@cnsctvo_cdgo_rta_antrr,
								@usro_crcn,									Null,							'Flujo inicializado',	
								@fcha_asgncn_gstn,							@fcha_inco_gstn,				@fcha_fn_gstn
						)

			If @@Error != 0
				Begin
					Rollback Transaction
					Return -1
					Set	@estdo = 1
				End

		Select	@cnsctvo_rgstro_gstn_dcmnto		=	Max(cnsctvo_rgstro_gstn_dcmnto)+1
		From	bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
		Where	cnsctvo_cdgo_fljo		=	@cnsctvo_cdgo_fljo
		And		cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto

		-- Insertar segundo registro del documento
		Insert Into		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
		Values			(		@cnsctvo_rgstro_gstn_dcmnto,		@cnsctvo_cdgo_dcmnto,			@cnsctvo_cdgo_fljo,
								@cnsctvo_cdgo_tpo_gstn,				@cnsctvo_cdgo_rta_antrr,		@cnsctvo_cdgo_rta,
								@usro_rspnsble,						Null,							@cmntro,
								@fcha_asgncn_gstn,					Null,							Null
						)

			If @@Error != 0
				Begin
					Rollback Transaction
					Return -1
					Set	@estdo = 1
				End
	End
Else
	If	@cnsctvo_cdgo_tpo_ingrso = 1
		Begin
			Select	@cnsctvo_cdgo_rta_pr_fljo_dcmnto	=	Max(cnsctvo_cdgo_rta_pr_fljo_dcmnto)
			From	bdGestionDocumental.dbo.tbRutasxFlujosDocumentos
			Where	cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
			And		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
			And		cnsctvo_cdgo_rta	=	@cnsctvo_cdgo_rta_antrr
			And		vsble_usro			=	'S'

			-- Actualizar ruta anterior del documento a no visible
			Update	bdGestionDocumental.dbo.tbRutasxFlujosDocumentos
			Set		vsble_usro			=	'N'
			Where	cnsctvo_cdgo_rta_pr_fljo_dcmnto	=	@cnsctvo_cdgo_rta_pr_fljo_dcmnto


			If	@fnlzcn_fljo = 'S'
				Set	@vsble_usro	=	'N'
			Else
				Set	@vsble_usro	=	'S'

			-- Insertar nueva ruta del documento
			Insert Into		bdGestionDocumental.dbo.tbRutasxFlujosDocumentos
			Values			(	@cnsctvo_cdgo_rta,	@cnsctvo_cdgo_fljo,		@cnsctvo_cdgo_dcmnto,		@fcha_crcn,
								@usro_crcn,			@vsble_usro
							)

				If @@Error != 0
					Begin
						Rollback Transaction
						Return -1
						Set	@estdo = 1
					End

			-- Actualizar registro anterior
			Update	bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
			Set		fcha_inco_gstn				=	@fcha_inco_gstn,
					fcha_fn_gstn				=	@fcha_fn_gstn
			Where	cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
			And		cnsctvo_cdgo_dcmnto			=	@cnsctvo_cdgo_dcmnto
			And		cnsctvo_cdgo_estdo_dcmnto	=	@cnsctvo_cdgo_rta_antrr
			And		cnsctvo_cdgo_tpo_gstn		<>	4

		
			Select	@cnsctvo_rgstro_gstn_dcmnto		=	Max(cnsctvo_rgstro_gstn_dcmnto) + 1
			From	bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
			Where	cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
			And		cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo


			If	@fnlzcn_fljo = 'S'
				Set	@fcha_fnlzcn	=	Getdate()
			Else
				Set	@fcha_fnlzcn	=	Null
			

			-- Insertar nuevo registro de gestión del documento
			Insert Into		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
			Values			(		@cnsctvo_rgstro_gstn_dcmnto,		@cnsctvo_cdgo_dcmnto,			@cnsctvo_cdgo_fljo,
									@cnsctvo_cdgo_tpo_gstn,				@cnsctvo_cdgo_rta_antrr,		@cnsctvo_cdgo_rta,
									@usro_rspnsble,						@obsrvcn,						@cmntro,
									@fcha_fn_gstn,						@fcha_fnlzcn,					@fcha_fnlzcn
							)

				If @@Error != 0
					Begin
						Rollback Transaction
						Return -1
						Set	@estdo = 1
					End

				If @actlza_usro <> 0
						Begin
							Select		@cnsctvo_cdgo_rgstro_gstn_dcmnto	=	Max(cnsctvo_cdgo_rgstro_gstn_dcmnto)
							From		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
							Where		cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
							And			cnsctvo_cdgo_dcmnto			=	@cnsctvo_cdgo_dcmnto
							And			cnsctvo_cdgo_tpo_gstn		<>	4

							Update		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
							Set			usro_gstn	=	@usro_rspnsble
							Where		cnsctvo_cdgo_rgstro_gstn_dcmnto	=	@cnsctvo_cdgo_rgstro_gstn_dcmnto
						End
		End
	Else
		Begin
			Declare	@cntdr	Int
			Set		@cntdr	=	0
			While	@cntdr	<	@ttl_rgstrs
				Begin
					Select	@cnsctvo_cdgo_rta_pr_fljo_dcmnto	=	Max(cnsctvo_cdgo_rta_pr_fljo_dcmnto)-@cntdr
					From	bdGestionDocumental.dbo.tbRutasxFlujosDocumentos
					Where	cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
					And		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
					And		cnsctvo_cdgo_rta	=	@cnsctvo_cdgo_rta_antrr
					And		vsble_usro			=	'S'
					--And		fcha_crcn			<>	@fcha_crcn

					-- Actualizar ruta anterior del documento a no visible
					Update	bdGestionDocumental.dbo.tbRutasxFlujosDocumentos
					Set		vsble_usro			=	'S'
					Where	cnsctvo_cdgo_rta_pr_fljo_dcmnto	=	@cnsctvo_cdgo_rta_pr_fljo_dcmnto
				
					Set	@cntdr	=	@cntdr+1
				End

				Declare	@cnsctvo_cdgo_rta_antrr_1		Int,
						@cnsctvo_cdgo_pso_incl			Int

				Select	@cnsctvo_cdgo_pso_incl	=	cnsctvo_cdgo_pso_incl
				From	bdGestionDocumental.dbo.tbRutas
				Where	cnsctvo_cdgo_rta	= @cnsctvo_cdgo_rta
				--print	@cnsctvo_cdgo_pso_incl

				Select	@cnsctvo_cdgo_rta_antrr_1	=	cnsctvo_cdgo_rta
				From	bdGestionDocumental.dbo.tbRutas
				Where	cnsctvo_cdgo_pso_fnl	=	@cnsctvo_cdgo_pso_incl
				And		cnsctvo_cdgo_rta		<	@cnsctvo_cdgo_rta
				--print	@cnsctvo_cdgo_rta_antrr

				-- Actualizar ruta anterior del documento a no visible
				Update	bdGestionDocumental.dbo.tbRutasxFlujosDocumentos
				Set		vsble_usro			=	'N'
				Where	cnsctvo_cdgo_rta	=	@cnsctvo_cdgo_rta_antrr_1
				And		cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
				And		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
				And		vsble_usro			=	'S'

				If	@fnlzcn_fljo = 'S'
					Set	@vsble_usro	=	'N'
				Else
					Set	@vsble_usro	=	'S'

				-- Insertar nueva ruta del documento
				Insert Into		bdGestionDocumental.dbo.tbRutasxFlujosDocumentos
				Values			(	@cnsctvo_cdgo_rta,	@cnsctvo_cdgo_fljo,		@cnsctvo_cdgo_dcmnto,		@fcha_crcn,
									@usro_crcn,			@vsble_usro
								)

				If @@Error != 0
					Begin
						Rollback Transaction
						Return -1
						Set	@estdo = 1
					End

				-- Actualizar registro anterior
			Update	bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
			Set		fcha_inco_gstn				=	@fcha_inco_gstn,
					fcha_fn_gstn				=	@fcha_fn_gstn
			Where	cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
			And		cnsctvo_cdgo_dcmnto			=	@cnsctvo_cdgo_dcmnto
			And		cnsctvo_cdgo_estdo_dcmnto	=	@cnsctvo_cdgo_rta_antrr
			And		cnsctvo_cdgo_tpo_gstn		<>	4
		

			Select	@cnsctvo_rgstro_gstn_dcmnto		=	Max(cnsctvo_rgstro_gstn_dcmnto) + 1
			From	bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
			Where	cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
			And		cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo

			If	@fnlzcn_fljo = 'S'
				Set	@fcha_fnlzcn	=	Getdate()
			Else
				Set	@fcha_fnlzcn	=	Null

			-- Insertar nuevo registro de gestión del documento
			Insert Into		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
			Values			(		@cnsctvo_rgstro_gstn_dcmnto,		@cnsctvo_cdgo_dcmnto,			@cnsctvo_cdgo_fljo,
									@cnsctvo_cdgo_tpo_gstn,				@cnsctvo_cdgo_rta_antrr,		@cnsctvo_cdgo_rta,
									@usro_rspnsble,						@obsrvcn,						@cmntro,
									@fcha_fn_gstn,						@fcha_fnlzcn,					@fcha_fnlzcn
							)

				If @@Error != 0
					Begin
						Rollback Transaction
						Return -1
						Set	@estdo = 1
					End
			
			If @actlza_usro <> 0
						Begin
							Select		@cnsctvo_cdgo_rgstro_gstn_dcmnto	=	Max(cnsctvo_cdgo_rgstro_gstn_dcmnto)
							From		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
							Where		cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
							And			cnsctvo_cdgo_dcmnto			=	@cnsctvo_cdgo_dcmnto
							And			cnsctvo_cdgo_tpo_gstn		<>	4

							Update		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
							Set			usro_gstn					=	@usro_rspnsble,
										cnsctvo_cdgo_estdo_dcmnto	=	@cnsctvo_cdgo_rta
							Where		cnsctvo_cdgo_rgstro_gstn_dcmnto	=	@cnsctvo_cdgo_rgstro_gstn_dcmnto
						End

		End
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarRutaxFlujoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarRutaxFlujoDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarRutaxFlujoDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarRutaxFlujoDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarRutaxFlujoDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarRutaxFlujoDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarRutaxFlujoDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarRutaxFlujoDocumento] TO [visosservice_role]
    AS [dbo];

