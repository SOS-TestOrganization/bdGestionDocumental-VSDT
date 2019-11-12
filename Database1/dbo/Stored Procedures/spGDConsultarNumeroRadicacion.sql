/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDConsultarNumeroRadicacion
* Desarrollado por:		<\A	Jorge Marcos Rincón Ardila	A\>
* Descripcion:			<\D	Devuelve un numero de radicacion	D\>
* Parametros:			<\P	Consecutivo numero de radicacion	P\>
* Fecha Creacion:		<\FC	07/01/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:				<\AM	Andres Felipe Cuero	AM\>
* Descripcion Modificacion:		<\DM	Se modifica numero de radicado.  se quitan los ceros y se concatena la fecha y hora\>
* Fecha Modificacion:			<\FM		FM\>
*---------------------------------------------------------------------------------*/

/*
Declare @nmro_rdccn						Varchar(50)
exec spGDConsultarNumeroRadicacion 1, @nmro_rdccn Output
Select @nmro_rdccn
*/

CREATE PROCEDURE [dbo].[spGDConsultarNumeroRadicacion] 
/* 1 */		@cnsctvo_cdgo_tpo_nmro_rdccn	Int, 
/* 2 */		@nmro_rdccn						Varchar(50) Output
AS
BEGIN
	SET NOCOUNT ON;
	
	
	Declare	@cnsctvo_nmro_rdccn				Int, 
			@AnioChar						varchar(5), 
			@DiaChar						varchar(5), 
			@MesChar						varchar(5), 
			@fcha_rdccn						varchar(15), 
			@prfjo_nmro_rdccn				varchar(150)
	

  Set @prfjo_nmro_rdccn = (Select prfjo_nmro_rdccn From dbo.tbTiposNumeroRadicacion 
							Where cnsctvo_cdgo_tpo_nmro_rdccn = @cnsctvo_cdgo_tpo_nmro_rdccn)

	
	Set @cnsctvo_nmro_rdccn = IsNull((Select Max(cnsctvo_nmro_rdccn) + 1 From tbNumeroRadicacion), 1)
	
   SET LANGUAGE SPANISH

	Set @nmro_rdccn = @prfjo_nmro_rdccn + ' ' +(Rtrim(Convert(Char(10), @cnsctvo_nmro_rdccn))) + ' ' 
			+ (convert(char(20), getdate(),0))

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [ServicioClientePortal]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [Kiosko]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [KioskoCer]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [portal_rol]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarNumeroRadicacion] TO [visosservice_role]
    AS [dbo];

