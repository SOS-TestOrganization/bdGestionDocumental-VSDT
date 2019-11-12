
CREATE Procedure [dbo].[spGDGrabarDocumentosAnexosAT]
--Declare
--@cnsctvo_cdgo_ntfccn	Int,
@cnsctvo_cdgo_ntfccn	Int,
@cnsctvo_cdgo_ofcna		Int,
@rta_dcmnto				Varchar(250),
@opcn_ejccn				Int,
@cnsctvo_dcmnto			Int = Null,
@cnsctvo_cdgo_tpo_imgn	Int,
@nmbre_dcmnto			Varchar(150),
@cnsctvo_cdgo_dcmnto	Int	Output,
@estdo					Int	Output
  
As
Set NoCount On
/*
set @cnsctvo_cdgo_ntfccn	= 640231
set @cnsctvo_cdgo_acta		= 231268
set @cnsctvo_cdgo_ofcna		= 2
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
			@cdgo_ofcna					Varchar(20),
			@cnsctvo_opcn_ejccn			Int
 
  
Set			@cnsctvo_cdgo_dgtlzdr		=	5
Set			@cnsctvo_cdgo_tpo_dcmntl	=	18
Set			@prncpl						=	'S'
Set			@nmro_imgns					=	1
Set			@fcha_crcn					=	GetDate()
Set			@cdgo_ntfccn				=	@cnsctvo_cdgo_ntfccn
--Set			@cdgo_acta					=	@cnsctvo_cdgo_ntfccn
Set			@cdgo_ofcna					=	@cnsctvo_cdgo_ofcna
Set			@cnsctvo_opcn_ejccn			=	1


If	@opcn_ejccn	=	1
	Begin
		If Not Exists	(	Select		1--a.cnsctvo_cdgo_dcmnto
							From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	a
							Inner Join	(	Select		b.cnsctvo_cdgo_dcmnto
											From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	b
											Where		b.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
											And			b.cnsctvo_cdgo_tpo_indce		=	21
											And			b.vlr							=	@cdgo_ofcna
										)	As c	On	c.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
							Where		a.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
							And			a.cnsctvo_cdgo_tpo_indce		=	5
							And			a.vlr							=	@cdgo_ntfccn
						)
			Begin
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
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	21,							@cdgo_ofcna
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
					Declare	@cnsctvo_cdgo_imgn_2	Int

					/*		
					Select  @cnsctvo_cdgo_imgn_2	=	Max(cnsctvo_cdgo_imgn)+1
					From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
					*/

					-- Ajuste siscgm01 2012-07-18
					Set		@cnsctvo_opcn_ejccn = 2
					exec	spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn_2 Output,	@cnsctvo_opcn_ejccn
					-- Ajuste siscgm01 2012-07-18

					Set			@prncpl			=	'N'
					Select		@cnsctvo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
					From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	a
					Inner Join	(	Select		b.cnsctvo_cdgo_dcmnto
									From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	b
									Where		b.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
									And			b.cnsctvo_cdgo_tpo_indce		=	21
									And			b.vlr							=	@cdgo_ofcna
								)	As c	On	c.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
					Where		a.cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
					And			a.cnsctvo_cdgo_tpo_indce		=	5
					And			a.vlr							=	@cdgo_ntfccn
			
					Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn,		rta_imgn,
										prncpl
									)
					Values			(	@cnsctvo_cdgo_imgn_2,	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
										@prncpl
									)

					 -- Insertar índices x imagenes digitalizadas
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
								(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values		(	@cnsctvo_cdgo_imgn_2,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto
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
	End
Else
	Begin
		Begin Transaction
			Declare	@cnsctvo_cdgo_imgn_3	Int

			/*
			Select  @cnsctvo_cdgo_imgn_3	=	Max(cnsctvo_cdgo_imgn)+1
			From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
			*/

			-- Ajuste siscgm01 2012-07-18
			Set		@cnsctvo_opcn_ejccn = 2
			exec	spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn_3 Output,	@cnsctvo_opcn_ejccn
			-- Ajuste siscgm01 2012-07-18

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
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosAT] TO [visosservice_role]
    AS [dbo];

