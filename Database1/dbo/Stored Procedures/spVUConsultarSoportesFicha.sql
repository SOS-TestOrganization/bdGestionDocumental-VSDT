
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUConsultarSoportesFicha
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar Imagenes Soportes de Ficha	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P	Id, Nombre Persona, Tipo Doc. y Rango Fechas	P\>
* Fecha Creacion:		<\FC	16/02/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:		<\AM		AM\>
* Descripcion:			<\DM		DM\>
* Nuevos Parametros:	<\PM		PM\>
* Nuevas Variables:		<\VM		VM\>
* Fecha Modificacion:	<\FM		FM\>
*---------------------------------------------------------------------------------*/
--exec spVUConsultarSoportesFicha null, null, null, null, null, null
CREATE PROCEDURE [dbo].[spVUConsultarSoportesFicha] 
/*1*/	@Numero_Id			varchar(30)		= null, 
/*2*/	@Nombre_Persona		varchar(150)	= null, 
/*3*/	@Tipo_Documento		varchar(150)	= null, 
/*4*/	@Fecha_Inicio		datetime		= null, 
/*5*/	@Fecha_Fin			datetime		= null, 
/*6*/	@error				varchar(10)		output
AS
BEGIN
	SET NOCOUNT ON;
	
    --Se settea la variable @error en '0'
	Set @error = '0'
	
    Declare @tmpSoportes Table (
		cnsctvo_cdgo_imgn		int, 
		anno					varchar(150), 
		cnsctvo_agrpdr_imgn		varchar(150), 
		fcha_dgtlzcn			varchar(150), 
		cntdd_pgns				int, 
		nmro_dsco				int, 
		nmro_idntfccn			varchar(150), 
		nmbre_prsna				varchar(150), 
		espcldd					varchar(150), 
		sde						varchar(150), 
		tpo						varchar(150), 
		blsa					varchar(150), 
		rta						varchar(150), 
		nmbre_prvdr				varchar(150)
	)
	Begin Transaction
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,		anno,				cnsctvo_agrpdr_imgn, 
				fcha_dgtlzcn,			cntdd_pgns,			nmro_dsco, 
				nmro_idntfccn,			nmbre_prsna,		espcldd, 
				sde,					tpo,				blsa, 
				rta,					nmbre_prvdr 
		)
		Select	a.cnsctvo_cdgo_imgn,	a.anno,				a.cnsctvo_agrpdr_imgn, 
				a.fcha_dgtlzcn,			a.cntdd_pgns,		a.nmro_dsco, 
				a.nmro_idntfccn,		a.nmbre_prsna,		a.espcldd, 
				a.sde,					a.tpo,				a.blsa, 
				a.rta,					a.nmbre_prvdr
		From	dbo.tbImagenesSoporteFichas a 
		Where	(@Numero_Id Is Null Or a.nmro_idntfccn = @Numero_Id)
		And		(@Nombre_Persona Is Null Or a.nmbre_prsna Like '%' + @Nombre_Persona + '%') 
		And		(@Tipo_Documento Is Null Or a.tpo Like '%' + @Tipo_Documento + '%') 
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
    ON OBJECT::[dbo].[spVUConsultarSoportesFicha] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFicha] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFicha] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFicha] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFicha] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFicha] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFicha] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFicha] TO [visosservice_role]
    AS [dbo];

