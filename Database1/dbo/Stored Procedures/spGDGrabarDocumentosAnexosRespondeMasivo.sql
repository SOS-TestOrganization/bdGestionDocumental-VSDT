
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Metodo o PRG 	        :   spGDGrabarDocumentosAnexosRespondeMasivo
* Desarrollado por		:  <\A Meissner Hernán Preciado																					A\>
* Descripcion			:  <\D Procedimiento que permite guardar los índices de las imágenes y generar el consecutivo código documento	D\>
						   <\D Masivamente																								D\>
* Observaciones			:  <\O	O\>
* Parametros			:  <\P	P\>
*						:  <\P @cdgo_cntcto,	@fcha_rdccn_dcmnto,	@nmro_rdccn_dcmnto,	@nmro_unco_idntfccn,@fcha_ingrso_cntcto			P\>
*						   <\P @opcn_ejccn, @orgn_dcmnto,@nmro_unco_idntfccn_ctznte,@estdo												P\>
* Variables				:  <\V V\>
* Fecha Creacion		 :  <\FC  2017/06/27																							FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION   
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM		Meissner Hernán Preciado																AM\> 
* Descripcion			 : <\DM		Optimización de código , se quitan ciclos y se optimiza el cálculo de los consecutivos	DM\>
* Nuevos Parametros	 	 : <\PM																								PM\>
* Nuevas Variables		 : <\VM																								VM\>
* Fecha Modificacion	 : <\FM		2017/07/31																				FM\>
*---------------------------------------------------------------------------------*/

CREATE Procedure [dbo].[spGDGrabarDocumentosAnexosRespondeMasivo]
--declare

@cdgo_cntcto				Varchar(20),
@fcha_rdccn_dcmnto			Varchar(30),
@nmro_rdccn_dcmnto			Varchar(50),
@nmro_unco_idntfccn			Int,
@fcha_ingrso_cntcto			Datetime,
@opcn_ejccn					Int,
@orgn_dcmnto				Varchar(20),
@nmro_unco_idntfccn_ctznte	Int = null,
@estdo						Int output

As
Set NoCount On


Declare		@cnsctvo_cdgo_tpo_dcmntl	Int,
			@cnsctvo_cdgo_dgtlzdr		Int,
			@prncpl						Char(1),
			@nmro_imgns					Int,
			@fcha_crcn					Datetime,
			@cnsctvo_opcn_ejccn			Int,
			@cnsctvo_dcmnto				Int,
			@cnsctvo_cdgo_imgn			int,
			@ttl_rgstrs					Int,
			@cntdr						Int,
			@cnsctvo_archvo1			Int

Set			@ttl_rgstrs					=	0			
Set			@cnsctvo_cdgo_dgtlzdr		=	5
Set			@cnsctvo_cdgo_tpo_dcmntl	=	21
Set			@prncpl						=	'S'
Set			@nmro_imgns					=	1
Set			@fcha_crcn					=	GetDate()
Set			@cnsctvo_opcn_ejccn			=	1
Set			@cntdr						=	1			-- Contador Comienza con primer registro
Set			@cnsctvo_archvo1			=	0


--creo tabla temporal que llevará los registros que trae del cursor
create table #tmpListaImagenes
(
cnsctvo_itm int identity(1,1),
item int,
rta_dcmnto Varchar(250),
cnsctvo_cdgo_tpo_imgn		Int,
nmbre_dcmnto_orgnl Varchar(250),
extnsn Char(10),
rta varchar(250),
nmbre_archvo varchar(100),
nmbre varchar(100),
rta_dcmnto_fnl Varchar(250),
cnsctvo_archvo int,
cnsctvo_cdgo_dcmnto Int,
cnsctvo_archvo_dcmnto Int,
cnsctvo_archvo_dcmnto_bd Int
)

insert into #tmpListaImagenes (
item,
rta_dcmnto,
cnsctvo_cdgo_tpo_imgn,
nmbre_dcmnto_orgnl,
extnsn,
rta,
nmbre_archvo,
nmbre,
rta_dcmnto_fnl,
cnsctvo_archvo,
cnsctvo_cdgo_dcmnto,
cnsctvo_archvo_dcmnto,
cnsctvo_archvo_dcmnto_bd
)
select 
item,
ltrim(rtrim(rutaFinalGrabar)),
tpo_imgn,
ltrim(rtrim(pcRuta)),
ltrim(rtrim(pcExtension)),
ltrim(rtrim(rta)),
ltrim(rtrim(nmbre_archvo)),
ltrim(rtrim(nmbre)),
'',
0,
0,
0,
0
from #tmpListadoAdjuntos


alter table #tmpListaImagenes add cnsctvo_cdgo_imgn int


-- calculo cantidad de registros que tiene la tabla  #tmpListadoAdjuntos
select	@ttl_rgstrs = count(*)
from	#tmpListaImagenes


If	@opcn_ejccn	=	1
	Begin
		If Not Exists	(	Select		1
							From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							Where		cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
							And			cnsctvo_cdgo_tpo_indce		=	24
							And			vlr							=	@cdgo_cntcto
						)
			Begin
				Begin Transaction


					-- Se separan los consecutivos dependiendo de la cantidad de registros que vienen en la tabla temporal
					begin tran
					Set Transaction Isolation Level SERIALIZABLE;

					select	@cnsctvo_dcmnto				=	cnsctvo_cdgo_dcmnto,
							@cnsctvo_cdgo_imgn			=	cnsctvo_cdgo_imgn 
					from	BDGestionDocumental.dbo.tbInformacionConsecutivo

					Update		BDGestionDocumental.dbo.tbInformacionConsecutivo With(Rowlock) /* Bloqueo del registro para que no se consulte hasta terminar el update */
					Set			cnsctvo_cdgo_dcmnto	=	 Case When @cnsctvo_opcn_ejccn in(1,3) Then (cnsctvo_cdgo_dcmnto + @ttl_rgstrs) Else cnsctvo_cdgo_dcmnto End,
								cnsctvo_cdgo_imgn	=	 Case When @cnsctvo_opcn_ejccn in(1,2) Then (cnsctvo_cdgo_imgn   + @ttl_rgstrs) Else cnsctvo_cdgo_imgn   End

					commit tran

					-- actualizo los consecutivos separados en la tabla temporal				
					update	a
					set		cnsctvo_cdgo_dcmnto	=	@cnsctvo_dcmnto		+ cnsctvo_itm,
							cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn	+ cnsctvo_itm
					from	#tmpListaImagenes	as a

					-- actualizo el id del nombre del archivo
					update	a
					set		rta_dcmnto_fnl	=	ltrim(rtrim(rta_dcmnto))+ltrim(rtrim(Convert(Varchar(3),@cnsctvo_archvo1+cnsctvo_itm)))+Lower(extnsn)
					from	#tmpListaImagenes	as	a
					
					-- actualizo el id
					update	a
					set		cnsctvo_archvo	=	@cnsctvo_archvo1 + cnsctvo_itm
					from	#tmpListaImagenes	as	a
												
																		
					Insert Into		bdGestionDocumental.dbo.tbDocumentosDigitalizados
									(	
									cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,     cnsctvo_cdgo_dgtlzdr,
									fcha_dgtlzcn
									)
					select			cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	@nmro_imgns,	@cnsctvo_cdgo_dgtlzdr,
									@fcha_crcn
					from			#tmpListaImagenes							
	
	
					Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
									(	
									cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_imgn,
									prncpl
									)
					select			cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_dcmnto_fnl,
									@prncpl
					from			#tmpListaImagenes
						
							
					  
					 -- Insertar índices x documentos digitalizadas

					
					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	22,							nmbre
					from			#tmpListaImagenes
									

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	23,							@fcha_rdccn_dcmnto
					from			#tmpListaImagenes							


					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	24,							@cdgo_cntcto
					from			#tmpListaImagenes
									

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	25,							@nmro_unco_idntfccn
					from			#tmpListaImagenes									

										  
					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	26,							@fcha_ingrso_cntcto
					from			#tmpListaImagenes
									
					
					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	29,							@nmro_rdccn_dcmnto
					from			#tmpListaImagenes


										
					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	30,							@orgn_dcmnto
					from			#tmpListaImagenes
									

					Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
									(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	34,							@nmro_unco_idntfccn_ctznte
					from			#tmpListaImagenes

													
					-- Insertar índices x imágenes digitalizados
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					select				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	32,							Convert(Varchar(3),cnsctvo_archvo)
					from			#tmpListaImagenes
					
					 -- Insertar índices x imágenes digitalizados
					Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
									(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
					select				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	33,							nmbre_dcmnto_orgnl
					from			#tmpListaImagenes
									

					 
					 If @@error != 0
						Begin
							
							Rollback Transaction
						End
					 Else
						Begin
							
							Commit Transaction
						End

								select 
								item,
								cnsctvo_cdgo_tpo_imgn,
								nmbre_dcmnto_orgnl,
								rta_dcmnto_fnl,
								nmbre,
								cnsctvo_archvo,
								cnsctvo_cdgo_dcmnto,
								cnsctvo_archvo_dcmnto,
								cnsctvo_archvo_dcmnto_bd
								from #tmpListaImagenes

			End --> end if no exists


		Else
			Begin
				If	Exists	(	Select		1
								From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
								Where		cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
								And			cnsctvo_cdgo_tpo_indce		=	29
								And			vlr							=	@nmro_rdccn_dcmnto
							)
					Begin
						Set	@estdo	=	2
					End
				Else
					Begin
						Begin Transaction
							
							declare		@cnsctvo_cdgo_dcmnto_actl		Int
								
							--meiss												
							set @cnsctvo_archvo1 = 0

							-- Calculamos el ultimo consecutivo documento para el código del contacto
							Select		@cnsctvo_cdgo_dcmnto_actl	=	Max(cnsctvo_cdgo_dcmnto)
							From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
							Where		cnsctvo_cdgo_tpo_dcmntl		=	@cnsctvo_cdgo_tpo_dcmntl
							And			cnsctvo_cdgo_tpo_indce		=	24
							And			vlr							=	@cdgo_cntcto

							-- Calculamos el último consecutivo archivo para el documento
							Select	@cnsctvo_archvo1	=	IsNull(Max(Convert(Int,vlr)),0)--+1
							From	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							Where	cnsctvo_cdgo_dcmnto	=	@cnsctvo_cdgo_dcmnto_actl
							And		cnsctvo_cdgo_tpo_indce	=	32


							-- Se separan los consecutivos dependiendo de la cantidad de registros que vienen en la tabla temporal
							begin tran
							Set Transaction Isolation Level SERIALIZABLE;

							select	@cnsctvo_dcmnto				=	cnsctvo_cdgo_dcmnto,
									@cnsctvo_cdgo_imgn			=	cnsctvo_cdgo_imgn 
							from	BDGestionDocumental.dbo.tbInformacionConsecutivo

							Update		BDGestionDocumental.dbo.tbInformacionConsecutivo With(Rowlock) /* Bloqueo del registro para que no se consulte hasta terminar el update */
							Set			cnsctvo_cdgo_dcmnto	=	 Case When @cnsctvo_opcn_ejccn in(1,3) Then (cnsctvo_cdgo_dcmnto + @ttl_rgstrs) Else cnsctvo_cdgo_dcmnto End,
										cnsctvo_cdgo_imgn	=	 Case When @cnsctvo_opcn_ejccn in(1,2) Then (cnsctvo_cdgo_imgn   + @ttl_rgstrs) Else cnsctvo_cdgo_imgn   End

							commit tran


							-- actualizo los consecutivos separados en la tabla temporal				
							update	a
							set		cnsctvo_cdgo_dcmnto	=	@cnsctvo_dcmnto		+ cnsctvo_itm,
									cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn	+ cnsctvo_itm
							from	#tmpListaImagenes	as a

							-- actualizo el id del nombre del archivo
							update	a
							set		rta_dcmnto_fnl	=	ltrim(rtrim(rta_dcmnto))+ltrim(rtrim(Convert(Varchar(3),@cnsctvo_archvo1+cnsctvo_itm)))+Lower(extnsn)
							from	#tmpListaImagenes	as	a
					
							-- actualizo el id
							update	a
							set		cnsctvo_archvo	=	@cnsctvo_archvo1 + cnsctvo_itm
							from	#tmpListaImagenes	as	a


												 
							Insert Into		bdGestionDocumental.dbo.tbDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,     cnsctvo_cdgo_dgtlzdr,
												fcha_dgtlzcn
											)
							select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,   @nmro_imgns,    @cnsctvo_cdgo_dgtlzdr,
												@fcha_crcn
							from			#tmpListaImagenes		
											
							  
							Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
											(	cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_imgn,
												prncpl
											)
							select				cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		rta_dcmnto_fnl,
												@prncpl
							from			#tmpListaImagenes


							  
							 -- Insertar índices x documentos digitalizadas
							Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	22,							nmbre
							from			#tmpListaImagenes
											
							
							Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	23,							@fcha_rdccn_dcmnto
							from			#tmpListaImagenes
											

							Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	24,							@cdgo_cntcto
							from			#tmpListaImagenes				

							  
							Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	25,							@nmro_unco_idntfccn
							from			#tmpListaImagenes
											
							  
							Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	26,							@fcha_ingrso_cntcto
							from			#tmpListaImagenes
											

							Insert			Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	29,							@nmro_rdccn_dcmnto
							from			#tmpListaImagenes

					
							Insert			Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	30,							@orgn_dcmnto
							from			#tmpListaImagenes				


							Insert			Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
											(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							select				cnsctvo_cdgo_dcmnto,	@cnsctvo_cdgo_tpo_dcmntl,	34,							@nmro_unco_idntfccn_ctznte
							from			#tmpListaImagenes
											

							-- Insertar índices x imágenes digitalizados
							Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
											(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							select				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	32,							Convert(Varchar(3),cnsctvo_archvo)
							from			#tmpListaImagenes
											

							 -- Insertar índices x imágenes digitalizados
							Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
											(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
							select				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	33,							nmbre_dcmnto_orgnl
							from			#tmpListaImagenes
											

							 
							 If @@error != 0
								Begin
									
									Rollback Transaction
								End
							 Else
								Begin
									
									Commit Transaction
								End

								select 
								item,
								cnsctvo_cdgo_tpo_imgn,
								nmbre_dcmnto_orgnl,
								rta_dcmnto_fnl,
								nmbre,
								cnsctvo_archvo,
								cnsctvo_cdgo_dcmnto,
								cnsctvo_archvo_dcmnto,
								cnsctvo_archvo_dcmnto_bd
								from #tmpListaImagenes
					End
			End
	End
Else
	Begin
		Begin Transaction

			
			--Declare	@cnsctvo_cdgo_imgn_2	Int
			Set		@cnsctvo_opcn_ejccn	=	2
			Set		@cnsctvo_archvo1	=	0
			

			-- Se separan los consecutivos dependiendo de la cantidad de registros que vienen en la tabla temporal
			begin tran
			Set Transaction Isolation Level SERIALIZABLE;

					select	@cnsctvo_dcmnto				=	cnsctvo_cdgo_dcmnto,
							@cnsctvo_cdgo_imgn			=	cnsctvo_cdgo_imgn 
					from	BDGestionDocumental.dbo.tbInformacionConsecutivo

					Update		BDGestionDocumental.dbo.tbInformacionConsecutivo With(Rowlock) /* Bloqueo del registro para que no se consulte hasta terminar el update */
					Set			cnsctvo_cdgo_dcmnto	=	 Case When @cnsctvo_opcn_ejccn in(1,3) Then (cnsctvo_cdgo_dcmnto + @ttl_rgstrs) Else cnsctvo_cdgo_dcmnto End,
								cnsctvo_cdgo_imgn	=	 Case When @cnsctvo_opcn_ejccn in(1,2) Then (cnsctvo_cdgo_imgn   + @ttl_rgstrs) Else cnsctvo_cdgo_imgn   End

			commit tran

			-- revisar este 

			-- Calculamos el último consecutivo archivo para el documento
			Select	@cnsctvo_archvo1	=	IsNull(Max(Convert(Int,vlr)),0)+1
			From	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
			Where	cnsctvo_cdgo_dcmnto	=	@cnsctvo_dcmnto
			And		cnsctvo_cdgo_tpo_indce	=	32

			-- hasta acá

			-- Actualizamos los consecutivos y las rutas en la tabla temporal
			While	@cntdr <=	@ttl_rgstrs
					begin
									update	a
									set		cnsctvo_cdgo_dcmnto	=	@cnsctvo_dcmnto		+ 1,
											cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn	+ 1
									from	#tmpListaImagenes	as a
									where	cnsctvo_itm = @cntdr

									update	a
									set		rta_dcmnto_fnl	=	ltrim(rtrim(rta_dcmnto))+ltrim(rtrim(Convert(Varchar(3),@cnsctvo_archvo1)))+Lower(extnsn)
									from	#tmpListaImagenes	as	a
									where	cnsctvo_itm = @cntdr

									update	a
									set		cnsctvo_archvo	=	@cnsctvo_archvo1
									from	#tmpListaImagenes	as	a
									where	cnsctvo_itm = @cntdr

									set @cnsctvo_archvo1 = @cnsctvo_archvo1 + 1

								Set	@cntdr	=	@cntdr + 1
			End--While


			-- Ajuste siscgm01 2012-07-18
			--exec spGDCalcularConsecutivo @cnsctvo_dcmnto, @cnsctvo_cdgo_imgn_2 Output,	@cnsctvo_opcn_ejccn
			-- Ajuste siscgm01 2012-07-18
			
			--Set		@rta_dcmnto			=	@rta_dcmnto+(Convert(Varchar(3),@cnsctvo_archvo))+Lower(@extnsn)
			

					
			Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,			rta_imgn,
								prncpl
							)
			select				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_imgn,			rta_dcmnto_fnl,
								@prncpl
			from			#tmpListaImagenes
							

			-- Insertar índices x imágenes digitalizados
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			select				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	32,							Convert(Varchar(3),cnsctvo_archvo)
			from			#tmpListaImagenes
							
			 -- Insertar índices x imágenes digitalizados
			Insert Into		bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
							(	cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl,	cnsctvo_cdgo_tpo_indce,		vlr	)
			select				cnsctvo_cdgo_imgn,		cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	33,							nmbre_dcmnto_orgnl
			from			#tmpListaImagenes
							
		
			 If @@error != 0
				Begin
					
					Rollback Transaction
				End
			 Else
				Begin
					
					Commit Transaction
				End

				select 
				item,
				cnsctvo_cdgo_tpo_imgn,
				nmbre_dcmnto_orgnl,
				rta_dcmnto_fnl,
				nmbre,
				cnsctvo_archvo,
				cnsctvo_cdgo_dcmnto,
				cnsctvo_archvo_dcmnto,
				cnsctvo_archvo_dcmnto_bd
				from #tmpListaImagenes

	End


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [900005 Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [Consultor Salud Privilegiado]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexosRespondeMasivo] TO [visosservice_role]
    AS [dbo];

