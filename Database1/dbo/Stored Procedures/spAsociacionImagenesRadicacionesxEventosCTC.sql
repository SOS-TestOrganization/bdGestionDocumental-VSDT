

/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  2.ScriptAsociaciónImagenesRadicacionesxEventosCTC
* Desarrollado por		 	: <\A Ing. Juan Carlos Vásquez G.											A\>
* Descripcion			  	: <\D Script Para asociar imagenes de recobros por evento CTC en 
									estado '1003-Liquidado' y del usuario = 'migra01'					D\>
* Observaciones		        : <\O																		O\>
* Parametros			  	: <\P																		P\>
* Variables			  		: <\V  																		V\>
* Fecha Creacion	        : <\FC 2016/02/16															FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM Andres Taborda AM\>
* Descripcion				: <\DM Ajuste para que asocie el acta que corresponde y tome el ultimo documento digitalizado 	DM\>
* Nuevos Parametros			: <\PM 	PM\>
* Nuevas Variables			: <\VM 	VM\>
* Fecha Modificacion		: <\FM 20170215	FM\>
*---------------------------------------------------------------------------------
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM Andres Taborda AM\>
* Descripcion				: <\DM Ajuste elimnado un ciclo lo cual afecta el proceso de asociacion de imagenes  	DM\>
* Nuevos Parametros			: <\PM 	PM\>
* Nuevas Variables			: <\VM 	VM\>
* Fecha Modificacion		: <\FM 20170228	FM\>
*---------------------------------------------------------------------------------

*/

CREATE Procedure [dbo].[spAsociacionImagenesRadicacionesxEventosCTC]
AS

Begin
	Set NoCount on
	
	Declare @idmnmo										int,
			@idmxmo										int,
			@cnsctvo_cdgo_dcmnto_ant					int,
			@cnsctvo_cdgo_dcmnto_actl					int,
			@cntdd_imgns_x_docto						int,
			@cnsctcvo_ordn_imprsn						int,
			@cnsctvo_cdgo_estdo_imgn_rcbro				int,
			@cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro	int,
			@fchaactl									datetime,
			@lcusrio									char(30),
			@nmro_pgns_impsn							int
			
	Set	@idmnmo = 0 
	Set @idmxmo = 0
	Set @cnsctvo_cdgo_dcmnto_ant = 0
	Set @cnsctvo_cdgo_dcmnto_actl = 0
	Set @cntdd_imgns_x_docto = 1
	Set @cnsctcvo_ordn_imprsn = 0
	Set @cnsctvo_cdgo_estdo_imgn_rcbro = 2
	Set @cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro = 2
	Set @fchaactl = getdate()
	Set @nmro_pgns_impsn = 1
	Set @lcusrio = 'Migra01'

	-- tabla temporal de Homologación x tipos de Imagenes
	CREATE TABLE #tbHomologacionRecobrosxTipoImagenes
	(
	cnsctvo_cdgo_tpo_imgn			int,
	cnsctvo_cdgo_tpo_sprte_dcmntl	udtConsecutivo,
	cdgo_tpo_sprte_dcmntl			varchar(8),
	dscrpcn_sprte_dcmntl			udtDescripcion
	)

	create table #tbRevisionDuplicidad( nmro_acta_ctc char(20) ,cnsctvo_cdgo_tpo_imgn int, fcha_dgtlzcn datetime)



	Insert #tbHomologacionRecobrosxTipoImagenes
	(
	cnsctvo_cdgo_tpo_imgn,
	cnsctvo_cdgo_tpo_sprte_dcmntl	,
	cdgo_tpo_sprte_dcmntl			,
	dscrpcn_sprte_dcmntl			
	)
	Values	(135,1,'T0001','Acta de CTC'),
			(999,2,'T0002','Fallo de Tutela'),
			(999,3,'T0003','Formato MYT'),
			(100,4,'T0004','Factura o Documento Equivalente'),
			(224,4,'T0004','Factura o Documento Equivalente'),
			(235,4,'T0004','Factura o Documento Equivalente'),
			(225,5,'T0005','Orden y/o Formula Medica'),
			(226,6,'T0006','Documento Evidencia Entrega Tecnologia No Pos'),
			(101,6,'T0006','Documento Evidencia Entrega Tecnologia No Pos'),
			(143,6,'T0006','Documento Evidencia Entrega Tecnologia No Pos'),
			(260,6,'T0006','Documento Evidencia Entrega Tecnologia No Pos'),
			(999,7,'T0007','Otros')

	
	-- tmp para la prueba
	Create table #tmpRadicacionesxEventosCTC
		(
		id_tbla							int identity,		cnsctvo_rdccn_rcbro		varchar(250),	nmro_ntfccn		varchar(250),
		nmro_acta_ctc					char(20),			cnsctvo_sde_acta		varchar(250)
		)

	
	
	-- código de inserción recobros a asociar imagenes
	Insert #tmpRadicacionesxEventosCTC
		(
			cnsctvo_rdccn_rcbro,			nmro_ntfccn,		nmro_acta_ctc,
			cnsctvo_sde_acta			
		)
	
	Select 
			cnsctvo_rdccn_rcbro,			nmro_ntfccn,		nmro_acta_ctc,
			cnsctvo_sde_acta
	From	temporal.dbo.tmpCRRadicacionesxEventosCTC

	
	
	/*--test
	Insert #tmpRadicacionesxEventosCTC
		(
		cnsctvo_rdccn_rcbro,			nmro_ntfccn,		nmro_acta_ctc,
		cnsctvo_sde_acta			
		)
		
	Values
	(1995573,	1040466,	700877              ,	2)
	*/

	-- Tabla indices de imagenes documentos digitalizados
	Create table #tmpIndicesxImagenesDoctos
		(
		id_tbla							int identity,		indcs_encntrds			int default 0,
		cnsctvo_cdgo_dcmnto             int,				cnsctvo_rdccn_rcbro		int,
		nmro_ntfccn						int,				nmro_acta_ctc			char(20),
		cnsctvo_sde_acta				int,				cnsctvo_cdgo_tpo_dcmntl int,
		cnsctvo_cdgo_tpo_indce          int)

    -- Tabla De Documentos Digitalizados
	Create table #tmpDocumentosDigitalizados0
		(
		id_tbla							int identity,		cnsctvo_cdgo_dcmnto		int,			cnsctvo_rdccn_rcbro				int,
		nmro_ntfccn						int,				nmro_acta_ctc			char(20),		cnsctvo_sde_acta				int,
		cnsctvo_cdgo_tpo_dcmntl         int,				cnsctvo_cdgo_tpo_indce  int,			cnsctvo_cdgo_imgn               int,
		cnsctvo_cdgo_tpo_imgn           int,				dscrpcn_imgn_dcmntl		varchar(250),	cnsctvo_cdgo_tpo_sprte_dcmntl	int,				
		dscrpcn_sprte_dcmntl			varchar(250),		rta_imgn                varchar(250),	cnsctvo_imgns					int default 0
		)
	
	-- Tabla De Documentos Digitalizados
	Create table #tmpDocumentosDigitalizados
		(
		id_tbla							int identity,		cnsctvo_cdgo_dcmnto		int,			cnsctvo_rdccn_rcbro				int,
		nmro_ntfccn						int,				nmro_acta_ctc			char(20),		cnsctvo_sde_acta				int,
		cnsctvo_cdgo_tpo_dcmntl         int,				cnsctvo_cdgo_tpo_indce  int,			cnsctvo_cdgo_imgn               int,
		cnsctvo_cdgo_tpo_imgn           int,				dscrpcn_imgn_dcmntl		varchar(250),	cnsctvo_cdgo_tpo_sprte_dcmntl	int,				
		dscrpcn_sprte_dcmntl			varchar(250),		rta_imgn                varchar(250),	cdgo_tpo_sprte_dcmntl			varchar(8),			cnsctcvo_ordn_imprsn	int,			cnsctvo_cdgo_estdo_imgn_rcbro	int,	
		cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro	int,		fchaactl				datetime,		lcusrio							char(30),			nmro_pgns_impsn			int,			cnsctvo_imgns					int default 0,
		fcha_dgtlzcn					datetime,			dplcdo int default 1
		)

    -- insertamos imagenes de doctos '2-facturas'
	Insert			#tmpIndicesxImagenesDoctos(
					cnsctvo_cdgo_dcmnto,			cnsctvo_rdccn_rcbro,		nmro_ntfccn,
					nmro_acta_ctc,					cnsctvo_sde_acta,			cnsctvo_cdgo_tpo_dcmntl,
					cnsctvo_cdgo_tpo_indce)	
	Select distinct	
					b.cnsctvo_cdgo_dcmnto,			r.cnsctvo_rdccn_rcbro,		r.nmro_ntfccn,
					r.nmro_acta_ctc,				r.cnsctvo_sde_acta,			b.cnsctvo_cdgo_tpo_dcmntl,
					a.cnsctvo_cdgo_tpo_indce					
	From			#tmpRadicacionesxEventosCTC r
	Inner Join		tbIndicesxDocumentosDigitalizados a with(nolock)	On	a.vlr						= r.cnsctvo_rdccn_rcbro 
																		And	a.cnsctvo_cdgo_tpo_indce	= 9 -- Número Recobro
	Inner Join		tbDocumentosDigitalizados b			with(nolock)	On	b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto			
	Where			b.cnsctvo_cdgo_tpo_dcmntl = 2 -- Facturas
	--And				b.cnsctvo_cdgo_dgtlzdr = 10 -- IQ  /*Por solicitud del usuario Gloria Gil 2016/01725*/

	-- insertamos imagenes de doctos '1-CTC'
	Insert		#tmpIndicesxImagenesDoctos(
				indcs_encntrds,					cnsctvo_cdgo_dcmnto,			cnsctvo_rdccn_rcbro,		
				nmro_ntfccn,					nmro_acta_ctc,					cnsctvo_sde_acta,			
				cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce)	
	Select	distinct	
				1 as indcs_encntrds,			b.cnsctvo_cdgo_dcmnto,			r.cnsctvo_rdccn_rcbro,
				--r.nmro_ntfccn,					r.nmro_acta_ctc,				r.cnsctvo_sde_acta,			
				r.nmro_ntfccn,					'' as nmro_acta_ctc,				r.cnsctvo_sde_acta,			
				b.cnsctvo_cdgo_tpo_dcmntl,		a.cnsctvo_cdgo_tpo_indce					
	From		#tmpRadicacionesxEventosCTC r
	Inner Join	tbIndicesxDocumentosDigitalizados a with(nolock)	On	a.vlr						= r.nmro_ntfccn 
																	And	a.cnsctvo_cdgo_tpo_indce	= 5 -- Numero de Notificacion
	Inner Join  tbDocumentosDigitalizados b			with(nolock)	On	b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto	
	Where		b.cnsctvo_cdgo_tpo_dcmntl = 1 --  CTC


	--  actualizamos si existen imagenes x doctos '1- CTC' x Indicce Acta CTC

	update		c
	set			indcs_encntrds += 1,
				nmro_acta_ctc=ltrim(rtrim(a.vlr)) /*ajuste 20170215 para que quede el acta que corresponde*/
	From		#tmpRadicacionesxEventosCTC r
	Inner Join	tbIndicesxDocumentosDigitalizados a with(nolock)	On	a.vlr = r.nmro_acta_ctc 
	Inner Join  tbDocumentosDigitalizados b with(nolock)			On	b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto
	Inner Join	#tmpIndicesxImagenesDoctos c						On  b.cnsctvo_cdgo_dcmnto = c.cnsctvo_cdgo_dcmnto
	Where		b.cnsctvo_cdgo_tpo_dcmntl = 1 -- Actas CTC
	And			a.cnsctvo_cdgo_tpo_indce = 8 -- Número Acta CTC

	/*ajuste 20170215 quitar actas que corresponde*/
	delete #tmpIndicesxImagenesDoctos where ltrim(rtrim(nmro_acta_ctc))='' and cnsctvo_cdgo_tpo_indce=5


	
	-- actualizamos si existen imagenes x doctos '1-actas CTC' x Tipo Indice Sede

	update		c
	set			indcs_encntrds += 1
	From		#tmpRadicacionesxEventosCTC r
	Inner Join	tbIndicesxDocumentosDigitalizados a with(nolock)	On	a.vlr = r.cnsctvo_sde_acta 
	Inner Join  tbDocumentosDigitalizados b with(nolock)			On	b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto
	Inner Join	#tmpIndicesxImagenesDoctos c						On  b.cnsctvo_cdgo_dcmnto = c.cnsctvo_cdgo_dcmnto
	Where		b.cnsctvo_cdgo_tpo_dcmntl = 1 -- Actas CTC
	And			a.cnsctvo_cdgo_tpo_indce = 19 -- Número de Sede

	


	-- insertamos los imagenes de los documentos digitalizados x tipo documento '1-CTC'
	Insert			#tmpDocumentosDigitalizados0(
					cnsctvo_cdgo_dcmnto,			cnsctvo_rdccn_rcbro,		nmro_ntfccn,
					nmro_acta_ctc,					cnsctvo_sde_acta,			cnsctvo_cdgo_tpo_dcmntl,
					cnsctvo_cdgo_tpo_indce,			cnsctvo_cdgo_imgn,			cnsctvo_cdgo_tpo_imgn,			
					rta_imgn,						cnsctvo_imgns)	
	Select	distinct
					i.cnsctvo_cdgo_dcmnto,			i.cnsctvo_rdccn_rcbro,		i.nmro_ntfccn,
					i.nmro_acta_ctc,				i.cnsctvo_sde_acta,			i.cnsctvo_cdgo_tpo_dcmntl,
					i.cnsctvo_cdgo_tpo_indce,		d.cnsctvo_cdgo_imgn,		d.cnsctvo_cdgo_tpo_imgn,
					d.rta_imgn,						row_number() over(partition by i.cnsctvo_cdgo_dcmnto  order by i.cnsctvo_cdgo_dcmnto) as no_rgstro
	From			#tmpIndicesxImagenesDoctos i
	Inner Join		tbImagenesxDocumentosDigitalizados d with(nolock) On d.cnsctvo_cdgo_dcmnto = i.cnsctvo_cdgo_dcmnto
    Where			i.indcs_encntrds = 3 -- Indices encontrados
	And				i.cnsctvo_cdgo_tpo_dcmntl = 1 -- CTC
	Order by		i.cnsctvo_rdccn_rcbro, i.cnsctvo_cdgo_dcmnto, d.cnsctvo_cdgo_imgn


	-- ciclo para ordenar las imagenes 
	/*20170228 se elimina este ciclo ya que ocasiona que se genere lentitud del proceso*/
	/*
	Select @idmnmo = min(id_tbla) From #tmpDocumentosDigitalizados0
	Select @idmxmo = max(id_tbla) From #tmpDocumentosDigitalizados0

		
	select 	@cnsctvo_cdgo_dcmnto_ant = cnsctvo_cdgo_dcmnto,
			@cnsctvo_cdgo_dcmnto_actl = cnsctvo_cdgo_dcmnto
	From	#tmpDocumentosDigitalizados0
	Where	id_tbla = @idmnmo


	While (@idmnmo <= @idmxmo And @idmnmo > 0 )
		Begin
			if @cnsctvo_cdgo_dcmnto_ant = @cnsctvo_cdgo_dcmnto_actl
				Begin
					Update	#tmpDocumentosDigitalizados0
					Set		cnsctvo_imgns = @cntdd_imgns_x_docto 
					where	id_tbla = @idmnmo
					Set @cntdd_imgns_x_docto += 1
				End
			Else
				Begin
					Set @cntdd_imgns_x_docto = 1
					Set @cnsctvo_cdgo_dcmnto_ant = 	@cnsctvo_cdgo_dcmnto_actl

					Update	#tmpDocumentosDigitalizados0
					Set		cnsctvo_imgns = @cntdd_imgns_x_docto 
					where	id_tbla = @idmnmo
					Set @cntdd_imgns_x_docto += 1
				End
			
			Set @idmnmo += 1
			
			select 	@cnsctvo_cdgo_dcmnto_actl = cnsctvo_cdgo_dcmnto
			From	#tmpDocumentosDigitalizados0
			Where	id_tbla = @idmnmo
		End
	*/
	--Select * from #tmpDocumentosDigitalizados0
	
	-- insertamos los imagenes de los documentos digitalizados x documento '2-facturas'
	Insert		#tmpDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,			cnsctvo_rdccn_rcbro,		nmro_ntfccn,
				nmro_acta_ctc,					cnsctvo_sde_acta,			cnsctvo_cdgo_tpo_dcmntl,
				cnsctvo_cdgo_tpo_indce,			cnsctvo_cdgo_imgn,			cnsctvo_cdgo_tpo_imgn,			
				rta_imgn)	
	Select distinct
				i.cnsctvo_cdgo_dcmnto,			i.cnsctvo_rdccn_rcbro,		i.nmro_ntfccn,
				i.nmro_acta_ctc,				i.cnsctvo_sde_acta,			i.cnsctvo_cdgo_tpo_dcmntl,
				i.cnsctvo_cdgo_tpo_indce,		d.cnsctvo_cdgo_imgn,		d.cnsctvo_cdgo_tpo_imgn,
				d.rta_imgn								
	From		#tmpIndicesxImagenesDoctos i
	Inner Join  tbImagenesxDocumentosDigitalizados d with(nolock) On d.cnsctvo_cdgo_dcmnto = i.cnsctvo_cdgo_dcmnto
    Where		i.cnsctvo_cdgo_tpo_dcmntl = 2 -- Facturas
	And			d.cnsctvo_cdgo_tpo_imgn in(100,101,143,224,226,235,260)	-- factura, OPS, Historia Clinica,Docto Evidencia, detalle de cargos,Autorizacion	
	Order by	i.cnsctvo_rdccn_rcbro, i.cnsctvo_cdgo_dcmnto, d.cnsctvo_cdgo_imgn




	-- insertamos los imagenes de los documentos digitalizados x documento '1-CTC'
	Insert		#tmpDocumentosDigitalizados(
				cnsctvo_cdgo_dcmnto,			cnsctvo_rdccn_rcbro,		nmro_ntfccn,
				nmro_acta_ctc,					cnsctvo_sde_acta,			cnsctvo_cdgo_tpo_dcmntl,
				cnsctvo_cdgo_tpo_indce,			cnsctvo_cdgo_imgn,			cnsctvo_cdgo_tpo_imgn,			
				rta_imgn,						cnsctvo_imgns)	
	Select		distinct
				i.cnsctvo_cdgo_dcmnto,			i.cnsctvo_rdccn_rcbro,		i.nmro_ntfccn,
				i.nmro_acta_ctc,				i.cnsctvo_sde_acta,			i.cnsctvo_cdgo_tpo_dcmntl,
				i.cnsctvo_cdgo_tpo_indce,		d.cnsctvo_cdgo_imgn,		d.cnsctvo_cdgo_tpo_imgn,
				d.rta_imgn,						d.cnsctvo_imgns								
	--select *
	From		#tmpIndicesxImagenesDoctos i
	Inner Join  #tmpDocumentosDigitalizados0 d On d.cnsctvo_cdgo_dcmnto = i.cnsctvo_cdgo_dcmnto
    Where		i.cnsctvo_cdgo_tpo_dcmntl = 1 -- CTC
	And			i.indcs_encntrds = 3 
	And			d.cnsctvo_imgns in (1,2,3)
	Order by	I.cnsctvo_rdccn_rcbro, i.cnsctvo_cdgo_dcmnto, d.cnsctvo_imgns 


	
	

    -- actualizamos el tipo de imagen para actas pag 1 y 2 y la orden y/o fórmula médica

	Update			#tmpDocumentosDigitalizados
	Set			cnsctvo_cdgo_tpo_imgn = case When cnsctvo_imgns = 1 then 135
											 When cnsctvo_imgns = 2 then 135
											 When cnsctvo_imgns = 3 then 225  
										End
    Where			cnsctvo_cdgo_tpo_dcmntl = 1 -- CTC

	-- actualizamos el tipo de imagen para para facturas de 100 a 224

	Update			#tmpDocumentosDigitalizados
	Set				cnsctvo_cdgo_tpo_imgn =  224  
    Where			cnsctvo_cdgo_tpo_dcmntl = 2 -- FACTURAS
	And				cnsctvo_cdgo_tpo_imgn = 100

	Update		d
	Set			dscrpcn_imgn_dcmntl = t.dscrpcn_tpo_imgn
	From		#tmpDocumentosDigitalizados d
	Inner Join	tbTiposImagenes t with(nolock)
	On			t.cnsctvo_cdgo_tpo_imgn = d.cnsctvo_cdgo_tpo_imgn

	Update		d
	Set			cnsctvo_cdgo_tpo_sprte_dcmntl = h.cnsctvo_cdgo_tpo_sprte_dcmntl,
				cdgo_tpo_sprte_dcmntl = h.cdgo_tpo_sprte_dcmntl,
				dscrpcn_sprte_dcmntl = h.dscrpcn_sprte_dcmntl
	From		#tmpDocumentosDigitalizados d
	Inner Join	#tbHomologacionRecobrosxTipoImagenes h
	On			h.cnsctvo_cdgo_tpo_imgn = d.cnsctvo_cdgo_tpo_imgn

	Update		d
	Set			cnsctcvo_ordn_imprsn = @cnsctcvo_ordn_imprsn,
				cnsctvo_cdgo_estdo_imgn_rcbro = @cnsctvo_cdgo_estdo_imgn_rcbro ,
				cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro = @cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro,
				fchaactl = @fchaactl ,
				lcusrio = @lcusrio,		
				nmro_pgns_impsn = @nmro_pgns_impsn
	From		#tmpDocumentosDigitalizados d




	Update		d
	Set			cnsctvo_cdgo_tpo_imgn = 226	   
	From		#tmpDocumentosDigitalizados d
	Where		d.cnsctvo_cdgo_tpo_imgn = 260

			
	/*ajuste 20170215 Actualiza dato fecha digitacicion*/
	update #tmpDocumentosDigitalizados
	set fcha_dgtlzcn=d2.fcha_dgtlzcn
	from #tmpDocumentosDigitalizados d1 inner join tbDocumentosDigitalizados d2
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
		
	Insert #tbRevisionDuplicidad(nmro_acta_ctc, cnsctvo_cdgo_tpo_imgn,fcha_dgtlzcn)
	Select nmro_acta_ctc,cnsctvo_cdgo_tpo_imgn, max(fcha_dgtlzcn) as fcha_dgtlzcn
	from #tmpDocumentosDigitalizados
	group by nmro_acta_ctc,cnsctvo_cdgo_tpo_imgn

	/*activa los documentos que no son duplicados*/

	update #tmpDocumentosDigitalizados
	set dplcdo=0
	from #tmpDocumentosDigitalizados d1 inner join #tbRevisionDuplicidad d2
	on d1.nmro_acta_ctc=d2.nmro_acta_ctc
	and d1.cnsctvo_cdgo_tpo_imgn=d2.cnsctvo_cdgo_tpo_imgn
	where d1.fcha_dgtlzcn=d2.fcha_dgtlzcn

	/*descartar registros duplicados*/
	delete #tmpDocumentosDigitalizados
	where  dplcdo=1



	/*quitar las actas que no corresponde al recobro asociado*/
	delete #tmpDocumentosDigitalizados
	--select d2.*
	from temporal.dbo.tmpCRRadicacionesxEventosCTC d1 inner join #tmpDocumentosDigitalizados d2
	on d1.cnsctvo_rdccn_rcbro=d2.cnsctvo_rdccn_rcbro
	where d2.cnsctvo_cdgo_tpo_imgn=135 
	and d2.nmro_acta_ctc != d1.nmro_acta_ctc

	/*quitar las actas que no corresponde al recobro asociado en el cual hay mas de un acta con fechas de digitalizacion diferente */
	delete #tmpDocumentosDigitalizados
	--select d2.*
	from #tbRevisionDuplicidad d1 inner join #tmpDocumentosDigitalizados d2
	on d1.nmro_acta_ctc=d2.nmro_acta_ctc
	and d1.cnsctvo_cdgo_tpo_imgn=d2.cnsctvo_cdgo_tpo_imgn
	where d2.cnsctvo_cdgo_tpo_imgn=135 
	and d2.fcha_dgtlzcn != d1.fcha_dgtlzcn
			

	/*
		Select * from #tmpDocumentosDigitalizados where cnsctvo_rdccn_rcbro=2003486 and cnsctvo_cdgo_tpo_imgn=135 order by cnsctvo_cdgo_tpo_imgn
		Select * from #tbRevisionDuplicidad where nmro_acta_ctc=719560                               
		Select * from temporal.dbo.tmpCRRadicacionesxEventosCTC where cnsctvo_rdccn_rcbro=2003486
	*/

			            
		 Truncate Table Temporal.dbo.tbTmpGDDocumentosDigitalizados 

		   Insert temporal.dbo.tbTmpGDDocumentosDigitalizados
		   (
				cnsctvo_rdccn_rcbro,			cnsctvo_cdgo_imgn,							usro_crcn,
				cnsctvo_cdgo_tpo_imgn,			cnsctvo_cdgo_tpo_dcmnto,					cnsctvo_ntfccn,
				cnsctvo_cdgo_ofcna,				nmro_acta,									cnsctcvo_ordn_imprsn,
				cnsctvo_cdgo_estdo_imgn_rcbro,	cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro,	usro_ultma_mdfccn,
				fcha_ultma_mdfccn,				nmro_pgns_imgn

		   )
		   Select distinct
				cnsctvo_rdccn_rcbro,			cnsctvo_cdgo_imgn,							lcusrio,
				cnsctvo_cdgo_tpo_imgn,			cnsctvo_cdgo_tpo_dcmntl,					nmro_ntfccn,
				cnsctvo_sde_acta,				cast(nmro_acta_ctc as int),					cnsctcvo_ordn_imprsn,
				cnsctvo_cdgo_estdo_imgn_rcbro,	cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro,	lcusrio,
				fchaactl,						nmro_pgns_impsn
		  From	#tmpDocumentosDigitalizados

	  -- Actualizamos el tipo de Imagen  para los registros que estan null o vacio

		  Update i
		  Set			cnsctvo_cdgo_tpo_imgn = Case When d.cnsctvo_imgns = 1 then 135
													 When d.cnsctvo_imgns = 2 then 135
													 When d.cnsctvo_imgns = 3 then 225
												End	   
			--select	count(*)										
		  From			tbImagenesxDocumentosDigitalizados i with(nolock)
		  Inner Join	#tmpDocumentosDigitalizados d
		  On			d.cnsctvo_cdgo_imgn = i.cnsctvo_cdgo_imgn
	  	  Where			i.cnsctvo_cdgo_tpo_imgn = 0	

		  -- Actualizamos el tipo de Imagen  para los registros que son facturas de 100 a 224

		  Update i
		  Set			cnsctvo_cdgo_tpo_imgn = 224	   
		  --select count(*)
		  From			tbImagenesxDocumentosDigitalizados i with(nolock)
		  Inner Join	#tmpDocumentosDigitalizados d
		  On			d.cnsctvo_cdgo_imgn = i.cnsctvo_cdgo_imgn
	  	  Where			i.cnsctvo_cdgo_tpo_imgn = 100	

		  /*ajuste adicionado 2016/01725 solicitado por Gloria gil*/
		 Update i
		  Set			cnsctvo_cdgo_tpo_imgn = 224	   
		  --select count(*)
		  From			tbImagenesxDocumentosDigitalizados i with(nolock)
		  Inner Join	#tmpDocumentosDigitalizados d
		  On			d.cnsctvo_cdgo_imgn = i.cnsctvo_cdgo_imgn
	  	  Where			i.cnsctvo_cdgo_tpo_imgn = 235		

	
	Drop Table #tmpRadicacionesxEventosCTC
	Drop Table #tmpIndicesxImagenesDoctos
	Drop Table #tmpDocumentosDigitalizados
	Drop Table #tmpDocumentosDigitalizados0
	Drop Table #tbHomologacionRecobrosxTipoImagenes
	
End