CREATE Function [fnGDRecuperarNombreImagen]	(@rta_imgn		Varchar(250))
Returns Varchar(30)

As

Begin
	Declare		@slr			Int,
				@asnto_prcsdo	Varchar(250)

	Set			@slr	=	1
	Set			@asnto_prcsdo	=	@rta_imgn

	While	@slr	!=	0
		Begin
			Set		@asnto_prcsdo	=	Substring(@asnto_prcsdo,Charindex('\',@asnto_prcsdo)+1, Len(@asnto_prcsdo))
			Select	@slr			=	Charindex('\',@asnto_prcsdo)
		End

		Return			@asnto_prcsdo
End
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGDRecuperarNombreImagen] TO [Administrador Gestion Documental]
    AS [dbo];

