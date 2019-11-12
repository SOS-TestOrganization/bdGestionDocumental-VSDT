Create Procedure	spGDGrabarCabeceraDocumentosAnexosRespondeMigracion
As
Set Nocount On


Begin Tran
-- Este trozo de código sirve para armar la tabla tbDocumentosDigitalizados
Declare	@temporaldocumentosresponde As Table
(
cnsctvo_cdgo_dcmnto			Int,
cnsctvo_cdgo_tpo_dcmntl		Int,
nmro_imgns					Int,
cnsctvo_cdgo_dgtlzdr		Int,
fcha_dgtlzcn				Datetime,
cnsctvo_prcso_crga			Int,
cnsctvo_cdgo_cntcto			Int,
cnsctvo_cdgo_dcmnto_rspnde	Int
)

Declare			@fcha_dgtlzcn			Datetime,
				@cnsctvo_cdgo_dcmnto	Int
Set				@fcha_dgtlzcn			=	Getdate()

Select			@cnsctvo_cdgo_dcmnto	=	Max(cnsctvo_cdgo_dcmnto)
From			tbDocumentosDigitalizados

Insert Into		@temporaldocumentosresponde
Select			0,							5,				1,				5,				@fcha_dgtlzcn,			0,				cnsctvo_cdgo_cntcto,
				cnsctvo_cdgo_dcmnto
From			tbDocumentosAnexosResponde
Where			extnsn_archvo			<>	''
And				cnsctvo_archvo_dcmnto	<>	0
Order By		cnsctvo_cdgo_dcmnto


Update			@temporaldocumentosresponde
Set				@cnsctvo_cdgo_dcmnto	=	cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto + 1
	

-- Esto es lo que se va a insertar en la tabla tbDocumentosDigitalizados
/*
Insert Into		tbDocumentosDigitalizados
Select			cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl,			nmro_imgns,				cnsctvo_cdgo_dgtlzdr,
				fcha_dgtlzcn,					cnsctvo_prcso_crga
From			@temporaldocumentosresponde
*/
-- Este trozo de código sirve para armar la tabla tbDocumentosDigitalizados



-- Este trozo de código sirve para armar la tabla tbImagenesxDocumentosDigitalizados
Declare	@temporalimagenesresponde	As Table
(
	cnsctvo_cdgo_imgn			Int,
	cnsctvo_cdgo_dcmnto			Int,
	cnsctvo_cdgo_tpo_imgn		Int,
	rta_imgn					Varchar(250),
	prncpl						Char(1),
	cnsctvo_cdgo_cntcto			Int,
	cnsctvo_cdgo_dcmnto_rspnde	Int
)


Declare			@cnsctvo_cdgo_imgn	Int
Set				@fcha_dgtlzcn			=	Getdate()

Select			@cnsctvo_cdgo_imgn	=	Max(cnsctvo_cdgo_imgn)
From			tbImagenesxDocumentosDigitalizados


Insert Into		@temporalimagenesresponde
Select			0,								cnsctvo_cdgo_dcmnto,		112,				'',						'S',				cnsctvo_cdgo_cntcto,
				cnsctvo_cdgo_dcmnto_rspnde
From			@temporaldocumentosresponde


Update			@temporalimagenesresponde
Set				@cnsctvo_cdgo_imgn	=	cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn + 1


Update			@temporalimagenesresponde
Set				rta_imgn	=	'\\ATLAS\RESPONDE_ANEXOS\'+d.fcha_crpta_archvo+'\'+Convert(VarChar(15),d.cnsctvo_archvo_dcmnto)+d.extnsn_archvo
From			@temporalimagenesresponde					t
Inner Join		tbDocumentosAnexosResponde					d	On	d.cnsctvo_cdgo_cntcto	=	t.cnsctvo_cdgo_cntcto
																And	d.cnsctvo_cdgo_dcmnto	=	t.cnsctvo_cdgo_dcmnto_rspnde
Where			d.fcha_crpta_archvo <> ''
And				d.fcha_crpta_archvo Is Not Null
And				d.extnsn_archvo <> ''
And				d.cnsctvo_archvo_dcmnto <> 0


Update			@temporalimagenesresponde
Set				rta_imgn	=	'\\ATLAS\RESPONDE_ANEXOS\'+Convert(VarChar(15),d.cnsctvo_archvo_dcmnto)+d.extnsn_archvo
From			@temporalimagenesresponde					t
Inner Join		tbDocumentosAnexosResponde					d	On	d.cnsctvo_cdgo_cntcto	=	t.cnsctvo_cdgo_cntcto
																And	d.cnsctvo_cdgo_dcmnto	=	t.cnsctvo_cdgo_dcmnto_rspnde
Where			(d.fcha_crpta_archvo		=	''	Or		d.fcha_crpta_archvo Is Null)
And				d.extnsn_archvo				<>	''
And				d.cnsctvo_archvo_dcmnto		<>	0

/*
Insert Into		tbImagenesxDocumentosDigitalizados
Select			cnsctvo_cdgo_imgn,				cnsctvo_cdgo_dcmnto,				cnsctvo_cdgo_tpo_imgn,				rta_imgn,
				prncpl
From			@temporalimagenesresponde
*/
-- Este trozo de código sirve para armar la tabla tbImagenesxDocumentosDigitalizados


Commit Tran
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarCabeceraDocumentosAnexosRespondeMigracion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarCabeceraDocumentosAnexosRespondeMigracion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarCabeceraDocumentosAnexosRespondeMigracion] TO [visosservice_role]
    AS [dbo];

