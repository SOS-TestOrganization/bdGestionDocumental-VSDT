/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultarIndicesDocumentoxTipoDocumento
* Desarrollado por		 :  <\A   Ing. Jorge Marcos Rincón Árdila		A\>
* Descripcion			 :  <\D		D\>
* Parametros			 :  <\P		P\>
* Variables				 :  <\V		V\>
* Fecha Creacion		 :  <\FC 05/05/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/
-- exec spGDConsultarIndicesDocumentoxTipoDocumento 1, '2009/04/01', '2009/04/30', null
CREATE PROCEDURE [dbo].[spGDConsultarIndicesDocumentoxTipoDocumento]  
/*1*/	@ConsecutivoTipoDocumento		Int, 
/*2*/	@FechaDesde						Datetime, 
/*3*/	@FechaHasta						Datetime, 
/*4*/	@Error							Varchar(10) output 
AS
BEGIN
	SET NOCOUNT ON;
	
	Set @Error = '0'
	Begin Try
		Declare @tmpTiposIndicesDocumentoxTiposDocumentos Table(
			cnsctvo_cdgo_tpo_indce_pr_tpo_dcmnto	Int, 
			cnsctvo_cdgo_tpo_dcmnto					Int, 
			cnsctvo_cdgo_tpo_indce					Int, 
			agrpdr									Char(1), 
			nmbre									Varchar(150),	
			pscn									Int, 
			ordn_indce								Int, 
			agrpdr_cnslta							Int
		)
		
		Declare @tmpDocumentosDigitalizados Table(
			cnsctvo_cdgo_dcmnto			Int, 
			cnsctvo_cdgo_tpo_dcmntl		Int, 
			nmro_imgns					Int, 
			cnsctvo_cdgo_dgtlzdr		Int, 
			fcha_dgtlzcn				Datetime, 
			cnsctvo_prcso_crga			Int
		)
		
		Declare @tmpIndicesxDocumentosDigitalizados Table(
			cnsctvo_indce_dcmnto		Int, 
			cnsctvo_cdgo_dcmnto			Int, 
			cnsctvo_cdgo_tpo_dcmntl		Int, 
			cnsctvo_cdgo_tpo_indce		Int, 
			nmbre_indce					Varchar(150), 
			vlr							Varchar(255)
		)
		
		Insert Into @tmpTiposIndicesDocumentoxTiposDocumentos
		Select Distinct	a.* 
		From	dbo.tbTiposIndicesxTiposDocumentos a
		Where	a.agrpdr_cnslta = 1 
		And		a.cnsctvo_cdgo_tpo_dcmnto  = @ConsecutivoTipoDocumento
		Order By a.cnsctvo_cdgo_tpo_dcmnto, a.ordn_indce 
		
		Insert Into @tmpDocumentosDigitalizados 
		Select a.*
		From dbo.tbDocumentosDigitalizados a 
		Where	a.cnsctvo_cdgo_tpo_dcmntl = @ConsecutivoTipoDocumento 
		And		a.fcha_dgtlzcn Between @FechaDesde And @FechaHasta 
		
		Insert Into @tmpIndicesxDocumentosDigitalizados(
					cnsctvo_indce_dcmnto,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl, 
					cnsctvo_cdgo_tpo_indce,		nmbre_indce,			vlr
		)Select		a.cnsctvo_indce_dcmnto,		a.cnsctvo_cdgo_dcmnto,	a.cnsctvo_cdgo_tpo_dcmntl, 
					a.cnsctvo_cdgo_tpo_indce,	c.nmbre,				a.vlr 
		From	dbo.tbIndicesxDocumentosDigitalizados a 
			Inner Join @tmpDocumentosDigitalizados b 
				On (b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto)
			Inner Join @tmpTiposIndicesDocumentoxTiposDocumentos c 
				On (c.cnsctvo_cdgo_tpo_indce = a.cnsctvo_cdgo_tpo_indce) 
		
		Select * from @tmpIndicesxDocumentosDigitalizados 
		Order by cnsctvo_cdgo_dcmnto
		
	End Try 
	Begin Catch 
		Set @Error = '1'
	End Catch 
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesDocumentoxTipoDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesDocumentoxTipoDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarIndicesDocumentoxTipoDocumento] TO [visosservice_role]
    AS [dbo];

