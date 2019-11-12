
/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentos
* Desarrollado por		 :  <\A   Ing. Samuel Muñoz		A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC 20090318     			FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM  Andres Taborda AM\>
* Descripcion			 : <\DM  Se retira condicion para que  incluya en la busqueda archivos PDF para el proyecto de CTC y calculo de raiz ruta imagen  DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  20151001 FM\>
*---------------------------------------------------------------------------------*/
--exec spGDConsultaDetalleDocumentos 14573255, null
--exec spGDConsultaDetalleDocumentos 61678835, null
CREATE Procedure [dbo].[spGDConsultaDetalleDocumentos]
/*1*/	@lnConsecutivoDocumento			Int,
/*2*/	@lcError						Varchar(2)		Output
As

Begin
	
	Set NoCount On
	


	Set @lcError = '0' -- Ok

	Declare @tmpImagenes Table(
			cnsctvo_cdgo_dcmnto		udtConsecutivo, 
			cnsctvo_cdgo_imgn		udtConsecutivo, 
			cnsctvo_cdgo_tpo_imgn	udtConsecutivo, 
			dscrpcn_tpo_imgn		udtDescripcion, 
			rta_imgn				Varchar(255), 
			tpo_idntfccn			Char(20), 
			nmro_idntfccn			udtNumeroIdentificacion,
			cnsctvo_cdgo_dprtmnto	udtConsecutivo, 
			cnsctvo_cdgo_cdd		udtConsecutivo)


Declare		@cnsctvo_cdgo_tpo_dcmntl	Int,
			@rta_srvdr					Varchar(150) 

Set			@cnsctvo_cdgo_tpo_dcmntl = 3 
set			@rta_srvdr	=	'\TUTELAS_ANEXOS\'
			

	Insert Into		@tmpImagenes
	Select			b.cnsctvo_cdgo_dcmnto,	b.cnsctvo_cdgo_imgn,		b.cnsctvo_cdgo_tpo_imgn, 
					i.dscrpcn_tpo_imgn,		b.rta_imgn,					space(2) as tpo_idntfccn, 
					space(23) as nmro_idntfccn, space(4) as cnsctvo_cdgo_dprtmnto , space(10) as cnsctvo_cdgo_cdd 
	From			tbImagenesxDocumentosDigitalizados b 
	Left Outer Join		dbo.tbTiposImagenes_Vigencias i On b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
	Where			b.cnsctvo_cdgo_dcmnto	= @lnConsecutivoDocumento
	/*And				right(b.rta_imgn,4) Not In ('.DOC','.PDF','.XLS')*/
	And				right(b.rta_imgn,4) Not In ('.DOC','.XLS')
	And				right(b.rta_imgn,5) Not In ('.DOCX','.XLSX')
	And				b.estdo = 'A'
	Union All
	Select			b.cnsctvo_cdgo_dcmnto,	b.cnsctvo_cdgo_imgn,		b.cnsctvo_cdgo_tpo_imgn, 
					i.dscrpcn_tpo_imgn,		b.rta_imgn,					space(2) as tpo_idntfccn, 
					space(23) as nmro_idntfccn, space(4) as cnsctvo_cdgo_dprtmnto , space(10) as cnsctvo_cdgo_cdd 
	From			tbImagenesxDocumentosDigitalizados b 
	Left Outer Join		dbo.tbTiposImagenes_Vigencias i On b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
	Where			b.cnsctvo_cdgo_dcmnto	= @lnConsecutivoDocumento
	/*And				right(b.rta_imgn,4) Not In ('.DOC','.PDF','.XLS')*/
	And				right(b.rta_imgn,4) Not In ('.DOC','.XLS')
	And				right(b.rta_imgn,5) Not In ('.DOCX','.XLSX')
	And				b.estdo Is Null

	-- Código adicionado - siscgm01 - 2013-09-23
	Update			@tmpImagenes
	Set				rta_imgn = @rta_srvdr + rta_imgn
	From			@tmpImagenes						a
	Inner Join		tbIndicesxDocumentosDigitalizados	b With (NoLock)	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
	Where			a.rta_imgn					Like '20%'
	And				b.cnsctvo_cdgo_tpo_dcmntl	= 3 
	-- Código adicionado - siscgm01 - 2013-09-23

	Update	@tmpImagenes
	Set		nmro_idntfccn =(Select	Max(ltrim(rtrim(vlr)))
							From	dbo.tbIndicesxImagenesDigitalizadas b
							Where	b.cnsctvo_cdgo_tpo_indce	= 1 -- Número identificacion beneficiario
							And		b.cnsctvo_cdgo_imgn			= a.cnsctvo_cdgo_imgn
							And		b.cnsctvo_cdgo_dcmnto		= @lnConsecutivoDocumento)
	From	@tmpImagenes a

	If @@Error != 0
		Set @lcError = '1'

	Update	@tmpImagenes
	Set		tpo_idntfccn =(Select	ltrim(rtrim(vlr))
							From	dbo.tbIndicesxImagenesDigitalizadas b
							Where	b.cnsctvo_cdgo_tpo_indce	= 7 -- Tipo Identificacion Beneficiario
							And		b.cnsctvo_cdgo_imgn			= a.cnsctvo_cdgo_imgn
							And		b.cnsctvo_cdgo_dcmnto		= @lnConsecutivoDocumento)
	From	@tmpImagenes a

	If @@Error != 0
		Set @lcError = '1'

	
	Update	@tmpImagenes
	Set		cnsctvo_cdgo_cdd = (Select	ltrim(rtrim(vlr))
								From	dbo.tbIndicesxImagenesDigitalizadas b
								Where	b.cnsctvo_cdgo_tpo_indce	= 35 -- Tipo Identificacion Beneficiario
								And		b.cnsctvo_cdgo_imgn			= a.cnsctvo_cdgo_imgn
								And		b.cnsctvo_cdgo_dcmnto		= @lnConsecutivoDocumento)
	From	@tmpImagenes a

	-- carga el departamento
	Update	@tmpImagenes
	Set		cnsctvo_cdgo_dprtmnto = c.cnsctvo_cdgo_dprtmnto
	From	@tmpImagenes a, bdAfiliacion.dbo.tbCiudades_vigencias c
	where	c.cnsctvo_cdgo_cdd = a.cnsctvo_cdgo_cdd
	and		getDate() between c.inco_vgnca and c.fn_vgnca
	

	
	--(sisatv01) 20151001 Actualizamos  las rutas de las imagenes no deben tener la raiz del servidor Atlas
	Update		@tmpImagenes 
	Set			rta_imgn = Replace(rta_imgn,'\\atlas','') 
	From		@tmpImagenes
	


	If @@Error != 0
		Set @lcError = '1'

	Select	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_tpo_imgn, 
			dscrpcn_tpo_imgn,		rta_imgn,				ltrim(rtrim(tpo_idntfccn)) as tpo_idntfccn, 
			nmro_idntfccn,			cnsctvo_cdgo_dprtmnto,	cnsctvo_cdgo_cdd 
	From	@tmpImagenes

End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDetalleDocumentos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDetalleDocumentos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDetalleDocumentos] TO [visosservice_role]
    AS [dbo];

