/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUConsultarSoportesNotificacion
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar Imagenes Soportes de Notificacion	D\>
* Descripcion:			<\D		D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P	Numero Id, Numero Acta, Fecha Digitalizacion	P\>
* Fecha Creacion:		<\FC	10/02/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:		<\AM		AM\>
* Descripcion:			<\DM		DM\>
* Nuevos Parametros:	<\PM		PM\>
* Nuevas Variables:		<\VM		VM\>
* Fecha Modificacion:	<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spVUConsultarSoportesNotificacion] 
/*1*/	@Numero_Identificacion				varchar(30) = null, 
/*2*/	@Numero_Acta						varchar(20) = null, 
/*3*/	@Nombre_Persona						varchar(150) = null, 
/*4*/	@Razon_Social						varchar(150) = null, 
/*5*/	@Ciudad								varchar(150) = null, 
/*6*/	@Tipo_Documento						varchar(150) = null, 
/*7*/	@Numero_Disco						int = null, 
/*8*/	@Bolsa								varchar(50) = null, 
/*9*/	@Numero								varchar(50) = null, 
/*10*/	@Arp								varchar(50) = null, 
/*11*/	@Fecha_Inicio						datetime = null, 
/*12*/	@Fecha_Fin							datetime = null, 
/*13*/	@error								varchar(10) output
AS
BEGIN
	SET NOCOUNT ON;
	
	--Se settea la variable @error en '0'
	Set @error = '0'
	
    Declare @tmpSoportes Table (
		cnsctvo_cdgo_imgn		int, 
		cnsctvo_agrpdr_imgn		varchar(150), 
		fcha_dgtlzcn			datetime, 
		cntdd_pgns				int, 
		nmro_dsco				int, 
		nmro_idntfccn			varchar(150), 
		nmro_acta				int,
		nmbre_prsna				varchar(150), 
		rzn_scl					varchar(150), 
		cdd						varchar(150), 
		arp						varchar(150), 
		fcha					varchar(150), 
		blsa					varchar(150), 
		nmro					varchar(150), 
		tpo_dcmnto				varchar(150), 
		rta						varchar(150), 
		nmbre_prvdr				varchar(150) 
	)
	Begin Transaction
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,			cnsctvo_agrpdr_imgn,		fcha_dgtlzcn, 
				cntdd_pgns,					nmro_dsco,					nmro_idntfccn, 
				nmro_acta,					nmbre_prsna,				rzn_scl, 
				cdd,						arp,						fcha, 
				blsa,						nmro,						tpo_dcmnto,  
				rta,						nmbre_prvdr 
		)
		Select	a.cnsctvo_cdgo_imgn,		a.cnsctvo_agrpdr_imgn,		a.fcha_dgtlzcn, 
				a.cntdd_pgns,				a.nmro_dsco,				a.nmro_idntfccn, 
				a.nmro_acta,				a.nmbre_prsna,				a.rzn_scl, 
				a.cdd,						a.arp,						a.fcha, 
				a.blsa,						a.nmro,						a.tpo_dcmnto, 
				a.rta,						a.nmbre_prvdr 
		From	dbo.tbImagenesSoporteNotificacion a 
		Where	(@Numero_Identificacion Is Null Or a.nmro_idntfccn = @Numero_Identificacion)
		And		(@Numero_Acta Is Null Or a.nmro_acta = @Numero_Acta) 
		And		(@Nombre_Persona Is Null Or a.nmbre_prsna Like '%' + @Nombre_Persona + '%') 
		And		(@Razon_Social Is Null Or a.rzn_scl Like '%' + @Razon_Social + '%') 
		And		(@Ciudad Is Null Or a.cdd = @Ciudad) 
		And		(@Tipo_Documento Is Null Or a.tpo_dcmnto = @Tipo_Documento) 
		And		(@Numero_Disco Is Null Or a.nmro_dsco = @Numero_Disco) 
		And		(@Bolsa Is Null Or a.blsa = @Bolsa) 
		And		(@Numero Is Null Or a.nmro = @Numero) 
		And		(@Arp Is Null Or a.arp = @Arp) 
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
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacion] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacion] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacion] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacion] TO [visosservice_role]
    AS [dbo];

