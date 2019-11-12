
CREATE Procedure [dbo].[spGDGrabarDocumentosAnexosCTC]
--Declare
@cnsctvo_cdgo_ntfccn	Int,
@cnsctvo_cdgo_acta		Int,
@cnsctvo_cdgo_sde		Int,
@rta_dcmnto				Varchar(250),
@opcn_ejccn				Int,
@cnsctvo_dcmnto			Int = Null,
@cnsctvo_cdgo_tpo_imgn	Int,
@nmbre_dcmnto			Varchar(150),
@nmro_pgna				Varchar(3),
@cnsctvo_cdgo_dcmnto	Int	Output,
@estdo					Int	Output
  
As
Set NoCount On
/*
set @cnsctvo_cdgo_ntfccn	= 640231
set @cnsctvo_cdgo_acta		= 231268
set @cnsctvo_cdgo_sde		= 2
set @rta_dcmnto				= '\\sis08sal\Compartido\CTC\2009\08\26\ANEXOPRUEBA.TXT'
set @opcn_ejccn				= 1
set @cnsctvo_dcmnto			= null
set @cnsctvo_cdgo_tpo_imgn	= 143
set @nmbre_dcmnto			= 'prueba ajuste'
set @cnsctvo_cdgo_dcmnto	= 0
set @estdo					= 0
*/


  
Declare		@cnsctvo_cdgo_tpo_dcmntl	Int,
			@cnsctvo_cdgo_dgtlzdr		Int,
			@prncpl						Char(1),
			@nmro_imgns					Int,
			@fcha_crcn					Datetime,
			@cdgo_ntfccn				Varchar(20),
			@cdgo_acta					Varchar(20),
			@cdgo_sde					Varchar(20),
			@cnsctvo_opcn_ejccn			Int
 
  
Set			@cnsctvo_cdgo_dgtlzdr		=	5
Set			@cnsctvo_cdgo_tpo_dcmntl	=	1
Set			@prncpl						=	'S'
Set			@nmro_imgns					=	1
Set			@fcha_crcn					=	GetDate()
Set			@cdgo_ntfccn				=	@cnsctvo_cdgo_ntfccn
Set			@cdgo_acta					=	@cnsctvo_cdgo_acta
Set			@cdgo_sde					=	@cnsctvo_cdgo_sde
Set			@cnsctvo_opcn_ejccn			=	1


If	@opcn_ejccn	=	1
	Begin
		Select Distinct	a.cnsctvo_cdgo_dcmnto
		Into			#tmpdocumentos
		From			bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	a
		Inner Join	(	Select		b.cnsctvo_cdgo_dcmnto
						From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	b
						Where		b.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
						And			b.cnsctvo_cdgo_tpo_indce		=	19
						And			b.vlr							=	@cdgo_sde
					)	As c	On	c.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
		Inner Join	(	Select		d.cnsctvo_cdgo_dcmnto
						From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	d
						Where		d.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
						And			d.cnsctvo_cdgo_tpo_indce		=	8
						And			d.vlr							=	@cdgo_acta
					)	As e	On	e.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
		Inner Join	(	Select		f.cnsctvo_cdgo_dcmnto
						From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	f
						Where		f.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
						And			f.cnsctvo_cdgo_tpo_indce		=	51
						And			f.vlr							=	@nmro_pgna Or @nmro_pgna Is Null
					)	As g	On	g.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
		Where		a.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
		And			a.cnsctvo_cdgo_tpo_indce		=	5
		And			a.vlr							=	@cdgo_ntfccn

		If	@@rowcount > 0
			Begin
				Select		a.cnsctvo_cdgo_dcmnto,	a.cnsctvo_cdgo_imgn
				Into		#tmpDocumentosEliminados
				From		tbImagenesxDocumentosDigitalizados	a
				Inner Join	#tmpdocumentos						b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
				Inner Join	tbDocumentosDigitalizados			c	On	c.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
				Where		a.cnsctvo_cdgo_tpo_imgn	=	135
				And			c.cnsctvo_cdgo_dgtlzdr	=	5

				If	@@rowcount > 0
					Begin
						Delete
						From		tbIndicesxDocumentosdigitalizados
						From		tbIndicesxDocumentosdigitalizados	a
						Inner Join	#tmpDocumentosEliminados			b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
					
						Delete
						From		tbIndicesxImagenesDigitalizadas
						From		tbIndicesxImagenesDigitalizadas		a
						Inner Join	#tmpDocumentosEliminados			b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
																			And	b.cnsctvo_cdgo_imgn		=	a.cnsctvo_cdgo_imgn	

						Delete
						From		tbImagenesxDocumentosDigitalizados
						From		tbImagenesxDocumentosdigitalizados	a
						Inner Join	#tmpDocumentosEliminados			b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
																			And	b.cnsctvo_cdgo_imgn		=	a.cnsctvo_cdgo_imgn	

						Delete
						From		tbDocumentosDigitalizados
						From		tbDocumentosDigitalizados			a
						Inner Join	#tmpDocumentosEliminados			b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto

						--Drop Table	#tmpDocumentosEliminados
					End
				Drop Table	#tmpDocumentosEliminados
			End

		Drop Table	#tmpdocumentos

		Begin Transaction
			Declare	--@cnsctvo_dcmnto				Int,
					@cnsctvo_cdgo_imgn			Int
		
			/*				  
			Select  @cnsctvo_dcmnto = Max(cnsctvo_cdgo_dcmnto)+1
			From	bdGestionDocumental.dbo.tbDocumentosDigitalizados

			Select  @cnsctvo_cdgo_imgn = Max(cnsctvo_cdgo_imgn)+1
			From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
			*/

			-- Ajuste siscgm01 2012-07-18
			exec spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn
			  -- Ajuste siscgm01 2012-07-18

			Insert Into		bdGestionDocumental.dbo.tbDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,     cnsctvo_cdgo_dgtlzdr,
								fcha_dgtlzcn
							)
			Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,   @nmro_imgns,    @cnsctvo_cdgo_dgtlzdr,
								@fcha_crcn
							)
			  
			Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_imgn,
								prncpl
							)
			Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
								@prncpl
							)

			 -- Insertar índices x imagenes digitalizadas
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto
							)
			  
			 -- Insertar índices x documentos digitalizadas
			Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	5,							@cdgo_ntfccn
							)

			Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	8,							@cdgo_acta
							)

			Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	19,							@cdgo_sde
							)

			Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	51,							@nmro_pgna
							)
			 
			 
			 If @@error != 0
				Begin
					Set @cnsctvo_cdgo_dcmnto = 0
					Rollback Transaction
				End
			 Else
				Begin
					Set @cnsctvo_cdgo_dcmnto = @cnsctvo_dcmnto
					Commit Transaction
				End
	End
Else
	Begin
		Begin Transaction
			/* Se actualiza para buscar el numero de documento 2011/11/26 */															
			If 	(@cnsctvo_dcmnto=0 Or @cnsctvo_dcmnto is null)						
				Begin
					Select		@cnsctvo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
					From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	a
					Inner Join	(	Select		b.cnsctvo_cdgo_dcmnto
									From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	b
									Where		b.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
									And			b.cnsctvo_cdgo_tpo_indce		=	19
									And			b.vlr							=	@cdgo_sde
								)	As c	On	c.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
					Inner Join	(	Select		d.cnsctvo_cdgo_dcmnto
									From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	d
									Where		d.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
									And			d.cnsctvo_cdgo_tpo_indce		=	8
									And			d.vlr							=	@cdgo_acta
								)	As e	On	e.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
					Where		a.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
					And			a.cnsctvo_cdgo_tpo_indce		=	5
					And			a.vlr							=	@cdgo_ntfccn

					If (@@Error!=0)
						Begin
							Set @cnsctvo_cdgo_dcmnto = 0
							Rollback Transaction
							return -1
						End
				End

			Declare	@cnsctvo_cdgo_imgn_3	Int
			/*
			Select  @cnsctvo_cdgo_imgn_3	=	Max(cnsctvo_cdgo_imgn)+1
			From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
			*/
			Set		@cnsctvo_opcn_ejccn = 2
			exec	spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn_3 Output,	@cnsctvo_opcn_ejccn	
			
			Set			@prncpl						=	'N'

			Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn,		rta_imgn,
								prncpl
							)
			Values			(	@cnsctvo_cdgo_imgn_3,	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
								@prncpl
							)

			 -- Insertar índices x imagenes digitalizadas
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn_3,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto
							)

		
			 If @@error != 0
				Begin
					Set @cnsctvo_cdgo_dcmnto = 0
					Rollback Transaction
				End
			 Else
				Begin
					Set @cnsctvo_cdgo_dcmnto = @cnsctvo_dcmnto
					Commit Transaction
				End
	End


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosCTC] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosCTC] TO [310009 Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosCTC] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosCTC] TO [310004 Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosCTC] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosCTC] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosCTC] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosCTC] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosCTC] TO [visosservice_role]
    AS [dbo];

