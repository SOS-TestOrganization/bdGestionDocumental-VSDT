
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUConsultarSoportesAfiliacion
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar Soportes de Afiliacion por el Visor Unificado	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P	Id, No. Formulario, No. Contrato y Rango Fechas	P\>
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
--exec spVUConsultarSoportesAfiliacion null, null, null, null, null, null, null, null, '2009/01/22', '2009/01/24', null 
CREATE PROCEDURE [dbo].[spVUConsultarSoportesAfiliacion] 
/*1*/	@Numero_Id					varchar(30) = null, 
/*2*/	@Nombre_Persona				varchar(150) = null, 
/*3*/	@Tipo_Documento				varchar(150) = null, 
/*4*/	@Numero_Formulario			int = null, 
/*5*/	@Nombre_Contrato			varchar(150) = null, 
/*6*/	@Anno						varchar(10) = null, 
/*7*/	@Disco						int = null, 
/*8*/	@Bolsa						int = null, 
/*9*/	@Fecha_Inicio				datetime = null, 
/*10*/	@Fecha_Fin					datetime = null, 
/*11*/	@error						varchar(10) output 
AS
BEGIN
	SET NOCOUNT ON;
	
	--Se setea la variable de error
	Set @error = '0'
	
	Declare @tmpSoportes Table (
		cnsctvo_cdgo_imgn		int, 
		anno					varchar(150), 
		cnsctvo_agrpdr_imgn		varchar(150), 
		fcha_dgtlzcn			varchar(50), 
		cntdd_pgns				int, 
		nmro_dsco				int, 
		nmro_frmlro				int, 
		nmro_idntfccn			varchar(150), 
		nmbre_prsna				varchar(150), 
		nmro_cntrto				varchar(150), 
		nmro_blsa				int,
		tpo_aflcn				varchar(150), 
		nmbre_cntrto			varchar(150), 
		sde						varchar(150), 
		tpo_dcmnto				varchar(150), 
		fcha_rdccn				varchar(150), 
		nmro					varchar(150), 
		rta						varchar(150), 
		nmbre_prvdr				varchar(150), 
		fecha_digitalizacion	datetime, 
		fecha_radicacion		datetime
	)
	Begin Transaction
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,		anno,						cnsctvo_agrpdr_imgn, 
				fcha_dgtlzcn,			cntdd_pgns,					nmro_dsco, 
				nmro_frmlro,			nmro_idntfccn,				nmbre_prsna, 
				nmro_cntrto,			nmro_blsa,					tpo_aflcn, 
				nmbre_cntrto,			sde,						tpo_dcmnto, 
				fcha_rdccn,				nmro,						rta, 
				nmbre_prvdr,			fecha_digitalizacion,		fecha_radicacion
		)
		Select	a.cnsctvo_cdgo_imgn,	a.anno,						a.cnsctvo_agrpdr_imgn, 
				a.fcha_dgtlzcn,			a.cntdd_pgns,				a.nmro_dsco, 
				a.nmro_frmlro,			a.nmro_idntfccn,			a.nmbre_prsna, 
				a.nmro_cntrto,			a.nmro_blsa,				a.tpo_aflcn, 
				a.nmbre_cntrto,			a.sde,						a.tpo_dcmnto, 
				a.fcha_rdccn,			a.nmro,						a.rta, 
				a.nmbre_prvdr,			a.fecha_digitalizacion,		a.fecha_radicacion 
		From	dbo.tbImagenesSoporteAfiliacion a 
		Where	(@Numero_Id Is Null Or a.nmro_idntfccn = @Numero_Id) 
		And		(@Nombre_Persona Is Null Or a.nmbre_prsna Like '%' + @Nombre_Persona + '%') 
		And		(@Tipo_Documento Is Null Or a.tpo_dcmnto = @Tipo_Documento) 
		And		(@Numero_Formulario Is Null Or a.nmro_frmlro = @Numero_Formulario) 
		And		(@Nombre_Contrato Is Null Or a.nmbre_cntrto = @Nombre_Contrato) 
		And		(@Anno Is Null Or a.anno = @Anno) 
		And		(@Disco Is Null Or a.nmro_dsco = @Disco) 
		And		(@Bolsa Is Null Or a.nmro_blsa = @Bolsa) 
		And		((@Fecha_Inicio Is Null And @Fecha_Fin Is Null) 
				Or (a.fecha_radicacion Between @Fecha_Inicio And @Fecha_Fin))
		
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
    ON OBJECT::[dbo].[spVUConsultarSoportesAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAfiliacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAfiliacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAfiliacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAfiliacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAfiliacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesAfiliacion] TO [visosservice_role]
    AS [dbo];

