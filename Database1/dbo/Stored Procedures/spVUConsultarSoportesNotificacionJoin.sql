/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUConsultarSoportesNotificacion
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar Imagenes Soportes de Notificacion	D\>
* Descripcion:			<\D		D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P	Numero Id, Numero Acta, Fecha Digitalizacion	P\>
* Fecha Creacion:		<\FC	16/03/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:		<\AM		AM\>
* Descripcion:			<\DM		DM\>
* Nuevos Parametros:	<\PM		PM\>
* Nuevas Variables:		<\VM		VM\>
* Fecha Modificacion:	<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spVUConsultarSoportesNotificacionJoin] 
/*1*/	@Numero_Identificacion				varchar(30) = null, 
/*2*/	@Numero_Acta						varchar(20) = null, 
/*3*/	@Numero_Notificacion				varchar(50) = null, 
/*4*/	@Nombre_Persona						varchar(150) = null, 
/*5*/	@Razon_Social						varchar(150) = null, 
/*6*/	@Ciudad								varchar(150) = null, 
/*7*/	@Tipo_Documento						varchar(150) = null, 
/*8*/	@Numero_Disco						int = null, 
/*9*/	@Bolsa								varchar(50) = null, 
/*10*/	@Numero								varchar(50) = null, 
/*11*/	@Arp								varchar(50) = null, 
/*12*/	@Fecha_Inicio						datetime = null, 
/*13*/	@Fecha_Fin							datetime = null, 
/*14*/	@error								varchar(10) output
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
		rta						varchar(300), 
		nmbre_prvdr				varchar(150), 
		nmro_ntfccn				varchar(50)
	)
	Begin Transaction
		--Sysentec
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,			cnsctvo_agrpdr_imgn,		fcha_dgtlzcn, 
				cntdd_pgns,					nmro_dsco,					nmro_idntfccn, 
				nmro_acta,					nmbre_prsna,				rzn_scl, 
				cdd,						arp,						fcha, 
				blsa,						nmro,						tpo_dcmnto,  
				rta,						nmbre_prvdr,				nmro_ntfccn 
		)
		Select	a.cnsctvo_cdgo_imgn,		a.cnsctvo_agrpdr_imgn,		a.fcha_dgtlzcn, 
				a.cntdd_pgns,				a.nmro_dsco,				a.nmro_idntfccn, 
				a.nmro_acta,				a.nmbre_prsna,				a.rzn_scl, 
				a.cdd,						a.arp,						a.fcha, 
				a.blsa,						a.nmro,						a.tpo_dcmnto, 
				a.rta,						a.nmbre_prvdr,				null 
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
		
		--Tutela
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,			cnsctvo_agrpdr_imgn,		fcha_dgtlzcn, 
				cntdd_pgns,					nmro_dsco,					nmro_idntfccn, 
				nmro_acta,					nmbre_prsna,				rzn_scl, 
				cdd,						arp,						fcha, 
				blsa,						nmro,						tpo_dcmnto,  
				rta, 
				nmbre_prvdr,				nmro_ntfccn
		)Select	
				0,							null,						a.fcha_dgtlzcn, 
				null,						null,						a.indce2, 
				null,						null,						null, 
				null,						null,						null, 
				a.nmro_blsa,				null,						'Tutela', 
				'\ImagenesOUT\Digitalizacion\Tutelas\' 
				+ convert(varchar(4), DatePart(Year, a.fcha_crga)) + '\' +
				+ Replicate('0', 2 - Len(Ltrim(Rtrim(convert(varchar(2), DatePart(Month, a.fcha_crga)))))) 
				+ convert(varchar(2), DatePart(Month, a.fcha_crga)) + '\' +
				+ Replicate('0', 2 - Len(Ltrim(Rtrim(convert(varchar(2), DatePart(Day, a.fcha_crga)))))) 
				+ convert(varchar(2), DatePart(Day, a.fcha_crga)) + '\' 
				+ a.nmbre_archvo, 
				'Sinva',					a.indce3 
		From	dbo.tbRegistrosArchivosIndices a 
		Where	(a.cnsctvo_cdgo_tpo_dcmnto = 3) 
		And		(@Numero_Identificacion Is Null Or a.indce2 = @Numero_Identificacion) 
		And		(@Numero_Notificacion Is Null Or a.indce3 = @Numero_Notificacion) 
		And		(@Bolsa Is Null Or a.nmro_blsa = @Bolsa) 
		
		--ATEP
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,			cnsctvo_agrpdr_imgn,		fcha_dgtlzcn, 
				cntdd_pgns,					nmro_dsco,					nmro_idntfccn, 
				nmro_acta,					nmbre_prsna,				rzn_scl, 
				cdd,						arp,						fcha, 
				blsa,						nmro,						tpo_dcmnto,  
				rta, 
				nmbre_prvdr,				nmro_ntfccn 
		)Select	
				0,							null,						a.fcha_dgtlzcn, 
				null,						null,						a.indce2, 
				null,						null,						null, 
				null,						null,						null, 
				a.nmro_blsa,				null,						'ATEP', 
				'\ImagenesOUT\Digitalizacion\Atep\' 
				+ convert(varchar(4), DatePart(Year, a.fcha_crga)) + '\' +
				+ Replicate('0', 2 - Len(Ltrim(Rtrim(convert(varchar(2), DatePart(Month, a.fcha_crga)))))) 
				+ convert(varchar(2), DatePart(Month, a.fcha_crga)) + '\' +
				+ Replicate('0', 2 - Len(Ltrim(Rtrim(convert(varchar(2), DatePart(Day, a.fcha_crga)))))) 
				+ convert(varchar(2), DatePart(Day, a.fcha_crga)) + '\' 
				+ a.nmbre_archvo, 
				'Sinva',					a.indce3 
		From	dbo.tbRegistrosArchivosIndices a 
		Where	(a.cnsctvo_cdgo_tpo_dcmnto = 9)	
		And		(@Numero_Identificacion Is Null Or a.indce2 = @Numero_Identificacion) 
		And		(@Numero_Notificacion Is Null Or a.indce3 = @Numero_Notificacion) 
		And		(@Bolsa Is Null Or a.nmro_blsa = @Bolsa) 
		
		--CTC
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,			cnsctvo_agrpdr_imgn,		fcha_dgtlzcn, 
				cntdd_pgns,					nmro_dsco,					nmro_idntfccn, 
				nmro_acta,					nmbre_prsna,				rzn_scl, 
				cdd,						arp,						fcha, 
				blsa,						nmro,						tpo_dcmnto,  
				rta, 
				nmbre_prvdr,				nmro_ntfccn 
		)Select	
				0,							null,						a.fcha_dgtlzcn, 
				null,						null,						null, 
				convert(int, a.indce2),		null,						null, 
				null,						null,						null, 
				a.nmro_blsa,				null,						'CTC', 
				'\ImagenesOUT\Digitalizacion\CTC\' 
				+ convert(varchar(4), DatePart(Year, a.fcha_crga)) + '\' +
				+ Replicate('0', 2 - Len(Ltrim(Rtrim(convert(varchar(2), DatePart(Month, a.fcha_crga)))))) 
				+ convert(varchar(2), DatePart(Month, a.fcha_crga)) + '\' +
				+ Replicate('0', 2 - Len(Ltrim(Rtrim(convert(varchar(2), DatePart(Day, a.fcha_crga)))))) 
				+ convert(varchar(2), DatePart(Day, a.fcha_crga)) + '\' 
				+ a.nmbre_archvo, 
				'Sinva',					a.indce1 
		From	dbo.tbRegistrosArchivosIndices a 
		Where	(a.cnsctvo_cdgo_tpo_dcmnto = 1)	
		And		(@Numero_Notificacion Is Null Or a.indce1 = @Numero_Notificacion) 
		And		(@Numero_Acta Is Null Or a.indce2 = @Numero_Acta) 
		And		(@Bolsa Is Null Or a.nmro_blsa = @Bolsa) 
		
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
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacionJoin] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacionJoin] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacionJoin] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacionJoin] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacionJoin] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacionJoin] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacionJoin] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesNotificacionJoin] TO [visosservice_role]
    AS [dbo];

