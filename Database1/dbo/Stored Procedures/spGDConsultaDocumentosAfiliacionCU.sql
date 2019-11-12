
/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentosAfiliacion
* Desarrollado por		 :  <\A   Ing. Samuel Muñoz		A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC 20090318     			FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[spGDConsultaDocumentosAfiliacionCU]
/*1*/	@lcNumeroIdentificacion			Varchar(23),
/*2*/	@lcError						Varchar(2) Output

As
Set NoCount On

/*
Declare		@lcNumeroIdentificacion		Varchar(23),
			@lcError					Varchar(2)

Set			@lcNumeroIdentificacion		=	'4943476'
Set			@lcError					=	'0'
*/

Declare @lnConsecutivoAgrupadorDocumentos	tinyint

Set @lnConsecutivoAgrupadorDocumentos = 1 --Afiliacion

Set @lcError = '0' -- Ok

Declare @tmpDocumentos Table(
		cnsctvo_cdgo_dcmnto		udtConsecutivo,
		dscrpcn_dgtlzdr			udtDescripcion,		
		dscrpcn_tpo_dcmnto		udtDescripcion, 
		fcha_dgtlzcn			Datetime,				
		blsa					udtDescripcion,		
		nmro_idntfccn			udtNumeroIdentificacion,
		nmro_frmlro				udtNumeroFormulario,
		nmro_nvdd				udtNumeroFormulario,
		tpo_idntfccn			Char(2))


Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)

Insert 
	Into	@tmpConsecutivosDocumentos
	Select	cnsctvo_cdgo_dcmnto
	From	tbIndicesxDocumentosDigitalizados a
	Where	a.cnsctvo_cdgo_tpo_indce	=	1
	And		a.vlr						=	@lcNumeroIdentificacion
	And		Exists (Select 1 
					From	tbTiposDocumento b 
					Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
					And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

If @@Error != 0
	Set @lcError = '1'

Insert
	Into		@tmpDocumentos
	Select		a. cnsctvo_cdgo_dcmnto,			b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn,					space(30) as blsa,			@lcNumeroIdentificacion as nmro_idntfccn,
				space(15)  as nmro_frmlro,		space(15) as nmro_nvdd,		space(2) as tpo_idntfccn  
	From		dbo.tbDocumentosDigitalizados a
	Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
	Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
	Where		Exists (Select 1 
							From	@tmpConsecutivosDocumentos e 
							Where	a.cnsctvo_cdgo_dcmnto		= e.cnsctvo_cdgo_dcmnto)
							And		d.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos
	
	If @@Error != 0
		Set @lcError = '1'

Update		@tmpDocumentos
Set			blsa =(Select	ltrim(rtrim(vlr))
						From	tbIndicesxDocumentosDigitalizados b
						Where	b.cnsctvo_cdgo_tpo_indce	= 14
						And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From		@tmpDocumentos a

If @@Error != 0
			Set @lcError = '1'

Update		@tmpDocumentos
Set			nmro_frmlro =(Select	ltrim(rtrim(vlr))
							From	tbIndicesxDocumentosDigitalizados b
							Where	b.cnsctvo_cdgo_tpo_indce	= 10
							And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From		@tmpDocumentos a

If @@Error != 0
			Set @lcError = '1'



Update		@tmpDocumentos
Set			nmro_nvdd =(Select	ltrim(rtrim(vlr))
							From	tbIndicesxDocumentosDigitalizados b
							Where	b.cnsctvo_cdgo_tpo_indce	= 13
							And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From		@tmpDocumentos a

If @@Error != 0
			Set @lcError = '1'



Update		@tmpDocumentos
Set			tpo_idntfccn =(	Select Top 1	ltrim(rtrim(vlr))
							From			tbIndicesxDocumentosDigitalizados b
							Where			b.cnsctvo_cdgo_tpo_indce	= 7 -- Tipo Identificación
							And				b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto
							And				((vlr <> '') Or (vlr Is Null))
							)
From		@tmpDocumentos a

If @@Error != 0
			Set @lcError = '1'


Select		a.*, i.dscrpcn_tpo_imgn, Ltrim(Rtrim(b.rta_imgn)) As rta_imgn, b.prncpl
From		@tmpDocumentos a
Inner Join	tbImagenesxDocumentosDigitalizados b	On a.cnsctvo_cdgo_dcmnto	= b.cnsctvo_cdgo_dcmnto
Inner Join	tbTiposImagenes i						On b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
Order by	a.fcha_dgtlzcn Desc












GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacionCU] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacionCU] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacionCU] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacionCU] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosAfiliacionCU] TO [visosservice_role]
    AS [dbo];

