

/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :			spGDGrabarDocumentosMultiTiff
* Desarrollado por		 :  <\A		Ing. Cesar García																	A\>
* Descripcion			 :  <\D		Graba cada una de las imágenes que divide la librería de romper archivos multi tiff	D\>
* Parametros			 :  <\P																							P\>
* Variables				 :  <\V																							V\>
* Fecha Creacion		 :  <\FC	2011/03/28	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Ing. Cesar García  AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  2010/03/01 FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[spGDGrabarDocumentosMultiTiff]
@indce1						Varchar(50)		= Null,
@indce2						Varchar(50)		= Null,
@indce3						Varchar(50)		= Null,
@indce4						Varchar(50)		= Null,
@indce5						Varchar(50)		= Null,
@indce6						Varchar(50)		= Null,
@indce7						Varchar(50)		= Null,
@indce8						Varchar(50)		= Null,
@indce9						Varchar(50)		= Null,
@indce10					Varchar(50)		= Null,
@rta_dcmnto					Varchar(250)	= Null,
@cnsctvo_cdgo_tpo_imgn		Int,
@nmro_pgna					Int				= Null,
@cnsctvo_cdgo_tpo_dcmnto	Int,
@cnsctvo_cdgo_dgtlzdr		Int,
@cnsctvo_prcso_crga			Int,
@rta_dcmnto_orgnl			Varchar(250)	= Null,
@estdo						Int	Output
  
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
  
Declare		@prncpl						Char(1),
			@nmro_imgns					Int,
			@fcha_crcn					Datetime,
			@estdo_rgstro				Char(1),
			@cnsctvo_cdgo_dcmnto		Int,
			@cnsctvo_cdgo_imgn			Int,
			@cnsctvo_opcn_ejccn			Int

Set			@prncpl						=	'S'
Set			@nmro_imgns					=	1
Set			@fcha_crcn					=	GetDate()
Set			@estdo_rgstro				=	'S'
Set			@cnsctvo_opcn_ejccn			=	1

If	@nmro_pgna	=	1
	Begin
		Begin Tran
			Select	@cnsctvo_cdgo_dcmnto	=	cnsctvo_cdgo_dcmnto
			From	tbImagenesxDocumentosDigitalizados
			Where	rta_imgn		=	@rta_dcmnto_orgnl
			
			Update	tbImagenesxDocumentosDigitalizados
			Set		rta_imgn			=	@rta_dcmnto
			Where	cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto

			Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	51,							@nmro_pgna
							)
		Commit Tran
	End
Else
	Begin
		Begin Transaction
			/*
			Select  @cnsctvo_cdgo_imgn = Max(cnsctvo_cdgo_imgn)+1
			From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
						  
			Select  @cnsctvo_cdgo_dcmnto = Max(cnsctvo_cdgo_dcmnto)+1
			From	bdGestionDocumental.dbo.tbDocumentosDigitalizados
			*/
			
			-- Ajuste siscgm01 2012-07-18
			exec spGDCalcularConsecutivo @cnsctvo_cdgo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn
			-- Ajuste siscgm01 2012-07-18
			   
			Insert Into		bdGestionDocumental.dbo.tbDocumentosDigitalizados
							(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,     cnsctvo_cdgo_dgtlzdr,
								fcha_dgtlzcn,			cnsctvo_prcso_crga,			estdo_rgstro
							)
			Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,   @nmro_imgns,    @cnsctvo_cdgo_dgtlzdr,
								@fcha_crcn,				@cnsctvo_prcso_crga,		@estdo_rgstro
							)
			  
			Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_imgn,
								prncpl
							)
			Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_tpo_imgn,		@rta_dcmnto,
								@prncpl
							)

			/*
			 -- Insertar índices x imagenes digitalizadas
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			Values			(	@cnsctvo_cdgo_imgn,		@cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	22,							@nmbre_dcmnto
							)
			*/

			If	@cnsctvo_cdgo_tpo_dcmnto	=	1   -- CTC
				 Begin
					 -- Insertar índices x documentos digitalizados
					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	5,							@indce1
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	8,							@indce2
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	19,							@indce3
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	51,							@nmro_pgna
									)

					 If @@error != 0
						Begin
							Rollback Transaction
						End
					 Else
						Begin
							Commit Transaction
						End
				End

			If	@cnsctvo_cdgo_tpo_dcmnto	=	4   -- Formularios Afiliación
				 Begin
					 -- Insertar índices x documentos digitalizados
					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	10,							@indce1
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	11,							@indce2
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	7,							@indce3
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	1,							@indce4
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	14,							@indce5
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	16,							@indce6
									)

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	20,							@indce7
									)

					 If @@error != 0
						Begin
							Rollback Transaction
						End
					 Else
						Begin
							Commit Transaction
						End
				End

			
			If	@cnsctvo_cdgo_tpo_dcmnto	=	7	-- Formularios Empleador
					 Begin
						 -- Insertar índices x documentos digitalizados
						Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
										(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
						Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	10,							@indce1
										)

						Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
										(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
						Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	7,							@indce3
										)

						Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
										(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
						Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	1,							@indce4
										)

						Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
										(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
						Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	14,							@indce7
										)

						Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
										(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
						Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	16,							@indce8
										)

						Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
										(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
						Values			(	@cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmnto,	20,							@indce9
										)

						 If @@error != 0
							Begin
								Rollback Transaction
							End
						 Else
							Begin
								Commit Transaction
							End
					End
	End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosMultiTiff] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosMultiTiff] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

