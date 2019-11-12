
CREATE Procedure	[dbo].[spGDValidarDatosFormulariosMasivo]
As
Set Nocount On


Declare			@dgtlzdr		Char(4),
				@tpo_dcmnto		Char(20)
				
Set				@dgtlzdr		=	'SIO'
Set				@tpo_dcmnto		=	'FORMULARIOS'

/*
Create Table	#tmpDatosValidacion
(	nmro				Int,
	tpo_frmlro			Char(50),
	nmro_frmlro			Char(50),
	nmro_blsa			Char(20),
	cnsctvo				Int
)

Insert Into		#tmpDatosValidacion
Values			(1,	'FIRC001',	'3351777',	'16696', 1)

Insert Into		#tmpDatosValidacion
Values			(2,	'FIRC005',	'335292',	'18', 1)

Insert Into		#tmpDatosValidacion
Values			(3,	'FIRC001',	'3359229',	'16719', 1)
*/

Create Table	#tmpLogValidacion
(	dgtlzdr				Char(4),
	tpo_dcmnto			Char(20),
	tpo_frmlro_lg 		Char(50),
	nmro_frmlro_lg		Char(50),
	nmro_blsa_nvo_lg	Char(20),
	nmro_blsa_antrr_lg	Char(20),
	cnsctvo_dcmnto		Int,
	estdo				Varchar(50)
)


Create Table	#tmpDatosCarga
(	nmro				Int,
	tpo_frmlro 			Char(50),
	nmro_frmlro			Char(50),
	nmro_blsa			Char(20)
)

Insert Into	#tmpDatosCarga
Select		nmro,		tpo_frmlro,			nmro_frmlro,		nmro_blsa
From		#tmpDatosValidacion


Insert Into	#tmpLogValidacion
Select		@dgtlzdr,		@tpo_dcmnto,		tpo_frmlro,		nmro_frmlro,		nmro_blsa,
			'',				0,					''
From		#tmpDatosCarga


Select		a.cnsctvo_cdgo_dcmnto, d.vlr,		d.tpo_frmlro_lg
Into		#tmpDatosOriginales
From		tbIndicesxDocumentosDigitalizados		a
Inner Join	(	Select			c.vlr,	b.tpo_frmlro_lg,	c.cnsctvo_cdgo_dcmnto
				From			#tmpLogValidacion					b
				Inner Join		tbIndicesxDocumentosDigitalizados	c	On	c.vlr	=	b.nmro_frmlro_lg
				Where			c.cnsctvo_cdgo_tpo_indce	=	10
			)	As d
			On	d.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Where		a.cnsctvo_cdgo_tpo_indce	=	11
And			a.vlr						=	d.tpo_frmlro_lg


Update		#tmpLogValidacion
Set			cnsctvo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
From		#tmpDatosOriginales	a
Inner Join	#tmpLogValidacion	b	On	b.tpo_frmlro_lg		=	a.tpo_frmlro_lg
									And	b.nmro_frmlro_lg	=	a.vlr

Update		#tmpLogValidacion
Set			nmro_blsa_antrr_lg	=	b.vlr
From		#tmpLogValidacion					a
Inner Join	tbIndicesxDocumentosDigitalizados	b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_dcmnto
Where		b.cnsctvo_cdgo_tpo_indce	=	14

Update		#tmpLogValidacion
Set			estdo	=	Case	When	cnsctvo_dcmnto != 0	Then	'ENCONTRADO'
								Else	'NO ENCONTRADO'
						End

Select		*
From		#tmpLogValidacion

Drop Table	#tmpLogValidacion
Drop Table	#tmpDatosCarga
Drop Table	#tmpDatosOriginales
--Drop Table	#tmpDatosValidacion


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarDatosFormulariosMasivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarDatosFormulariosMasivo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarDatosFormulariosMasivo] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarDatosFormulariosMasivo] TO [visosservice_role]
    AS [dbo];

