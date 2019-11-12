


CREATE Procedure [dbo].[spGDGrabarGestionxDocumento]
@cnsctvo_cdgo_fljo			Int,
@cnsctvo_cdgo_dcmnto		Int,
@cnsctvo_cdgo_rta			Int,
@cnsctvo_cdgo_tpo_gstn		Int,
@usro_crcn					udtUsuario,
@fcha_asgncn_gstn			Datetime,
@fcha_inco_gstn				Datetime,
@fcha_fn_gstn				Datetime,
@obsrvcn					Varchar(7500),
@actlza_usro				Int,
@estdo						Int	Output

As
Set Nocount On

Set			@estdo = 0
Declare		@cnsctvo_rgstro_gstn_dcmnto			Int,
			@cnsctvo_cdgo_estdo_dcmnto_antrr	Int

If Not Exists	(	Select	1
					From	bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
					Where	cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo
					And		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
				)
	Begin
		Begin Transaction	
				Set	@cnsctvo_rgstro_gstn_dcmnto	=	1
				
				Insert Into		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
				Values			(		@cnsctvo_rgstro_gstn_dcmnto,				@cnsctvo_cdgo_dcmnto,			@cnsctvo_cdgo_fljo,
										@cnsctvo_cdgo_tpo_gstn,						@cnsctvo_cdgo_rta,				@cnsctvo_cdgo_rta,
										@usro_crcn,									@obsrvcn,						Null,
										@fcha_asgncn_gstn,							@fcha_inco_gstn,				@fcha_fn_gstn
								)

					If @@Error != 0
						Begin
							Rollback Transaction
							Return -1
							Set	@estdo = 1
						End
					Else
						Commit Transaction
	End
Else
	Begin
		Begin Transaction
			Select		@cnsctvo_rgstro_gstn_dcmnto	=	Max(cnsctvo_rgstro_gstn_dcmnto)+1
			From		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
			Where		cnsctvo_cdgo_fljo		=	@cnsctvo_cdgo_fljo
			And			cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto
			/*
			-- Código de prueba 12/02/2009
			Select		@cnsctvo_cdgo_estdo_dcmnto_antrr	=	Max(cnsctvo_cdgo_estdo_dcmnto)
			From		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
			Where		cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
			And			cnsctvo_cdgo_dcmnto			=	@cnsctvo_cdgo_dcmnto
			And			cnsctvo_cdgo_estdo_dcmnto	<>	4

			Update		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
			Set			cnsctvo_cdgo_estdo_dcmnto	=	@cnsctvo_cdgo_estdo_dcmnto_antrr
			Where		cnsctvo_rgstro_gstn_dcmnto	=	@cnsctvo_rgstro_gstn_dcmnto
			And			cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
			-- Código de prueba 12/02/2009
			*/

			Insert Into		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
			Values			(		@cnsctvo_rgstro_gstn_dcmnto,				@cnsctvo_cdgo_dcmnto,			@cnsctvo_cdgo_fljo,
									@cnsctvo_cdgo_tpo_gstn,						@cnsctvo_cdgo_rta,				@cnsctvo_cdgo_rta,
									@usro_crcn,									@obsrvcn,						Null,
									@fcha_asgncn_gstn,							@fcha_inco_gstn,				@fcha_fn_gstn
							)
			
			
				If @@Error != 0
					Begin
						Rollback Transaction
						Return -1
						Set	@estdo = 1
					End
				Else	
					If @actlza_usro <> 0
						Begin
							Declare		@cnsctvo_cdgo_rgstro_gstn_dcmnto	Int
							Select		@cnsctvo_cdgo_rgstro_gstn_dcmnto	=	Max(cnsctvo_cdgo_rgstro_gstn_dcmnto)
							From		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
							Where		cnsctvo_cdgo_fljo			=	@cnsctvo_cdgo_fljo
							And			cnsctvo_cdgo_dcmnto			=	@cnsctvo_cdgo_dcmnto
							And			cnsctvo_cdgo_tpo_gstn		<>	4

							Update		bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
							Set			usro_gstn	=	@usro_crcn
							Where		cnsctvo_cdgo_rgstro_gstn_dcmnto	=	@cnsctvo_cdgo_rgstro_gstn_dcmnto
						
							If @@Error != 0
								Begin
									Rollback Transaction
									Return -1
									Set	@estdo = 1
								End
							Else
								Commit Transaction
						End
					Else
						Commit Transaction
	End
	




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionxDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionxDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionxDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionxDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionxDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionxDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionxDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionxDocumento] TO [visosservice_role]
    AS [dbo];

