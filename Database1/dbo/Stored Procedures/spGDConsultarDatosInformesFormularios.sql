

CREATE Procedure	[dbo].[spGDConsultarDatosInformesFormularios]
As
Set NoCount On

Create Table 		#tmpDocumentos
(
	cnsctvo_cdgo_dcmnto				Int,
	dscrpcn_tpo_frmlro				Varchar(20),
	nmro_frmlro						Varchar(20),
	dscrpcn_tpo_frmlro_gd			Varchar(20),
	ttl_imgns						Int,
	nmro_blsa						Varchar(10),
	fcha_rdccn						Datetime,
	fcha_dgtcn_rdccn				Datetime,
	cnsctvo_tpo_idntfccn_ctznte		Int,
	nmro_idntfccn_ctznte			Varchar(30),
	fcha_crga						Datetime,
	fcha_dgtlzcn					Datetime,
	cnsctvo_cdgo_prcso_crga_imgn	Int,
	prvdr							Varchar(30),
	frmlro_afldo					Int,
	cnsctvo_cdgo_tpo_frmlro			Int,
	nmro_idntfccn_ctznte_gd			Varchar(30),
	dscrpcn_prvdr					Varchar(30),
	usro_dgtdr						Varchar(30),
	frmlro_exstnte					Int,
	nmro_frmlro_gd					Varchar(20)
)

Insert Into		#tmpDocumentos
Select Distinct	g.cnsctvo_cdgo_dcmnto,								x.dscrpcn_tpo_frmlro,									x.nmro_frmlro,
				'',													0,														0,
				x.fcha_rdccn,										x.fcha_dgtcn_rdccn,										x.cnsctvo_tpo_idntfccn_ctznte,
				x.nmro_idntfccn_ctznte,								Null,													Null,
				0,													'',														x.cnsctvo_cdgo_tpo_frmlro,
				x.usro_frmlro,										'',														x.dscrpcn_prvdr,
				x.usro_dgtdr,										0,														''
From			bdGestionDocumental.dbo.tmpTemporalCruceFormulariosGD		x
Inner Join		(	Select		e.cnsctvo_cdgo_dcmnto,	e.vlr
					From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	e
					Inner Join	bdGestionDocumental.dbo.tmpTemporalCruceFormulariosGD		t	On	Ltrim(Rtrim(t.nmro_frmlro))	=	Ltrim(Rtrim(e.vlr))
					Where		e.cnsctvo_cdgo_tpo_dcmntl		=		4
					And			e.cnsctvo_cdgo_tpo_indce		=		10
				)	As g	On	g.vlr		=	x.nmro_frmlro
Where			x.usro_frmlro	=	1



Insert Into		#tmpDocumentos
Select Distinct	g.cnsctvo_cdgo_dcmnto,								x.dscrpcn_tpo_frmlro,									x.nmro_frmlro,
				'',													0,														0,
				x.fcha_rdccn,										x.fcha_dgtcn_rdccn,										x.cnsctvo_tpo_idntfccn_ctznte,
				x.nmro_idntfccn_ctznte,								'',														'',
				0,													'',														x.cnsctvo_cdgo_tpo_frmlro,
				x.usro_frmlro,										'',														x.dscrpcn_prvdr,
				x.usro_dgtdr,										0,														''
From			bdGestionDocumental.dbo.tmpTemporalCruceFormulariosGD		x
Inner Join		(	Select		e.cnsctvo_cdgo_dcmnto,	e.vlr
					From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	e
					Inner Join	bdGestionDocumental.dbo.tmpTemporalCruceFormulariosGD		t	On	Ltrim(Rtrim(t.nmro_frmlro))	=	Ltrim(Rtrim(e.vlr))
					Where		e.cnsctvo_cdgo_tpo_dcmntl		=	7
					And			e.cnsctvo_cdgo_tpo_indce		=	10
				)	As g	On	g.vlr		=	x.nmro_frmlro
Where			x.usro_frmlro	=	2


Update		#tmpDocumentos
Set			dscrpcn_tpo_frmlro_gd		=	w.vlr
From		#tmpDocumentos												v
Inner Join	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	w	On	w.cnsctvo_cdgo_dcmnto	=	v.cnsctvo_cdgo_dcmnto
Where		w.cnsctvo_cdgo_tpo_dcmntl		=	4
And			w.cnsctvo_cdgo_tpo_indce		=	11


Update		#tmpDocumentos
Set			dscrpcn_tpo_frmlro_gd		=	w.vlr
From		#tmpDocumentos												v
Inner Join	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	w	On	w.cnsctvo_cdgo_dcmnto	=	v.cnsctvo_cdgo_dcmnto
Where		w.cnsctvo_cdgo_tpo_dcmntl		=	7
And			w.cnsctvo_cdgo_tpo_indce		=	11
And			dscrpcn_tpo_frmlro_gd			=	''


Update		#tmpDocumentos
Set			nmro_frmlro_gd		=	w.vlr
From		#tmpDocumentos												v
Inner Join	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	w	On	w.cnsctvo_cdgo_dcmnto	=	v.cnsctvo_cdgo_dcmnto
Where		w.cnsctvo_cdgo_tpo_dcmntl		=	4
And			w.cnsctvo_cdgo_tpo_indce		=	10


Update		#tmpDocumentos
Set			nmro_frmlro_gd		=	w.vlr
From		#tmpDocumentos												v
Inner Join	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	w	On	w.cnsctvo_cdgo_dcmnto	=	v.cnsctvo_cdgo_dcmnto
Where		w.cnsctvo_cdgo_tpo_dcmntl		=	7
And			w.cnsctvo_cdgo_tpo_indce		=	10


Update		#tmpDocumentos
Set			nmro_blsa		=	m.vlr
From		#tmpDocumentos												l
Inner Join	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	m	On	m.cnsctvo_cdgo_dcmnto	=	l.cnsctvo_cdgo_dcmnto
Where		m.cnsctvo_cdgo_tpo_dcmntl		=	4
And			m.cnsctvo_cdgo_tpo_indce		=	14


Update		#tmpDocumentos
Set			nmro_blsa		=	m.vlr
From		#tmpDocumentos												l
Inner Join	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	m	On	m.cnsctvo_cdgo_dcmnto	=	l.cnsctvo_cdgo_dcmnto
Where		m.cnsctvo_cdgo_tpo_dcmntl		=	7
And			m.cnsctvo_cdgo_tpo_indce		=	14


Update		#tmpDocumentos
Set			nmro_idntfccn_ctznte_gd		=	m.vlr
From		#tmpDocumentos												l
Inner Join	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	m	On	m.cnsctvo_cdgo_dcmnto	=	l.cnsctvo_cdgo_dcmnto
Where		m.cnsctvo_cdgo_tpo_dcmntl		=	4
And			m.cnsctvo_cdgo_tpo_indce		=	1


Update		#tmpDocumentos
Set			nmro_idntfccn_ctznte_gd		=	m.vlr
From		#tmpDocumentos												l
Inner Join	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	m	On	m.cnsctvo_cdgo_dcmnto	=	l.cnsctvo_cdgo_dcmnto
Where		m.cnsctvo_cdgo_tpo_dcmntl		=	7
And			m.cnsctvo_cdgo_tpo_indce		=	1


Update		#tmpDocumentos
Set			fcha_crga						=	c.fcha_crcn,
			fcha_dgtlzcn					=	c.fcha_crga_prvdr,
			cnsctvo_cdgo_prcso_crga_imgn	=	c.cnsctvo_cdgo_prcso_crga_imgn
From		#tmpDocumentos											a
Inner Join	bdGestionDocumental.dbo.tbDocumentosDigitalizados		b	On	b.cnsctvo_cdgo_dcmnto			=	a.cnsctvo_cdgo_dcmnto
Inner Join	bdGestionDocumental.dbo.tbProcesosCargaImagenes			c	On	c.cnsctvo_cdgo_prcso_crga_imgn	=	b.cnsctvo_prcso_crga


Update		#tmpDocumentos
Set			prvdr		=	c.dscrpcn_dgtlzdr
From		#tmpDocumentos											a
Inner Join	bdGestionDocumental.dbo.tbProcesosCargaImagenes			b	On	b.cnsctvo_cdgo_prcso_crga_imgn	=	a.cnsctvo_cdgo_prcso_crga_imgn
Inner Join	bdGestionDocumental.dbo.tbDigitalizadores				c	On	c.cnsctvo_cdgo_dgtlzdr			=	b.cnsctvo_cdgo_dgtlzdr


Select		Count(i.cnsctvo_cdgo_imgn) As ttl_imgns,	i.cnsctvo_cdgo_dcmnto
Into		#tmpTotalImagenesDocumentos
From		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	i
Inner Join	#tmpDocumentos												a	On	a.cnsctvo_cdgo_dcmnto	=	i.cnsctvo_cdgo_dcmnto
Group By	i.cnsctvo_cdgo_dcmnto


Update		#tmpDocumentos
Set			ttl_imgns	=	e.ttl_imgns
From		#tmpDocumentos				d
Inner Join	#tmpTotalImagenesDocumentos	e	On	e.cnsctvo_cdgo_dcmnto	=	d.cnsctvo_cdgo_dcmnto

-- Formularios que existen y tienen imágenes asociadas
Update		#tmpDocumentos
Set			frmlro_exstnte		=	1
Where		Ltrim(Rtrim(nmro_frmlro))			=	Ltrim(Rtrim(nmro_frmlro_gd))
And			Ltrim(Rtrim(dscrpcn_tpo_frmlro))	=	Ltrim(Rtrim(dscrpcn_tpo_frmlro_gd))
And			Ltrim(Rtrim(nmro_idntfccn_ctznte))	=	Ltrim(Rtrim(nmro_idntfccn_ctznte_gd))


Delete
From		#tmpDocumentos
Where		Ltrim(Rtrim(nmro_idntfccn_ctznte))	!=	Ltrim(Rtrim(nmro_idntfccn_ctznte_gd))

-- Formularios que no existen
Insert Into		#tmpDocumentos
Select			0,								x.dscrpcn_tpo_frmlro,									x.nmro_frmlro,
				'',								0,														0,
				x.fcha_rdccn,					x.fcha_dgtcn_rdccn,										x.cnsctvo_tpo_idntfccn_ctznte,
				x.nmro_idntfccn_ctznte,			Null,													Null,
				0,								'',														x.cnsctvo_cdgo_tpo_frmlro,
				x.usro_frmlro,					'',														x.dscrpcn_prvdr,
				x.usro_dgtdr,					2,														''
From			#tmpDocumentos											a
Right Join		bdGestionDocumental.dbo.tmpTemporalCruceFormulariosGD	x	On		Ltrim(Rtrim(x.nmro_frmlro))			=	Ltrim(Rtrim(a.nmro_frmlro))
																			And		Ltrim(Rtrim(x.dscrpcn_tpo_frmlro))	=	Ltrim(Rtrim(a.dscrpcn_tpo_frmlro))
Where			a.cnsctvo_cdgo_dcmnto	Is Null

Insert Into		tbDatosFinalesConsultaFormularios
Select			cnsctvo_cdgo_dcmnto,											dscrpcn_tpo_frmlro,															nmro_frmlro,
				dscrpcn_tpo_frmlro_gd,											ttl_imgns,																	nmro_blsa,
				IsNull(Convert(Char(20),fcha_rdccn,120),'') As fcha_rdccn,		IsNull(Convert(Char(20),fcha_dgtcn_rdccn,120),'') As fcha_dgtcn_rdccn,		cnsctvo_tpo_idntfccn_ctznte,
				nmro_idntfccn_ctznte,											IsNull(Convert(Char(20),fcha_crga,120),'') As fcha_crga,					IsNull(Convert(Char(20),fcha_dgtlzcn,120),'') As fcha_dgtlzcn,
				cnsctvo_cdgo_prcso_crga_imgn,						prvdr,														frmlro_afldo,
				cnsctvo_cdgo_tpo_frmlro,							nmro_idntfccn_ctznte_gd,									dscrpcn_prvdr,
				usro_dgtdr,											frmlro_exstnte
From			#tmpDocumentos
Order By		cnsctvo_cdgo_tpo_frmlro,							nmro_frmlro,		frmlro_exstnte


Drop Table	#tmpTotalImagenesDocumentos
Drop Table	#tmpDocumentos
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDatosInformesFormularios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDatosInformesFormularios] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDatosInformesFormularios] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDatosInformesFormularios] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDatosInformesFormularios] TO [visosservice_role]
    AS [dbo];

