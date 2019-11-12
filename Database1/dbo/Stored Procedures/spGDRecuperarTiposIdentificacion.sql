
--exec spSCRecuperarTiposIdentificacion null, '04', null, null, 5, null
CREATE PROCEDURE [dbo].[spGDRecuperarTiposIdentificacion]
	@ldFechaReferencia						datetime		= Null,
	@lcCodigoAgrupadorTipoIdentificacion	udtCodigo		= Null,
	@lcCodigoTipoIdentificacion				udtTipoIdentificacion	= Null,
	@lnClaseEmpleador						udtConsecutivo		= Null,
	@lnTipoCliente							udtConsecutivo	= Null,
	@lcTraerTodosVisibleUsuario				udtLogico		= 'N'
AS
Set Nocount On
/*
Declare
	@ldFechaReferencia						datetime,
	@lcCodigoAgrupadorTipoIdentificacion	udtCodigo,
	@lcCodigoTipoIdentificacion				udtTipoIdentificacion,
	@lnClaseEmpleador						udtConsecutivo,
	@lnTipoCliente							udtConsecutivo,
	@lcTraerTodosVisibleUsuario				udtLogico

set	@ldFechaReferencia	= Null
set	@lcCodigoAgrupadorTipoIdentificacion	= '04'
set	@lcCodigoTipoIdentificacion				= Null
set	@lnClaseEmpleador						= Null
set	@lnTipoCliente							= 1
set	@lcTraerTodosVisibleUsuario				= Null
*/

If @ldFechaReferencia Is Null
	Set @ldFechaReferencia = GetDate()

If @lnClaseEmpleador Is not Null
	Begin
		Select	@lcCodigoAgrupadorTipoIdentificacion = b.cdgo_agrpdr_tpo_idntfccn
		From	bdAfiliacion.DBO.tbRelAgrupacionxClaseEmpleador a, bdAfiliacion.DBO.tbAgrupadoresTiposIdentificacion_Vigencias b
		Where	a.brrdo					=	'N'
		And 	(@ldFechaReferencia			Between a.inco_vgnca And a.fn_vgnca)
		And	(b.vsble_usro				=	'S'	OR	@lcTraerTodosVisibleUsuario	=	'S')
		And	(@ldFechaReferencia			Between b.inco_vgnca And b.fn_vgnca)
		And	a.cnsctvo_cdgo_clse_empldr		=	@lnClaseEmpleador
		And	a.cnsctvo_cdgo_agrpdr_tpo_idntfccn	=	b.cnsctvo_cdgo_agrpdr_tpo_idntfccn
	End

--select @ldFechaReferencia
If @lcCodigoTipoIdentificacion Is Null
	Begin
		IF @lcCodigoAgrupadorTipoIdentificacion IS Not Null 
		And @lnTipoCliente Is Not Null
			Begin
				If @lnTipoCliente In(3, 5, 6, 7)
					Begin
						-- si codigo tipo de identificacion no viene se deben seleccionar todos los  tipos de identificacion
						-- que no esten borrados, cumplan las vigencias y pertenezcan al codigo agrupador ingresado
						--Set	@lcTraerTodosVisibleUsuario	='S'
						Select	c.cdgo_tpo_idntfccn,	Substring(Ltrim(Rtrim(c.dscrpcn_tpo_idntfccn)),1,50)	dscrpcn_tpo_idntfccn,	c.cnsctvo_cdgo_tpo_idntfccn, 	rngo_infrr,	rngo_sprr, a.cnsctvo_cdgo_tpo_idntfccn a,
							a.cnsctvo_cdgo_agrpdr_tpo_idntfccn
						From	bdAfiliacion.DBO.tbRelAgrupacionxTiposIdentificacion_Vigencias a,	bdAfiliacion.DBO.tbAgrupadoresTiposIdentificacion_Vigencias b,	bdAfiliacion.DBO.tbTiposIdentificacion_Vigencias c
						Where	(b.cdgo_agrpdr_tpo_idntfccn 		= @lcCodigoAgrupadorTipoIdentificacion Or @lcCodigoAgrupadorTipoIdentificacion Is Null)
						And 	(@ldFechaReferencia			Between b.inco_vgnca And b.fn_vgnca)
						And	(b.vsble_usro				= 'S'	OR	@lcTraerTodosVisibleUsuario	=	'S')
						And 	b.cnsctvo_cdgo_agrpdr_tpo_idntfccn 	= a.cnsctvo_cdgo_agrpdr_tpo_idntfccn
						And 	(@ldFechaReferencia			Between a.inco_vgnca And a.fn_vgnca)
						And 	(@ldFechaReferencia			Between c.inco_vgnca And c.fn_vgnca)
						And	(c.vsble_usro				= 'S'	OR	@lcTraerTodosVisibleUsuario	=	'S')
						And 	a.cnsctvo_cdgo_tpo_idntfccn		= c.cnsctvo_cdgo_tpo_idntfccn
						And 	c.cnsctvo_cdgo_tpo_idntfccn In (1,3,9)
					End
				
				If @lnTipoCliente In (1, 4)
					Begin
						-- si codigo tipo de identificacion no viene se deben seleccionar todos los  tipos de identificacion
						-- que no esten borrados, cumplan las vigencias y pertenezcan al codigo agrupador ingresado
						--Set	@lcTraerTodosVisibleUsuario	='S'
						Select	c.cdgo_tpo_idntfccn,	Substring(Ltrim(Rtrim(c.dscrpcn_tpo_idntfccn)),1,50)	dscrpcn_tpo_idntfccn,	c.cnsctvo_cdgo_tpo_idntfccn, 	rngo_infrr,	rngo_sprr, a.cnsctvo_cdgo_tpo_idntfccn a,
							a.cnsctvo_cdgo_agrpdr_tpo_idntfccn
						From	bdAfiliacion.DBO.tbRelAgrupacionxTiposIdentificacion_Vigencias a,	bdAfiliacion.DBO.tbAgrupadoresTiposIdentificacion_Vigencias b,	bdAfiliacion.DBO.tbTiposIdentificacion_Vigencias c
						Where	(b.cdgo_agrpdr_tpo_idntfccn 		= @lcCodigoAgrupadorTipoIdentificacion Or @lcCodigoAgrupadorTipoIdentificacion Is Null)
						And 	(@ldFechaReferencia			Between b.inco_vgnca And b.fn_vgnca)
						And	(b.vsble_usro				= 'S'	OR	@lcTraerTodosVisibleUsuario	=	'S')
						And 	b.cnsctvo_cdgo_agrpdr_tpo_idntfccn 	= a.cnsctvo_cdgo_agrpdr_tpo_idntfccn
						And 	(@ldFechaReferencia			Between a.inco_vgnca And a.fn_vgnca)
						And 	(@ldFechaReferencia			Between c.inco_vgnca And c.fn_vgnca)
						And	(c.vsble_usro				= 'S'	OR	@lcTraerTodosVisibleUsuario	=	'S')
						And 	a.cnsctvo_cdgo_tpo_idntfccn		= c.cnsctvo_cdgo_tpo_idntfccn
						And		c.cnsctvo_cdgo_tpo_idntfccn <> 9
					End
				
				If @lnTipoCliente In (2)
					Begin
						-- si codigo tipo de identificacion no viene se deben seleccionar todos los  tipos de identificacion
						-- que no esten borrados, cumplan las vigencias y pertenezcan al codigo agrupador ingresado
						--Set	@lcTraerTodosVisibleUsuario	='S'
						Select	c.cdgo_tpo_idntfccn,	Substring(Ltrim(Rtrim(c.dscrpcn_tpo_idntfccn)),1,50)	dscrpcn_tpo_idntfccn,	c.cnsctvo_cdgo_tpo_idntfccn, 	rngo_infrr,	rngo_sprr, a.cnsctvo_cdgo_tpo_idntfccn a,
							a.cnsctvo_cdgo_agrpdr_tpo_idntfccn
						From	bdAfiliacion.DBO.tbRelAgrupacionxTiposIdentificacion_Vigencias a,	bdAfiliacion.DBO.tbAgrupadoresTiposIdentificacion_Vigencias b,	bdAfiliacion.DBO.tbTiposIdentificacion_Vigencias c
						Where	(b.cdgo_agrpdr_tpo_idntfccn 		= @lcCodigoAgrupadorTipoIdentificacion Or @lcCodigoAgrupadorTipoIdentificacion Is Null)
						And 	(@ldFechaReferencia			Between b.inco_vgnca And b.fn_vgnca)
						And	(b.vsble_usro				= 'S'	OR	@lcTraerTodosVisibleUsuario	=	'S')
						And 	b.cnsctvo_cdgo_agrpdr_tpo_idntfccn 	= a.cnsctvo_cdgo_agrpdr_tpo_idntfccn
						And 	(@ldFechaReferencia			Between a.inco_vgnca And a.fn_vgnca)
						And 	(@ldFechaReferencia			Between c.inco_vgnca And c.fn_vgnca)
						And	(c.vsble_usro				= 'S'	OR	@lcTraerTodosVisibleUsuario	=	'S')
						And 	a.cnsctvo_cdgo_tpo_idntfccn		= c.cnsctvo_cdgo_tpo_idntfccn
						And		c.cnsctvo_cdgo_tpo_idntfccn In (1,9)
					End
			End
		Else
			Begin
				--Set	@lcTraerTodosVisibleUsuario	='S'
				Select	cnsctvo_cdgo_tpo_idntfccn,		dscrpcn_tpo_idntfccn, cdgo_tpo_idntfccn,
						inco_vgnca,                                        fn_vgnca,
						fcha_crcn,                                                    usro_crcn,                
						obsrvcns,                                                vsble_usro,  rngo_sprr,
						rngo_infrr,				 edd_sprr,
						edd_infrr,				 0 as cnsctvo_cdgo_agrpdr_tpo_idntfccn
				From 	bdAfiliacion.DBO.tbTiposIdentificacion_Vigencias
				Where 	(@ldFechaReferencia			Between inco_vgnca And fn_vgnca)
				And	(vsble_usro				= 'S'	OR	@lcTraerTodosVisibleUsuario	=	'S')
			End
	End
Else
	Begin
		-- si codigo tipo de identificacion viene se deben seleccionar todos los tipos de identificacion
		-- que no esten borrados, cumplan las vigencias y tengan ese codigo tipo de identificacion
		Select	c.cdgo_tpo_idntfccn,	Substring(Ltrim(Rtrim(c.dscrpcn_tpo_idntfccn)),1,50)	dscrpcn_tpo_idntfccn,	c.cnsctvo_cdgo_tpo_idntfccn, 	rngo_infrr,	rngo_sprr, a.cnsctvo_cdgo_tpo_idntfccn a,
			a.cnsctvo_cdgo_agrpdr_tpo_idntfccn
		From 	bdAfiliacion.DBO.tbRelAgrupacionxTiposIdentificacion_Vigencias a,	bdAfiliacion.DBO.tbAgrupadoresTiposIdentificacion_Vigencias b,	bdAfiliacion.DBO.tbTiposIdentificacion_Vigencias c
		Where	(b.cdgo_agrpdr_tpo_idntfccn 		= @lcCodigoAgrupadorTipoIdentificacion Or @lcCodigoAgrupadorTipoIdentificacion Is Null)
		And	cdgo_tpo_idntfccn			= @lcCodigoTipoIdentificacion 
		And 	(@ldFechaReferencia			Between b.inco_vgnca And b.fn_vgnca)
		And	(b.vsble_usro				=	'S'	OR	@lcTraerTodosVisibleUsuario	=	'S')
		And 	b.cnsctvo_cdgo_agrpdr_tpo_idntfccn 	= a.cnsctvo_cdgo_agrpdr_tpo_idntfccn
		And 	(@ldFechaReferencia			Between a.inco_vgnca And a.fn_vgnca)
		And 	(@ldFechaReferencia			Between c.inco_vgnca And c.fn_vgnca)
		And	(c.vsble_usro				= 'S'	OR	@lcTraerTodosVisibleUsuario	=	'S')
		And 	a.cnsctvo_cdgo_tpo_idntfccn		= c.cnsctvo_cdgo_tpo_idntfccn
		Order by c.cdgo_tpo_idntfccn
	End



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIdentificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIdentificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIdentificacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIdentificacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIdentificacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIdentificacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIdentificacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposIdentificacion] TO [visosservice_role]
    AS [dbo];

