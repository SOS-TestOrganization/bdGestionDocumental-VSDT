/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDIngresarNumeroRadicacion
* Desarrollado por:		<\A	Jorge Marcos Rincón Ardila	A\>
* Descripcion:			<\D	Ingresa un Documento desde el Portal	D\>
* Parametros:			<\P   	P\>
* Fecha Creacion:		<\FC	07/01/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:				<\AM		AM\>
* Descripcion Modificacion:		<\DM		DM\>
* Fecha Modificacion:			<\FM		FM\>
*---------------------------------------------------------------------------------*/
/*

declare @cnsctvo_cdgo_nmro_rdccn int ,@nmro_rdccn varchar(50) 
exec [spGDIngresarNumeroRadicacion] 1,@cnsctvo_cdgo_nmro_rdccn output, @nmro_rdccn output,0,null
select @cnsctvo_cdgo_nmro_rdccn,@nmro_rdccn

select * from tbNumeroRadicacion

*/
CREATE PROCEDURE [dbo].[spGDIngresarNumeroRadicacion] 
/* 1 */		@cnsctvo_cdgo_tpo_nmro_rdccn		Int, 
/* 2 */		@cnsctvo_cdgo_nmro_rdccn			Int			output, 
/* 3 */		@nmro_rdccn							varchar(50) output, 
/* 4 */		@cnsctvo_cdgo_dcmnto				Int, 
/* 5 */		@error								varchar(5)=null	output
AS
BEGIN
	SET NOCOUNT ON;
	
	Declare 
		@cnsctvo_nmro_rdccn				int, 
		@AnioChar						varchar(5), 
		@DiaChar						varchar(5), 
		@MesChar						varchar(5), 
		@fcha_rdccn						varchar(20), 
		@prfjo_nmro_rdccn				varchar(150),
		@hora_texto varchar(20)

		
	--Se settea la variable @error en '0'
	Set @error = '0'
	
	--Se establece la Fecha de Radicacion como varchar
	Set @AnioChar = convert(varchar(5), DatePart(Year, Getdate()))
	Set @MesChar = IsNull(bdGestionDocumental.dbo.fn_Devuelve_Abreviatura_Mes(DatePart(Month, Getdate())), '0')
	Set @DiaChar = IsNull(bdGestionDocumental.dbo.fn_Devuelve_Dia_Completo(DatePart(Day, GetDate())), '0')
	
	if (@AnioChar != '0' And @MesChar != '0' And @DiaChar != '0')
		Set @fcha_rdccn = @MesChar + ' ' + @DiaChar + ' ' + substring(@AnioChar, 3, 4)
	
    SET LANGUAGE SPANISH 
	--select convert(char(20),getdate(),103)
	set @fcha_rdccn =convert(char(20), getdate(),0)
	print @fcha_rdccn
	/*
	set @hora_texto = substring(@hora_texto,len(@hora_texto)- 7,len(@hora_texto))	
	set @fcha_rdccn= convert(char(20), getdate(),103)	
	*/
	Set @prfjo_nmro_rdccn = (Select prfjo_nmro_rdccn From dbo.tbTiposNumeroRadicacion 
							Where cnsctvo_cdgo_tpo_nmro_rdccn = @cnsctvo_cdgo_tpo_nmro_rdccn)


	
	--Se ingresa el número de radicación
	Begin Transaction
		Set @cnsctvo_cdgo_nmro_rdccn = IsNull((Select Max(cnsctvo_cdgo_nmro_rdccn) + 1 From tbNumeroRadicacion), 1)
		Set @cnsctvo_nmro_rdccn = IsNull((Select Max(cnsctvo_nmro_rdccn) + 1 From tbNumeroRadicacion), 1)
		/*
		Set @nmro_rdccn = @prfjo_nmro_rdccn + ' ' 
			+ Replicate('0', 10 - Len(Ltrim(Rtrim(Convert(Char(10), @cnsctvo_nmro_rdccn))))) 
			+ Ltrim(Rtrim(Convert(Char(10), @cnsctvo_nmro_rdccn))) + ' ' 
			+ @fcha_rdccn
		*/
	
		

		Set @nmro_rdccn = @prfjo_nmro_rdccn + ' ' 
		--+ Replicate('0', 10 - Len(Ltrim(Rtrim(Convert(Char(10), @cnsctvo_nmro_rdccn))))) 
		+ Ltrim(Rtrim(Convert(Char(10), @cnsctvo_nmro_rdccn))) + ' ' 
		+ @fcha_rdccn

		Insert Into tbNumeroRadicacion(
			cnsctvo_cdgo_nmro_rdccn,	cnsctvo_cdgo_tpo_nmro_rdccn,	cnsctvo_nmro_rdccn, 
			fcha_rdccn,					nmro_rdccn,						cnsctvo_cdgo_dcmnto
		) Values (
			@cnsctvo_cdgo_nmro_rdccn,	@cnsctvo_cdgo_tpo_nmro_rdccn,	@cnsctvo_nmro_rdccn, 
			@fcha_rdccn,				@nmro_rdccn,					@cnsctvo_cdgo_dcmnto
		)
		
		If @@Error <> 0
			Begin
				Set @error = '1'
				Rollback Transaction
				Return -1
			End
		else
			Begin
				Commit Transaction
			End
	
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [KioskoCer]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [portal_rol]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarNumeroRadicacion] TO [visosservice_role]
    AS [dbo];

