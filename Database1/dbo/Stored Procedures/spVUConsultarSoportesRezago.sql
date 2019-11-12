
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUConsultarSoportesRezago
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar Soportes de Afiliacion por el Visor Unificado	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P	Id, No. Planilla y Rango Fechas	P\>
* Fecha Creacion:		<\FC	16/02/2008	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:		<\AM		AM\>
* Descripcion:			<\DM		DM\>
* Nuevos Parametros:	<\PM		PM\>
* Nuevas Variables:		<\VM		VM\>
* Fecha Modificacion:	<\FM		FM\>
*---------------------------------------------------------------------------------*/
--exec spVUConsultarSoportesRezago null, null, null, null, '2009/01/22', '2009/01/24', null 
CREATE PROCEDURE [dbo].[spVUConsultarSoportesRezago] 
/**/	@Numero_Id					varchar(30)		= null, 
/**/	@Numero_Planilla			int				= null, 
/**/	@Fecha_Inicio				datetime		= null, 
/**/	@Fecha_Fin					datetime		= null, 
/**/	@Error						varchar(10)		output
AS
BEGIN
	SET NOCOUNT ON;
	
    --Se setea la variable de error
	Set @Error = '0'
	
	Declare @tmpSoportes Table (
		cnsctvo_cdgo_imgn		int, 
		anno					varchar(150), 
		cnsctvo_agrpdr_imgn		varchar(150), 
		fcha_dgtlzcn			datetime, 
		cntdd_pgns				int, 
		nmro_dsco				int, 
		plnlla					varchar(150), 
		nit						varchar(150), 
		nmbre					varchar(150), 
		nmro_blsa				varchar(50),
		tpo						varchar(150), 
		nmro					varchar(150), 
		rta						varchar(150)
	)
	Begin Transaction
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,			anno,				cnsctvo_agrpdr_imgn, 
				fcha_dgtlzcn,				cntdd_pgns,			nmro_dsco, 
				plnlla,						nit,				nmbre, 
				nmro_blsa,					tpo,				nmro, 
				rta
		)Select	a.cnsctvo_cdgo_imgn,		a.anno,				a.cnsctvo_agrpdr_imgn, 
				a.fcha_dgtlzcn,				a.cntdd_pgns,		a.nmro_dsco, 
				a.plnlla,					a.nit,				a.nmbre, 
				a.nmro_blsa,				a.tpo,				a.nmro, 
				a.rta
		From	dbo.tbImagenesSoporteRezago a 
		Where	(@Numero_Id Is Null Or a.nit = @Numero_Id)
		And		(@Numero_Planilla Is Null Or a.plnlla = @Numero_Planilla) 
		And		((@Fecha_Inicio Is Null And @Fecha_Fin Is Null) 
				Or (a.fcha_dgtlzcn Between @Fecha_Inicio And @Fecha_Fin))
	
		Select	* 
		From	@tmpSoportes 
		Order By fcha_dgtlzcn DESC
		
		If @@Error <> 0
			Begin
				Set @error = '1'
				Rollback Transaction
				Return -1
			End
		Else
			Begin
				Commit Transaction
			End
	
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesRezago] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesRezago] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesRezago] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesRezago] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesRezago] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesRezago] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesRezago] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesRezago] TO [visosservice_role]
    AS [dbo];

