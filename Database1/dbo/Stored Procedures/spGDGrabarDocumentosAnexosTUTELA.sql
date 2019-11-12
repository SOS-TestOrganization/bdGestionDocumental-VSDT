/*----------------------------------------------------------------------------------------------------------------- 
* Procedimiento		: [spGDGrabarDocumentosAnexosTUTELA]
* Desarrollado por	: <\A  	A\> 
* Descripción		: <\D Guarda el Documento Anexado en la Base de datos de Gestion Documental		D\> 
* Observaciones		: <\O        					O\>        
* Parámetros		: <\P           				P\>        
* Variables 		: <\V           				V\>        
* Fecha Creación	: <\FC 		FC\>        
*        
*------------------------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION         
*------------------------------------------------------------------------------------------------------------------
* Modificado Por	: <\AM Andres taborda  AM\>        
* Descripción		: <\DM  El procedimiento no tiene documentacion de creacion del autor.
							Devuelve el consecutivo del documento digitalizado(@cnsctvo_cdgo_imgn_out)
							El cual se requiere para liberar documento digitalizado en caso que no se pueda copiar
							el ARCHIVO al servidor atlas.
						 DM\>        
* Nuevos Parámetros	: <\PM  PM\>        
* Nuevas Variables	: <\VM  VM\>        
* Fecha Modificación	: <\FM 20130829 FM\>     
*------------------------------------------------------------------------------------------------------------------
*/
CREATE Procedure [dbo].[spGDGrabarDocumentosAnexosTUTELA]
@cnsctvo_cdgo_ntfccn	Int,
@cnsctvo_cdgo_ofcna		Int,
@nmro_fllo				Varchar(50)	=	Null,
@rta_dcmnto				Varchar(250),
@opcn_ejccn				Int,
@cnsctvo_dcmnto			Int = Null,
@cnsctvo_cdgo_tpo_imgn	Int,
@nmbre_dcmnto			Varchar(150),
--@extnsn					Char(4),
@extnsn					varChar(5),
@pntlla_grbr			Int,
@cnsctvo_cdgo_dcmnto	Int	Output,
@estdo					Int	Output,
@cnsctvo_archvo			Int Output,
@cnsctvo_cdgo_imgn_out	Int output
 
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
  
Declare		@cnsctvo_cdgo_tpo_dcmntl		Int,
			@cnsctvo_cdgo_dgtlzdr			Int,
			@prncpl							Char(1),
			@nmro_imgns						Int,
			@fcha_crcn						Datetime,
			@cdgo_ntfccn					Varchar(20),
			@cdgo_ofcna						Varchar(20),
			@cnsctvo_cdgo_tpo_indce_imgn	Int,
			@cnsctvo_opcn_ejccn				Int,
			@usro_crcn				udtUsuario
 
  
Set			@cnsctvo_cdgo_dgtlzdr		=	5
Set			@cnsctvo_cdgo_tpo_dcmntl	=	3
Set			@prncpl						=	'S'
Set			@nmro_imgns					=	1
Set			@fcha_crcn					=	GetDate()
Set			@cdgo_ntfccn				=	@cnsctvo_cdgo_ntfccn
Set			@cdgo_ofcna					=	@cnsctvo_cdgo_ofcna
Set			@cnsctvo_opcn_ejccn			=	1

set  @usro_crcn     = Substring(System_User,CharIndex('\',System_User) + 1,Len(System_User))

--alter table tbImagenesxDocumentosDigitalizados add usro_crcn udtusuario Null
--Select * from tbImagenesxDocumentosDigitalizados where usro_crcn is not null

If	@pntlla_grbr	=	2
	Set	@cnsctvo_cdgo_tpo_indce_imgn	=	38
Else
	If	@pntlla_grbr	=	3
		Set	@cnsctvo_cdgo_tpo_indce_imgn	=	36
	Else
		Set	@cnsctvo_cdgo_tpo_indce_imgn	=	0


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
					Declare	@cnsctvo_cdgo_imgn			Int
					
					/*		  
					Select  @cnsctvo_dcmnto = Max(cnsctvo_cdgo_dcmnto)+1
					From	bdGestionDocumental.dbo.tbDocumentosDigitalizados

					Select  @cnsctvo_cdgo_imgn = Max(cnsctvo_cdgo_imgn)+1
					From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
					*/

					-- Ajuste siscgm01 2012-07-17
					exec spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn
					-- Ajuste siscgm01 2012-07-17

					Set		@cnsctvo_archvo		=	1
					Set		@rta_dcmnto			=	@rta_dcmnto+Convert(Varchar(3),@cnsctvo_archvo)+@extnsn
					
					   
					Insert Into		bdGestionDocumental.dbo.tbDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,     cnsctvo_cdgo_dgtlzdr,
										fcha_dgtlzcn
									)
					Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,   @nmro_imgns,    @cnsctvo_cdgo_dgtlzdr,
										@fcha_crcn
									)
					  
					Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_imgn,
										prncpl,usro_crcn
									)
					Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
										@prncpl,				@usro_crcn
									)

					 -- Insertar índices x imágenes digitalizados
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	39,							Convert(Varchar(3),@cnsctvo_archvo)
									)

					 -- Insertar índices x imagenes digitalizadas
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto
									)

					 -- Insertar índices x imagenes digitalizadas
					If	@pntlla_grbr	=	2	Or	@pntlla_grbr	=	3
						Begin
							Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
											(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,			vlr
											)
							Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	@cnsctvo_cdgo_tpo_indce_imgn,	@nmro_fllo
											)
						End


					 -- Insertar índices x imagenes digitalizadas
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	37,							@pntlla_grbr
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
					Declare	@cnsctvo_cdgo_imgn_2			Int,
							@cnsctvo_cdgo_dcmnto_actl		Int

					/*
					Select  @cnsctvo_cdgo_imgn_2	=	Max(cnsctvo_cdgo_imgn)+1
					From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
					*/

					-- Ajuste siscgm01 2012-07-18
					Set		@cnsctvo_opcn_ejccn = 2
					exec	spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn_2 Output,	@cnsctvo_opcn_ejccn
					
					--ajuste sisatv01 Se requiere que devuelva el consecutivo imagen para borrar la imagen 20130829
					set @cnsctvo_cdgo_imgn_out = @cnsctvo_cdgo_imgn_2		


					-- Ajuste siscgm01 2012-07-18
					-- Calculamos el ultimo consecutivo documento para el código del contacto
					Select		@cnsctvo_cdgo_dcmnto_actl	=	Max(a.cnsctvo_cdgo_dcmnto)
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


					-- Calculamos el ultimo consecutivo archivo para el documento
					Select	@cnsctvo_archvo	=	Max(Convert(Int,vlr))+1
					From	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
					Where	cnsctvo_cdgo_dcmnto		=	@cnsctvo_cdgo_dcmnto_actl
					And		cnsctvo_cdgo_tpo_indce	=	39


					--ajuste identificado en el cual no hay un consecutivo valido 20130903
												
					if @cnsctvo_archvo is null
					begin
						set @cnsctvo_archvo = 1
					End
					

					Set		@rta_dcmnto			=	@rta_dcmnto+(Convert(Varchar(3),@cnsctvo_archvo))+@extnsn
					Set		@prncpl			=	'N'
					
					/*
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
					*/
					Set		@cnsctvo_dcmnto	=	@cnsctvo_cdgo_dcmnto_actl
					Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn,		rta_imgn,
										prncpl,					usro_crcn
									)
					Values			(	@cnsctvo_cdgo_imgn_2,	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
										@prncpl,				@usro_crcn
									)

					 -- Insertar índices x imágenes digitalizados
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_imgn_2,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	39,							Convert(Varchar(3),@cnsctvo_archvo)
									)

					 -- Insertar índices x imagenes digitalizadas
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
								(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values		(	@cnsctvo_cdgo_imgn_2,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto
								)

					 -- Insertar índices x imagenes digitalizadas
					If	@pntlla_grbr	=	2	Or	@pntlla_grbr	=	3
						Begin
							Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
											(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,			vlr
											)
							Values			(	@cnsctvo_cdgo_imgn_2,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	@cnsctvo_cdgo_tpo_indce_imgn,	@nmro_fllo
											)
						End


					 -- Insertar índices x imagenes digitalizadas
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_imgn_2,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	37,							@pntlla_grbr
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

			--ajuste sisatv01 Se requiere que devuelva el consecutivo imagen para borrar la imagen 20130829
			set @cnsctvo_cdgo_imgn_out = @cnsctvo_cdgo_imgn_3

			-- Ajuste siscgm01 2012-07-18
			-- Calculamos el ultimo consecutivo archivo para el documento
			Select	@cnsctvo_archvo	=	Max(Convert(Int,vlr))+1
			From	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
			Where	cnsctvo_cdgo_dcmnto		=	@cnsctvo_dcmnto
			And		cnsctvo_cdgo_tpo_indce	=	39

			Set		@rta_dcmnto			=	@rta_dcmnto+(Convert(Varchar(3),@cnsctvo_archvo))+@extnsn
			Set		@prncpl				=	'N'

			Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn,		rta_imgn,
								prncpl,					usro_crcn
							)
			Values			(	@cnsctvo_cdgo_imgn_3,	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
								@prncpl, @usro_crcn
							)

			-- Insertar índices x imágenes digitalizados
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn_3,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	39,							Convert(Varchar(3),@cnsctvo_archvo)
							)

			 -- Insertar índices x imagenes digitalizadas
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn_3,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto
							)

			 -- Insertar índices x imagenes digitalizadas
			If	@pntlla_grbr	=	2	Or	@pntlla_grbr	=	3
						Begin
							Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
											(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,			vlr
											)
							Values			(	@cnsctvo_cdgo_imgn_3,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	@cnsctvo_cdgo_tpo_indce_imgn,	@nmro_fllo
											)
						End


			 -- Insertar índices x imagenes digitalizadas
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn_3,	@cnsctvo_dcmnto,			@cnsctvo_cdgo_tpo_dcmntl,	37,							@pntlla_grbr
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
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosTUTELA] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosTUTELA] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosTUTELA] TO [Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosTUTELA] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosTUTELA] TO [Coordinador Juridico Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosTUTELA] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosTUTELA] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosTUTELA] TO [visosservice_role]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosTUTELA] TO [Auditor Autorizador CNA]
    AS [dbo];

