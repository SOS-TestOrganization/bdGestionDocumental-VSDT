/*---------------------------------------------------------------------------------
* Metodo o PRG:			spVUConsultarSoportesFacturaJoin
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Consultar Imagenes Soportes de Factura	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P		P\>
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
CREATE PROCEDURE [dbo].[spVUConsultarSoportesFacturaJoin] 
/*1*/	@Numero_Identificacion				varchar(50) = null, 
/*2*/	@Numero_Factura						varchar(50) = null, 
/*3*/	@Numero_Radicacion					varchar(50) = null, 
/*4*/	@Numero_Recobro						int = null, 
/*5*/	@Numero_OPS							varchar(50) = null, 
/*6*/	@Numero_OPS_Dos						varchar(50) = null, 
/*7*/	@Tipo_Documento						varchar(150) = null, 
/*8*/	@Numero_Disco						int = null, 
/*9*/	@cnsctv_cdgo_sde					int = null, 
/*10*/	@error								varchar(10) output
AS
BEGIN
	SET NOCOUNT ON;

    --Se settea la variable @error en '0'
	Set @error = '0'
	
	Declare @tmpSoportes Table (
		cnsctvo_cdgo_imgn		int, 
		cnsctvo_agrpdr_imgn		varchar(150), 
		cntdd_pgns				int, 
		nmro_dsco				int, 
		nmro_fctra				varchar(150), 
		nmro_rdccn				varchar(150), 
		cnsctvo_cdgo_sde		int, 
		dscrpcn_sde				varchar(150), 
		tpo_idntfccn			varchar(150), 
		nmro_idntfccn			varchar(150), 
		nmro_ops				varchar(150), 
		nmro_ops2				varchar(150), 
		tpo_dcmnto				varchar(150), 
		rta						varchar(150), 
		nmbre_prvdr				varchar(150), 
		cnsctvo_rcbro			int 
	)
	
	Begin Transaction
		--Sysentec
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,		cnsctvo_agrpdr_imgn,		cntdd_pgns, 
				nmro_dsco,				nmro_fctra,					nmro_rdccn, 
				cnsctvo_cdgo_sde,		tpo_idntfccn,				nmro_idntfccn, 
				nmro_ops,				nmro_ops2,					tpo_dcmnto, 
				rta,					nmbre_prvdr,				cnsctvo_rcbro 
		)
		Select	a.cnsctvo_cdgo_imgn,	a.cnsctvo_agrpdr_imgn,		a.cntdd_pgns, 
				a.nmro_dsco,			a.nmro_fctra,				a.nmro_rdccn, 
				a.cnsctvo_cdgo_sde,		a.tpo_idntfccn,				a.nmro_idntfccn, 
				a.nmro_ops,				a.nmro_ops2,				a.tpo_dcmnto, 
				a.rta,					a.nmbre_prvdr,				a.cnsctvo_rcbro 
		From	dbo.tbImagenesSoporteFactura a 
		Where	(@Numero_Identificacion Is Null Or a.nmro_idntfccn = @Numero_Identificacion)
		And		(@Numero_Factura Is Null Or a.nmro_fctra = @Numero_Factura) 
		And		(@Numero_Radicacion Is Null Or a.nmro_rdccn = @Numero_Radicacion) 
		And		(@Numero_Recobro Is Null Or a.cnsctvo_rcbro = @Numero_Recobro) 
		And		(@Numero_OPS Is Null Or a.nmro_ops = @Numero_OPS) 
		And		(@Numero_OPS_Dos Is Null Or a.nmro_ops2 = @Numero_OPS_Dos) 
		And		(@Tipo_Documento Is Null Or a.nmro_rdccn = @Tipo_Documento) 
		And		(@Numero_Disco Is Null Or a.nmro_dsco = @Numero_Disco) 
		And		((@cnsctv_cdgo_sde Is Null) Or (a.cnsctvo_cdgo_sde = @cnsctv_cdgo_sde))
		
		--Sinva
		Insert Into @tmpSoportes(
				cnsctvo_cdgo_imgn,		cnsctvo_agrpdr_imgn,		cntdd_pgns, 
				nmro_dsco,				nmro_fctra,					nmro_rdccn, 
				cnsctvo_cdgo_sde,		tpo_idntfccn,				nmro_idntfccn, 
				nmro_ops,				nmro_ops2,					tpo_dcmnto, 
				rta, 
				nmbre_prvdr,			cnsctvo_rcbro 
		)Select	
				0,						null,						null, 
				null,					a.indce3,					a.indce1, 
				null,					null,						null, 
				null,					null,						'Cuentas Medicas', 
				'\ImagenesOUT\Digitalizacion\Cuentas Medicas\' 
				+ convert(varchar(4), DatePart(Year, a.fcha_crga)) + '\' +
				+ Replicate('0', 2 - Len(Ltrim(Rtrim(convert(varchar(2), DatePart(Month, a.fcha_crga)))))) 
				+ convert(varchar(2), DatePart(Month, a.fcha_crga)) + '\' +
				+ Replicate('0', 2 - Len(Ltrim(Rtrim(convert(varchar(2), DatePart(Day, a.fcha_crga)))))) 
				+ convert(varchar(2), DatePart(Day, a.fcha_crga)) + '\' 
				+ a.nmbre_archvo, 
				'Sinva',				a.indce2 
		From	dbo.tbRegistrosArchivosIndices a 
		Where	(a.cnsctvo_cdgo_tpo_dcmnto = 2) 
		And		(@Numero_Factura Is Null Or a.indce3 = @Numero_Factura) 
		And		(@Numero_Radicacion Is Null Or a.indce1 = @Numero_Radicacion) 
		And		(@Numero_Recobro Is Null Or a.indce2 = @Numero_Recobro) 
		
		Update	@tmpSoportes
		Set		a.dscrpcn_sde = b.dscrpcn_sde
		From	@tmpSoportes a, bdAfiliacion.dbo.tbSedes b
		Where	a.cnsctvo_cdgo_sde = b.cdgo_sde
		
		Select	* 
		From	@tmpSoportes 
		Order By cnsctvo_cdgo_imgn DESC
		
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
    ON OBJECT::[dbo].[spVUConsultarSoportesFacturaJoin] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFacturaJoin] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFacturaJoin] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFacturaJoin] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFacturaJoin] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFacturaJoin] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFacturaJoin] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spVUConsultarSoportesFacturaJoin] TO [visosservice_role]
    AS [dbo];

