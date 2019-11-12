Create Procedure	spGDConsultarResponsablesxRutas

As
Set Nocount On

Select		re.cnsctvo_cdgo_rspnsble,			ur.dscrpcn_usro_rspnde,			ur.lgn_usro_rspnde,
			re.cnsctvo_cdgo_rta,				ru.cnsctvo_cdgo_fljo		
From		bdGestionDocumental.dbo.tbResponsablesxRuta			re
Inner Join	bdGestionDocumental.dbo.tbRutas						ru	On	ru.cnsctvo_cdgo_rta	=	re.cnsctvo_cdgo_rta
Inner Join	bdserviciocliente.dbo.tbusuariosresponde_vigencias	ur	On	ur.cnsctvo_cdgo_usro_rspnde	=	re.cnsctvo_cdgo_rspnsble
Where		re.vsble_usro	=	'S'

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarResponsablesxRutas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarResponsablesxRutas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarResponsablesxRutas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarResponsablesxRutas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarResponsablesxRutas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarResponsablesxRutas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarResponsablesxRutas] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarResponsablesxRutas] TO [visosservice_role]
    AS [dbo];

