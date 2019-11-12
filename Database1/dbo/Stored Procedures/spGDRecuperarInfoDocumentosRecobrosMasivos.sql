



CREATE Procedure	[dbo].[spGDRecuperarInfoDocumentosRecobrosMasivos]
@nmro_rcbro			Varchar(20),
@indce1				Varchar(20),
@indce2				Varchar(20),
@indce3				Varchar(20),
@cnsctvo_tpo_dcmnto	Int


As
Set Nocount On

/*
Create Table	#tmpDatosRecobros
(	nmro_rcbro			Varchar(50),
	indce1				Varchar(50),
	indce2				Varchar(50),
	indce3				Varchar(50),
	cnsctvo_tpo_dcmnto	Int,
	cnsctvo_rgstro		Int
)
drop table #tmpDatosDocumentosRecobros1
drop table #tmpDatosFacturas

Insert Into		#tmpDatosDocumentosRecobros1
Values			('231956',	0,0,0,0, 0,
			'',				'')
*/


Create Table	#tmpDatosDocumentosRecobros
(	nmro_rcbro			Varchar(20),
	indce1				Varchar(20),
	indce2				Varchar(20),
	indce3				Varchar(20),
	cnsctvo_tpo_dcmnto	Int,
	cnsctvo_cdgo_dcmnto	Int,
	rta_imgn			Varchar(150),
	dscrpcn_tpo_dcmnto	Varchar(20)
)


Create Table	#tmpDatosDocumentosRecobros1
(	nmro_rcbro			Varchar(20),
	indce1				Varchar(20),
	indce2				Varchar(20),
	indce3				Varchar(20),
	cnsctvo_tpo_dcmnto	Int,
	cnsctvo_cdgo_dcmnto	Int,
	rta_imgn			Varchar(150),
	dscrpcn_tpo_dcmnto	Varchar(20)
)

Create Table #tmpImagenesRecobros
(	cnsctvo_cdgo_dcmnto		Int,
	rta_imgn				Varchar(150),
	nmro_rcbro				Varchar(20),
	dscrpcn_tpo_dcmnto		Varchar(20),
	indce1					Varchar(20),
	indce2					Varchar(20),
	indce3					Varchar(20),
	ordn_dcmnto				Int
)

Create Table	#tmpDatosFacturas
(	cnsctvo_cdgo_dcmnto		Int,
	rta_imgn				Varchar(150),
	nmro_rcbro				Varchar(20),
	dscrpcn_tpo_dcmnto		Varchar(20)
)

/*
Insert Into	#tmpDatosDocumentosRecobros
Select		nmro_rcbro,		indce1,		indce2,		indce3,		cnsctvo_tpo_dcmnto,		0,				'',
			'',				0
From		#tmpDatosRecobros
*/
if ltrim(rtriM(@nmro_rcbro)) != ''
Begin 
	Insert Into	#tmpDatosDocumentosRecobros1
	Select		@nmro_rcbro,		@indce1,		@indce2,		@indce3,		@cnsctvo_tpo_dcmnto,		0,				'',
				''
End
--From		#tmpDatosRecobros

Insert	Into	#tmpDatosDocumentosRecobros
Select		j.nmro_rcbro		,	j.indce1			,	j.indce2			,
			j.indce3			,	j.cnsctvo_tpo_dcmnto,	a.cnsctvo_cdgo_dcmnto	,
			j.rta_imgn			,	j.dscrpcn_tpo_dcmnto
From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados		a
Inner Join	(	Select			c.cnsctvo_cdgo_dcmnto
				From			#tmpDatosDocumentosRecobros1			b
				Inner Join		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	c	On	c.vlr	=	b.indce1
				Where			c.cnsctvo_cdgo_tpo_indce	=	5
				And				c.cnsctvo_cdgo_tpo_dcmntl	=	1
				And				b.cnsctvo_tpo_dcmnto		=	1
			)	As d
			On	d.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Inner Join	(	Select			e.cnsctvo_cdgo_dcmnto
				From			#tmpDatosDocumentosRecobros1			b
				Inner Join		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	e	On	e.vlr	=	b.indce2
				Where			e.cnsctvo_cdgo_tpo_indce	=	8
				And				e.cnsctvo_cdgo_tpo_dcmntl	=	1
				And				b.cnsctvo_tpo_dcmnto		=	1
			)	As f
			On	f.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Inner Join	#tmpDatosDocumentosRecobros1	j	On	j.indce3	=	a.vlr
Where		a.cnsctvo_cdgo_tpo_indce	=	19
And			a.cnsctvo_cdgo_tpo_dcmntl	=	1
And			j.cnsctvo_tpo_dcmnto		=	1

-- CTC
Insert	Into	#tmpDatosDocumentosRecobros
Select		j.nmro_rcbro		,	j.indce1			,	j.indce2			,
			j.indce3			,	j.cnsctvo_tpo_dcmnto,	a.cnsctvo_cdgo_dcmnto	,
			j.rta_imgn			,	j.dscrpcn_tpo_dcmnto
From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados		a
Inner Join	(	Select			c.cnsctvo_cdgo_dcmnto
				From			#tmpDatosDocumentosRecobros1			b
				Inner Join		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	c	On	c.vlr	=	b.indce1
				Where			c.cnsctvo_cdgo_tpo_indce	=	5
				And				c.cnsctvo_cdgo_tpo_dcmntl	=	1
				And				b.cnsctvo_tpo_dcmnto		=	1
			)	As d
			On	d.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Inner Join	(	Select			e.cnsctvo_cdgo_dcmnto
				From			#tmpDatosDocumentosRecobros1			b
				Inner Join		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	e	On	e.vlr	=	b.indce2
				Where			e.cnsctvo_cdgo_tpo_indce	=	8
				And				e.cnsctvo_cdgo_tpo_dcmntl	=	1
				And				b.cnsctvo_tpo_dcmnto		=	1
			)	As f
			On	f.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Inner Join	#tmpDatosDocumentosRecobros1	j	On	j.indce3	=	a.vlr
Where		a.cnsctvo_cdgo_tpo_indce	=	19
And			a.cnsctvo_cdgo_tpo_dcmntl	=	1
And			j.cnsctvo_tpo_dcmnto		=	1


-- TUTELA
Insert	Into	#tmpDatosDocumentosRecobros
Select		j.nmro_rcbro		,	j.indce1			,	j.indce2			,
			j.indce3			,	j.cnsctvo_tpo_dcmnto,	a.cnsctvo_cdgo_dcmnto	,
			j.rta_imgn			,	j.dscrpcn_tpo_dcmnto
From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados		a
Inner Join	(	Select			c.cnsctvo_cdgo_dcmnto
				From			#tmpDatosDocumentosRecobros1			b
				Inner Join		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	c	On	c.vlr	=	b.indce1
				Where			c.cnsctvo_cdgo_tpo_indce	=	5
				And				c.cnsctvo_cdgo_tpo_dcmntl	=	3
				And				b.cnsctvo_tpo_dcmnto		=	3
			)	As d
			On	d.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Inner Join	#tmpDatosDocumentosRecobros1	j	On	j.indce3	=	a.vlr
Where		a.cnsctvo_cdgo_tpo_indce	=	21
And			a.cnsctvo_cdgo_tpo_dcmntl	=	3
And			j.cnsctvo_tpo_dcmnto		=	3


-- ATEP
Insert	Into	#tmpDatosDocumentosRecobros
Select		j.nmro_rcbro		,	j.indce1			,	j.indce2			,
			j.indce3			,	j.cnsctvo_tpo_dcmnto,	a.cnsctvo_cdgo_dcmnto	,
			j.rta_imgn			,	j.dscrpcn_tpo_dcmnto
From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados		a
Inner Join	(	Select			c.cnsctvo_cdgo_dcmnto
				From			#tmpDatosDocumentosRecobros1	b
				Inner Join		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	c	On	c.vlr	=	b.indce1
				Where			c.cnsctvo_cdgo_tpo_indce	=	5
				And				c.cnsctvo_cdgo_tpo_dcmntl	=	9
				And				b.cnsctvo_tpo_dcmnto		=	9
			)	As d
			On	d.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Inner Join	#tmpDatosDocumentosRecobros1	j	On	j.indce3	=	a.vlr
Where		a.cnsctvo_cdgo_tpo_indce	=	21
And			a.cnsctvo_cdgo_tpo_dcmntl	=	9
And			j.cnsctvo_tpo_dcmnto		=	9


IF	(Select Count(*) From #tmpDatosDocumentosRecobros ) = 0
Begin
	if ltrim(rtriM(@nmro_rcbro)) != ''
	Begin 
		Insert Into	#tmpDatosDocumentosRecobros
		Select		@nmro_rcbro,		@indce1,		@indce2,		@indce3,
					@cnsctvo_tpo_dcmnto,0,				'',				''
	End
End


Update		#tmpDatosDocumentosRecobros
Set			dscrpcn_tpo_dcmnto	=	Case	When	cnsctvo_tpo_dcmnto	=	1	Then	'CTC'
											When	cnsctvo_tpo_dcmnto	=	3	Then	'TUTELA'
											When	cnsctvo_tpo_dcmnto	=	9	Then	'ATEP'
											Else	'SIN CLASIFICAR'
									End

-- Calcula los consecutivos de los documentos de las facturas
Insert Into	#tmpDatosFacturas
Select		a.cnsctvo_cdgo_dcmnto,		'',			a.vlr,		'FACTURA'
From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	a
Inner Join	#tmpDatosDocumentosRecobros									b	On	b.nmro_rcbro	=	a.vlr
Where		a.cnsctvo_cdgo_tpo_indce	=	9
And			a.cnsctvo_cdgo_tpo_dcmntl	=	2

-- Consulta las imágenes de las facturas
Select		a.cnsctvo_cdgo_dcmnto,		b.rta_imgn,		a.nmro_rcbro,		a.dscrpcn_tpo_dcmnto
Into		#tmpImagenesFacturas
From		#tmpDatosFacturas											a
Inner Join	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Where		(a.cnsctvo_cdgo_dcmnto Is Not Null And a.cnsctvo_cdgo_dcmnto != 0)


-- Inserta en la tabla final de imágenes los anexos
Insert Into			#tmpImagenesRecobros
Select Distinct		a.cnsctvo_cdgo_dcmnto,		b.rta_imgn,		a.nmro_rcbro,		a.dscrpcn_tpo_dcmnto,
					a.indce1,					a.indce2,		a.indce3,			2
From				#tmpDatosDocumentosRecobros									a
Inner Join			bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados	b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Where				(a.cnsctvo_cdgo_dcmnto Is Not Null And a.cnsctvo_cdgo_dcmnto != 0)


-- Inserta en la tabla final de imágenes las facturas
Insert Into	#tmpImagenesRecobros
Select		c.cnsctvo_cdgo_dcmnto,		c.rta_imgn,		c.nmro_rcbro,		c.dscrpcn_tpo_dcmnto,
			'',							'',				'',					1
From		#tmpImagenesFacturas										c
Where		(c.cnsctvo_cdgo_dcmnto Is Not Null And c.cnsctvo_cdgo_dcmnto != 0)


Select		*
From		#tmpImagenesRecobros
Order By	ordn_dcmnto


Drop Table	#tmpDatosDocumentosRecobros
Drop Table	#tmpImagenesRecobros
--Drop Table  #tmpDatosRecobros
Drop Table	#tmpImagenesFacturas
Drop Table	#tmpDatosFacturas




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarInfoDocumentosRecobrosMasivos] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarInfoDocumentosRecobrosMasivos] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarInfoDocumentosRecobrosMasivos] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarInfoDocumentosRecobrosMasivos] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarInfoDocumentosRecobrosMasivos] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarInfoDocumentosRecobrosMasivos] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarInfoDocumentosRecobrosMasivos] TO [visosservice_role]
    AS [dbo];

