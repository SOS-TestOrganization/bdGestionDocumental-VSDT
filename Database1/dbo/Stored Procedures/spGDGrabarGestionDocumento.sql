Create Procedure [dbo].[spGDGrabarGestionDocumento]
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

Declare			@cnsctvo_rgstro_gstn_dcmnto		Int

Select			@cnsctvo_rgstro_gstn_dcmnto		=	Max(cnsctvo_rgstro_gstn_dcmnto) + 1
From			bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
Where			cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto


Insert Into	bdGestionDocumental.dbo.tbRegistrosGestionxDocumento
Values	(		@cnsctvo_rgstro_gstn_dcmnto,		@cnsctvo_cdgo_dcmnto,			@cnsctvo_cdgo_itrcn,
				@cnsctvo_cdgo_itrcn,				@usro_crcn,						@obsrvcn,
				@fcha_asgncn_gstn,					@fcha_inco_gstn,				@fcha_fn_gstn
		)


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarGestionDocumento] TO [visosservice_role]
    AS [dbo];

