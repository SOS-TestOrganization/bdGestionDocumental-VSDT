


CREATE Procedure	[dbo].[spGDInvalidarDocumentosdigitalizados]
@tpo_frmlro				Varchar(10),
@nmro_frmlro			Varchar(10)

As
Set Nocount On

Declare	@cnsctvo_cdgo_dcmnto	Int,
		@ttl_rgstrs				Int
/*
Declare	@tpo_frmlro				Varchar(10),
		@nmro_frmlro			Varchar(10),

Set		@tpo_frmlro		=	'FIRC001'
Set		@nmro_frmlro	=	'3616351'
*/

Select		@ttl_rgstrs	=	Count(*)
From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados				a
Inner Join	(	Select	b.cnsctvo_cdgo_dcmnto
				From	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	b
				Where	b.cnsctvo_cdgo_tpo_indce	=	10
				And		b.vlr						=	@nmro_frmlro
				And		b.cnsctvo_cdgo_tpo_dcmntl	=	4
			)	As c	On	c.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Where		a.cnsctvo_cdgo_tpo_indce	=	11
And			a.vlr						=	@tpo_frmlro
And			a.cnsctvo_cdgo_tpo_dcmntl	=	4


If	@ttl_rgstrs	>	1
	Begin
		Select		@cnsctvo_cdgo_dcmnto	=	Min(a.cnsctvo_cdgo_dcmnto)
		From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados				a
		Inner Join	(	Select	b.cnsctvo_cdgo_dcmnto
						From	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	b
						Where	b.cnsctvo_cdgo_tpo_indce	=	10
						And		b.vlr						=	@nmro_frmlro
						And		b.cnsctvo_cdgo_tpo_dcmntl	=	4
					)	As c	On	c.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
		Where		a.cnsctvo_cdgo_tpo_indce	=	11
		And			a.vlr						=	@tpo_frmlro
		And			a.cnsctvo_cdgo_tpo_dcmntl	=	4


		Update		bdGestionDocumental.dbo.tbDocumentosDigitalizados
		Set			estdo_rgstro		=	'N'
		Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
		And			estdo_rgstro		=	'S'
	End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDInvalidarDocumentosdigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDInvalidarDocumentosdigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDInvalidarDocumentosdigitalizados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDInvalidarDocumentosdigitalizados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDInvalidarDocumentosdigitalizados] TO [visosservice_role]
    AS [dbo];

