
/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDConsultarIndicesDocumentoEspecifico
* Desarrollado por:		<\A   Ing. Jorge Marcos Rincón Árdila		A\>
* Descripcion:			<\D		D\>
* Parametros:			<\P		P\>
* Variables:			<\V		V\>
* Fecha Creacion:		<\FC 05/05/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:		<\AM   AM\>
* Descripcion:			<\DM   DM\>
* Nuevos Parametros:	<\PM   PM\>
* Nuevas Variables:		<\VM   VM\>
* Fecha Modificacion:	<\FM   FM\>
*---------------------------------------------------------------------------------*/
-- exec spGDConsultarIndicesDocumentoEspecifico 1, '2009/04/01', '2009/04/30', null 
-- exec spGDConsultarIndicesDocumentoEspecifico 2, '2009/04/01', '2009/04/30', null
-- exec spGDConsultarIndicesDocumentoEspecifico 9, '2009/04/01', '2009/04/30', null
CREATE PROCEDURE [dbo].[spGDConsultarIndicesDocumentoEspecifico] 
/*1*/	@ConsecutivoTipoDocumento		Int, 
/*2*/	@FechaDesde						Datetime, 
/*3*/	@FechaHasta						Datetime, 
/*4*/	@Error							Varchar(10) output 
AS
BEGIN
	SET NOCOUNT ON;
	
	Set @Error = '0'
	Begin Try
		
		/*
		Declare @ConsecutivoTipoDocumento		Int, 
				@FechaDesde						Datetime, 
				@FechaHasta						Datetime, 
				@Error							Varchar(10)
		Set @ConsecutivoTipoDocumento = 1
		Set @FechaDesde = '2009/10/01'
		Set @FechaHasta = '2009/10/02'
		*/
		
		Set @Error = '0'
		
		Create Table	#tmpDocumentosDigitalizados(
			cnsctvo_cdgo_dcmnto			Int, 
			nmro_ntfccn					Varchar(30), 
			nmro_acta					Varchar(30), 
			cnsctvo_cdgo_sde			Int, 
			cnsctvo_cdgo_ofcna			Int, 
			dscrpcn_sde					Varchar(150), 
			cdgo_tpo_idntfccn			Varchar(10), 
			cnsctvo_cdgo_tpo_idntfccn	Varchar(10), 
			nmro_idntfccn				Varchar(30), 
			nmro_rcbro					Varchar(30),
			nmro_imgns					int,
			fcha_dgtlzcn				datetime
		)
		
		Insert Into	#tmpDocumentosDigitalizados
		Select		a. cnsctvo_cdgo_dcmnto,				space(30) as nmro_ntfccn, 
					space(30) as nmro_acta,				space(30) as cnsctvo_cdgo_sde, 
					space(30) as cnsctvo_cdgo_ofcna,	space(150) as dscrpcn_sde, 
					space(10) as cdgo_tpo_idntfccn,		space(10) as cnsctvo_cdgo_tpo_idntfccn,	
					space(30) as nmro_idntfccn,			space(30) as nmro_rcbro, 
					a.nmro_imgns,						a.fcha_dgtlzcn 
		From		dbo.tbDocumentosDigitalizados a
		Where		fcha_dgtlzcn Between @FechaDesde And @FechaHasta 
		And			(a.cnsctvo_cdgo_tpo_dcmntl = @ConsecutivoTipoDocumento) 
		And			(a.estdo_rgstro = 'S')
		
		--CTC
		if @ConsecutivoTipoDocumento In (1) 
			Begin
				Update	#tmpDocumentosDigitalizados
				Set	nmro_ntfccn =(Select ltrim(rtrim(vlr))
								From tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 5 --Número de Notificación
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
				From	#tmpDocumentosDigitalizados a 
				
				Update	#tmpDocumentosDigitalizados
				Set	nmro_acta =(Select ltrim(rtrim(vlr))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 8 --Número de Acta
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
				From	#tmpDocumentosDigitalizados a 
				
				Update	#tmpDocumentosDigitalizados
				Set	cnsctvo_cdgo_sde =(Select ltrim(rtrim(vlr))
								From tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 19 --Consecutivo Codigo Sede
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
				From	#tmpDocumentosDigitalizados a 
			End
		
		--Tutelas y ATEP
		If @ConsecutivoTipoDocumento In (3, 9) 
			Begin 
				Update	#tmpDocumentosDigitalizados
				Set	nmro_idntfccn =(Select ltrim(rtrim(vlr))
								From tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 1 --Número Identificación
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
				From	#tmpDocumentosDigitalizados a 
				
				Update	#tmpDocumentosDigitalizados
				Set	nmro_ntfccn =(Select ltrim(rtrim(vlr))
								From tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 5 --Número de Notificación
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
				From	#tmpDocumentosDigitalizados a 
				
				Update	#tmpDocumentosDigitalizados 
				Set	dscrpcn_sde =(Select ltrim(rtrim(vlr))
								From tbIndicesxDocumentosDigitalizados b 
								Where	b.cnsctvo_cdgo_tpo_indce	= 6 --Sede
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto) 
				From	#tmpDocumentosDigitalizados a 
				
				Update	#tmpDocumentosDigitalizados
				Set	cdgo_tpo_idntfccn =(Select ltrim(rtrim(vlr))
								From tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 7 --Tipo Identificación
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
				From	#tmpDocumentosDigitalizados a 
				
				Update	#tmpDocumentosDigitalizados
				Set	cnsctvo_cdgo_tpo_idntfccn = b.cnsctvo_cdgo_tpo_idntfccn
				From	#tmpDocumentosDigitalizados a 
					Inner Join bdAfiliacionValidador.dbo.tbTiposIdentificacion b On (b.cdgo_tpo_idntfccn = a.cdgo_tpo_idntfccn)
				
				Update	#tmpDocumentosDigitalizados
				Set	cnsctvo_cdgo_ofcna =(Select ltrim(rtrim(vlr))
								From tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 21 --Consecutivo Codigo Oficina
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto) 
				From	#tmpDocumentosDigitalizados a 
				
				Update	#tmpDocumentosDigitalizados
				Set	cnsctvo_cdgo_sde = b.cnsctvo_cdgo_sde 
				From	#tmpDocumentosDigitalizados a 
					Inner Join bdAfiliacionValidador.dbo.tbSedes b On (b.dscrpcn_sde = a.dscrpcn_sde) 
				
			End
		
		--Factura
		If @ConsecutivoTipoDocumento In (2) 
			Begin
				Update	#tmpDocumentosDigitalizados
				Set	nmro_rcbro =(Select ltrim(rtrim(vlr))
								From tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce	= 9 --Número Recobro
								And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
				From	#tmpDocumentosDigitalizados a 
			End
				
		Select * from #tmpDocumentosDigitalizados 
		Order by cnsctvo_cdgo_dcmnto 

		Drop
		Table		#tmpDocumentosDigitalizados
		
	End Try 
	Begin Catch 
		Set @Error = '1' 
	End Catch 
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesDocumentoEspecifico] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesDocumentoEspecifico] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesDocumentoEspecifico] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesDocumentoEspecifico] TO [visosservice_role]
    AS [dbo];

