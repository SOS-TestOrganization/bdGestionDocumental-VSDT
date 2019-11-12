
CREATE Procedure	[dbo].[spGDActualizarImagenCTC]
--Declare
@nmro_ntfccn			Varchar(15),
@nmro_acta				Varchar(150),
@cnsctvo_sde			Varchar(10),
@rta_imgn				Varchar(250),
@nmbre_imgn				Varchar(20),
@lnejccn				Int	Output

As
Set NoCount On

Declare		@cnsctvo_cdgo_dcmnto	Int,
			@cnsctvo_cdgo_imgn		Int,
			@cnsctvo_cdgo_imgn_nvo	Int,
			@cnsctvo_cdgo_tpo_imgn	Int

Set			@lnejccn				=	0
Set			@cnsctvo_cdgo_tpo_imgn	=	135

/*
Set			@nmro_ntfccn			=	'89898989'
Set			@cnsctvo_sde			=	10
Set			@nmro_acta				=	'898989'
Set			@cnsctvo_cdgo_dcmnto	=	0
*/

/*
If	@crtla	=	'SI'
	Set	@crtla	=	'S'
Else
	Set	@crtla	=	'N'
*/

Select		@cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
From		tbIndicesxDocumentosDigitalizados	a
Inner Join	(	Select		b.cnsctvo_cdgo_dcmnto,	b.vlr
				From		tbIndicesxDocumentosDigitalizados	b
				Where		cnsctvo_cdgo_tpo_indce		=	5
				And			cnsctvo_Cdgo_tpo_dcmntl		=	1
				And			vlr							=	@nmro_ntfccn
			)	As c	On	c.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Inner Join	(	Select		d.cnsctvo_cdgo_dcmnto,	d.vlr
				From		tbIndicesxDocumentosDigitalizados	d
				Where		cnsctvo_cdgo_tpo_indce		=	8
				And			cnsctvo_Cdgo_tpo_dcmntl		=	1
				And			vlr							=	@nmro_acta
			)	As e	On	e.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Where		a.cnsctvo_cdgo_tpo_indce		=	19
And			a.cnsctvo_cdgo_tpo_dcmntl		=	1
And			a.vlr							=	Ltrim(Rtrim(@cnsctvo_sde))

If	@cnsctvo_cdgo_dcmnto	!=	0
	Begin
		If Exists	(	Select	1
						From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
						Where	cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
						And		estdo				=	'A'
						And		prncpl				=	'S'
					)
			Begin
				Select		@cnsctvo_cdgo_imgn	=	cnsctvo_cdgo_imgn
				From		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
				Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
				And			estdo				=	'A'
				And			prncpl				=	'S'

				Update		tbImagenesxDocumentosDigitalizados
				Set			estdo				=	'I'
				Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
				And			cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn
				And			prncpl				=	'S'

				/*
				Update		tbImagenesxDocumentosDigitalizados
				Set			rta_imgn			=	@rta_imgn+@nmbre_imgn
				Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
				And			cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn
				*/

				Select		@cnsctvo_cdgo_imgn_nvo	=	Max(cnsctvo_cdgo_imgn)+1
				From		tbImagenesxDocumentosDigitalizados

				Insert Into	tbImagenesxDocumentosDigitalizados
				Values		(	@cnsctvo_cdgo_imgn_nvo,		@cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_tpo_imgn,
								@rta_imgn+@nmbre_imgn,		'S',						'A'
							)


				Set			@lnejccn	=	0
			End
		Else
			Set			@lnejccn	=	1
	End
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenCTC] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenCTC] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenCTC] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenCTC] TO [visosservice_role]
    AS [dbo];

