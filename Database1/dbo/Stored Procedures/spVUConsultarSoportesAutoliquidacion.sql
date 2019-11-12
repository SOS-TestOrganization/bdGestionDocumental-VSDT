/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUConsultarSoportesAutoliquidacion
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar Soportes de Autoliquidacion por el Visor Unificado	D\>
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
--exec spVUConsultarSoportesAutoliquidacion null, null, null, null, null, null, null, '2009/01/22', '2009/01/24', null 
CREATE PROCEDURE [dbo].[spVUConsultarSoportesAutoliquidacion] 
/*1*/	@Numero_Id					varchar(30)		= null, 
/*2*/	@Nombre						varchar(150)	= null, 
/*3*/	@Numero_Planilla			int				= null, 
/*4*/	@Anno						varchar(10)		= null, 
/*5*/	@Tipo						varchar(150)	= null, 
/*6*/	@Disco						varchar(150)	= null, 
/*7*/	@Bolsa						varchar(50)		= null, 
/*8*/	@Fecha_Inicio				datetime		= null, 
/*9*/	@Fecha_Fin					datetime		= null, 
/*10*/	@Error						varchar(10)		output
AS
BEGIN
	SET NOCOUNT ON;
	
    --Se setea la variable de error
	Set @Error = '0'
	
	Declare @tmpSoportes Table (
		cnsctvo_cdgo_imgn		int, 
		anno					varchar(150), 
		cnsctvo_agrpdr_imgn		varchar(150), 
		fcha_dgtlzcn			varchar(150), 
		cntdd_pgns				int, 
		nmro_dsco				int, 
		plnlla					varchar(150), 
		nit						varchar(150), 
		nmbre					varchar(150), 
		nmro_blsa				varchar(50),
		tpo						varchar(150), 
		nmro					varchar(150), 
		rta						varchar(150), 
		nmbre_prvdr				varchar(150)
	)
	Begin Transaction
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,			anno,				cnsctvo_agrpdr_imgn, 
				fcha_dgtlzcn,				cntdd_pgns,			nmro_dsco, 
				plnlla,						nit,				nmbre, 
				nmro_blsa,					tpo,				nmro, 
				rta,						nmbre_prvdr
		)Select	a.cnsctvo_cdgo_imgn,		a.anno,				a.cnsctvo_agrpdr_imgn, 
				a.fcha_dgtlzcn,				a.cntdd_pgns,		a.nmro_dsco, 
				a.plnlla,					a.nit,				a.nmbre, 
				a.nmro_blsa,				a.tpo,				a.nmro, 
				a.rta,						a.nmbre_prvdr
		From	dbo.tbImagenesSoporteAutoliquidacion a 
		Where	(@Numero_Id Is Null Or a.nit = @Numero_Id) 
		And		(@Nombre Is Null Or a.nmbre Like '%' + @Nombre + '%') 
		And		(@Numero_Planilla Is Null Or a.plnlla = @Numero_Planilla) 
		And		(@Anno Is Null Or a.anno = @Anno) 
		And		(@Tipo Is Null Or a.tpo = @Tipo) 
		And		(@Disco Is Null Or a.nmro_dsco = @Disco) 
		And		(@Bolsa Is Null Or a.nmro_blsa = @Bolsa) 
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
    ON OBJECT::[dbo].[spVUConsultarSoportesAutoliquidacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAutoliquidacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAutoliquidacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAutoliquidacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAutoliquidacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAutoliquidacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAutoliquidacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAutoliquidacion] TO [visosservice_role]
    AS [dbo];

