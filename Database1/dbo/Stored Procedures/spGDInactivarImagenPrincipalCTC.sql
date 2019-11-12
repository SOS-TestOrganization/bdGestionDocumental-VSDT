

CREATE Procedure	[dbo].[spGDInactivarImagenPrincipalCTC]
--Declare
@nmro_ntfccn			Varchar(15),
@nmro_acta				Varchar(150),
@cnsctvo_sde			Varchar(10),
@nmbre_imgn				Varchar(15),
@rta_imgn				Varchar(250),
@lnejccn				Int	Output


/*
Set			@nmro_ntfccn			=	'658676'
Set			@cnsctvo_sde			=	2
Set			@nmro_acta				=	'260892'
Set			@nmbre_imgn				=	'01BCDD3B.TIF'
Set			@rta_imgn				=	'\ImagenOUT\Digitalizacion\CTC\2010\02\09\01BCDD3B.TIF'
*/


As
Set NoCount On

Declare		@cnsctvo_cdgo_dcmnto	Int,
			@cnsctvo_cdgo_imgn		Int,
			@cnsctvo_cdgo_imgn_nvo	Int,
			@cnsctvo_cdgo_tpo_imgn	Int,
			@cdna					Varchar(25),
			@cnsctvo_cdgo_dgtlzdr	Int,
			@fcha_dgtlzcn			Varchar(10)


Set			@fcha_dgtlzcn			=	Substring(@rta_imgn,31,Len(@rta_imgn))
Set			@cnsctvo_cdgo_dcmnto	=	0
Set			@lnejccn				=	0
Set			@cnsctvo_cdgo_tpo_imgn	=	135
Set			@cnsctvo_cdgo_imgn		=	0
Set			@cdna					=	@fcha_dgtlzcn+'\'+@nmbre_imgn
Set			@cnsctvo_cdgo_imgn_nvo	=	0
Set			@cnsctvo_cdgo_dgtlzdr	=	5

/*
Set			@nmro_ntfccn			=	'614598'
Set			@cnsctvo_sde			=	2
Set			@nmro_acta				=	'255883'
Set			@cnsctvo_cdgo_dcmnto	=	0
*/

If Exists(	Select		1
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
		)

	Begin
		Select		a.cnsctvo_cdgo_dcmnto
		Into		#tmp1
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


		Select		b.*
		Into		#tmp2
		From		#tmp1							a
		Inner Join	tbDocumentosDigitalizados		b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
		Order By	b.cnsctvo_cdgo_dcmnto,	b.fcha_dgtlzcn		
		
		Declare		@cntdd		Int
					

		Select		@cntdd		=	Count(cnsctvo_cdgo_dcmnto)
		From		#tmp2


		/*
		If	@cntdd	<=2
			Begin
				Select Top 1	@cnsctvo_cdgo_dcmnto	=	cnsctvo_cdgo_dcmnto
				From			#tmp2
				Where			fcha_dgtlzcn =	(	Select	Min(fcha_dgtlzcn)
													From	#tmp2
												)

				Select		@cnsctvo_cdgo_imgn	=	cnsctvo_cdgo_imgn
				From		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
				Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
				And			(estdo				=	'A'		Or	estdo		Is Null)
				And			prncpl				=	'S'

				print	@cnsctvo_cdgo_dcmnto
				print	@cnsctvo_cdgo_imgn

				If	@cnsctvo_cdgo_imgn	!=	0
					Begin
						Update		tbImagenesxDocumentosDigitalizados
						Set			estdo				=	'I'
						Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
						And			cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn
						And			prncpl				=	'S'

						Set			@lnejccn	=	@cnsctvo_cdgo_dcmnto
					End
				Else
					Begin
						If	Not Exists	(	Select	1
											From	tbImagenesxDocumentosDigitalizados
											Where	Substring(rta_imgn,31,Len(rta_imgn))	=	@cdna_fcha
											--And		cnsctvo_cdgo_dcmnto						=	@cnsctvo_cdgo_dcmnto
										)
					End

				--Drop Table	#tmp1
				--Drop Table	#tmp2
			End
		Else

			Begin
*/
				Declare	@cntdr		Int
				Set		@cntdr		=	@cntdd

				/*
				Select		a.*
				Into		#tmp3
				From		tbImagenesxDocumentosDigitalizados	a
				Where		cnsctvo_cdgo_dcmnto	In	(1804833284,
							1910945045)
				*/

				If	Not Exists	(	Select		1
									From		tbImagenesxDocumentosDigitalizados	a
									Inner Join	#tmp1								b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
									Where		Substring(a.rta_imgn,31,Len(a.rta_imgn))	=	@cdna
								)
					Begin
						Begin Transaction
							Declare			@cnsctvo_cdgo_tpo_dcmntl	Int,
											@nmro_imgns					Int,
											@cnsctvo_prcso_crga			Int,
											@estdo_rgstro				Char(1)

							Select			@cnsctvo_cdgo_dcmnto		=	Max(cnsctvo_cdgo_dcmnto)+1
							From			tbDocumentosDigitalizados

							Set				@cnsctvo_cdgo_tpo_dcmntl	=	1
							Set				@nmro_imgns					=	1
							Set				@cnsctvo_prcso_crga			=	0
							Set				@estdo_rgstro				=	'A'
							
							Insert Into		tbDocumentosDigitalizados
							Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	@nmro_imgns,
												@cnsctvo_cdgo_dgtlzdr,	@fcha_dgtlzcn,				@cnsctvo_prcso_crga,
												@estdo_rgstro
											)

							Insert Into		tbIndicesxDocumentosDigitalizados
							Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	5,
												@nmro_ntfccn
											)

							Insert Into		tbIndicesxDocumentosDigitalizados
							Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	8,
												@nmro_acta
											)

							Insert Into		tbIndicesxDocumentosDigitalizados
							Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	19,
												@cnsctvo_sde
											)

						
							Select			@cnsctvo_cdgo_imgn_nvo		=	Max(cnsctvo_cdgo_imgn)+1
							From			tbImagenesxDocumentosDigitalizados
						
							Insert Into		tbImagenesxDocumentosDigitalizados
							Values			(	@cnsctvo_cdgo_imgn_nvo,		@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_imgn,
												@rta_imgn,					'S',					'A'
											)
							If @@error = 0
								Begin
									Set			@lnejccn	=	0
									Rollback Transaction
								End
							Else
								Begin
									Set			@lnejccn	=	@cnsctvo_cdgo_dcmnto
									Commit Transaction
								End
					End			
				Else
					Begin
						While	@cntdr	!=	1
							Begin
								Select		Top  1 @cnsctvo_cdgo_dcmnto	=	cnsctvo_cdgo_dcmnto
								From		#tmp2
								Where		fcha_dgtlzcn =	(	Select	Min(fcha_dgtlzcn)
																From	#tmp2
															)

								Select		@cnsctvo_cdgo_imgn	=	cnsctvo_cdgo_imgn
								From		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
								Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
								And			(estdo				=	'A'		Or	estdo		Is Null)
								And			prncpl				=	'S'
							
								If	@cnsctvo_cdgo_imgn	!=	0
									Begin
										Update		tbImagenesxDocumentosDigitalizados
										Set			estdo				=	'I'
										Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
										And			cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn
										And			prncpl				=	'S'
										/*										
										Update		#tmp3
										Set			estdo				=	'I'
										Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto
										And			cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn
										And			prncpl				=	'S'
										*/
										Set			@lnejccn	=	@cnsctvo_cdgo_dcmnto
									End
															
								Delete
								From		#tmp2
								Where		cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto

								Select		@cntdr		=	Count(cnsctvo_cdgo_dcmnto)
								From		#tmp2
							End
							--Select	*	From	#tmp3
					End
	
			Drop Table	#tmp1
			Drop Table	#tmp2
			--Drop Table	#tmp3
	End
Else
	Set			@lnejccn	=	1


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDInactivarImagenPrincipalCTC] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDInactivarImagenPrincipalCTC] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDInactivarImagenPrincipalCTC] TO [visosservice_role]
    AS [dbo];

