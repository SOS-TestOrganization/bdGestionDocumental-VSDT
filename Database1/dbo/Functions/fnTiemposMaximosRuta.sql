


CREATE Function [dbo].[fnTiemposMaximosRuta]

(	@ConsecutivoCodigoFlujo			Int,
	@ConsecutivoCodigoRuta			Int,
	@FechaAsignacion				DateTime,
	@FechaReferencia				Datetime)

Returns float

As
Begin

	Declare @lnTiempoMaximo			float,
			@TiempoTranscurrido		float,
			@PorcentajeAvance		float
		
	Set @lnTiempoMaximo = (	Select	tmpo_rta
							From	bdGestionDocumental.dbo.tbRutas
							Where	cnsctvo_cdgo_fljo			= @ConsecutivoCodigoFlujo
							And		cnsctvo_cdgo_rta			= @ConsecutivoCodigoRuta
							And		inco_vgnca					<= Getdate()
							And		fn_vgnca					>= Getdate()
							And		vsble_usro					= 'S')

	If @FechaReferencia Is Null
		Set @TiempoTranscurrido = Datediff(Day,@FechaAsignacion,GetDate())
	Else
		Set @TiempoTranscurrido = Datediff(Day,@FechaAsignacion,@FechaReferencia)

	If	@lnTiempoMaximo = 0 Or @lnTiempoMaximo Is Null
		Set @PorcentajeAvance	= 0
	Else
		Set @PorcentajeAvance	= (@TiempoTranscurrido/@lnTiempoMaximo)*100

	Return @PorcentajeAvance

End






GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnTiemposMaximosRuta] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnTiemposMaximosRuta] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnTiemposMaximosRuta] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnTiemposMaximosRuta] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnTiemposMaximosRuta] TO [Coordinador Parametros Recobro]
    AS [dbo];

