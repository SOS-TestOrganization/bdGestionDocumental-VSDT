

/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  spObtenerImagenesRecobros
* Desarrollado por		 	: <\A Ing. Andres Taborda											A\>
* Descripcion			  	: <\D Obtiene las imagenes requerida para prsentar el recobro				D\>
* Observaciones		        : <\O																		O\>
* Parametros			  	: <\P																		P\>
* Variables			  		: <\V  																		V\>
* Fecha Creacion	        : <\FC 20170331															FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
-----------------------------------------------------------------------------------------
* Modificado Por			: <\AM Andres Taborda AM\>
* Descripcion				: <\DM Ajuste para obtener no tener en cuenta los recobros que no tengan actas al realizar la busqueda de imagenes  DM\>
* Nuevos Parametros			: <\PM 	PM\>
* Nuevas Variables			: <\VM 	VM\>
* Fecha Modificacion		: <\FM 20190403	FM\>
-------------------------------------------------------------------------------------------------------------------
*/

CREATE Procedure [dbo].[spObtenerImagenesRecobros]
AS

Begin
	Set NoCount on

		
create table #tmpRecobros(
	cnsctvo_rdccn_rcbro				int,
	nmro_rdccn						int,
	cnsctvo_cdgo_clsfccn_atncn		int,
	cnsctvo_cdgo_tpo_slctd_no_ps	int,	
	nmro_ntfccn						int,	
	nmro_acta_ctc					char(20),
	cnsctvo_sde_acta				int,
	cnsctvo_cdgo_tpo_idntfccn_afldo int,
	cdgo_tpo_idntfccn_afldo			varchar(3),
	nmro_idntfccn_afldo				varchar(23),
	cnsctvo_atncn					int,
	vlr_nmro_rdccn					char(20),
	vlr_nmro_acta_ctc				char(20),
	vlr_cnsctvo_rdccn_rcbro			char(20)
)

--drop table #tbImagenes
	create table #tbImagenes(
		cnsctvo_rdccn_rcbro				int,
		nmro_ntfccn						int,
		cnsctvo_sde_acta				int,
		cnsctvo_cdgo_clsfccn_atncn		int,
		cnsctvo_cdgo_imgn				int,
		cnsctvo_cdgo_tpo_imgn			int,
		cnsctvo_cdgo_dcmnto				int,
		cnsctvo_cdgo_tpo_sprte_dcmntl	int,
		nmro_acta_ctc					int,
		tpo_idntfccn_afldo				varchar(3),
		nmro_idntfccn_afldo				varchar(23),
		vlr_nmro_rcbro					int,
		vlr_nmro_ntfccn					int,
		vlr_sde_acta					int,
		vlr_tpo_idntfccn_afldo			varchar(3),
		vlr_nmro_idntfccn_afldo			varchar(23),
		cnsctvo_cdgo_tpo_dcmntl			int,
		cnsctvo_imgns					int,
		indcdr_acta						int default 0, /*0 no es , 1 si es */
		orgn_imgn						int default 0,
		actlzr_tbla						int default 0,
		vlda_imgn						int 
	)

	--drop table #tbImagenesObligatorias
	create table #tbImagenesObligatorias(
		cnsctvo_rdccn_rcbro			int,
		cnsctvo_cdgo_clsfccn_atncn	int,
		cnsctvo_cdgo_imgn			int,
		cnsctvo_cdgo_tpo_imgn		int,
		cnsctvo_cdgo_dcmnto			int,
		cnsctvo_cdgo_tpo_sprte_dcmntl	int,
		cnsctvo_cdgo_estdo_imgn_rcbro int,
		cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro int,
		cnsctvo_ntfccn				  int,
		cnsctvo_cdgo_sde			  int,
		nmro_acta					  int,
		fcha_crcn					  datetime,
		usro_crcn					  varchar(30),
		cnsctcvo_ordn_imprsn		  int default 0,	
		nmro_pgns_imgn				  int default 0,
		fcha_dgtlzcn				  datetime,
		dplcdo						   int default 0,
		cnsctvo_cdgo_tpo_dcmnto			int,
		orgn_imgn						int,
		gd_tpo_idntfccn_afldo				varchar(3),
		gd_nmro_idntfccn_afldo				varchar(23),
		vlda_imgn						int

	)

	create table #tbRevisionDuplicidad( nmro_acta_ctc char(20) ,cnsctvo_cdgo_tpo_imgn int, fcha_dgtlzcn datetime)
	
	create table #tbConsecutivosActas(
			cnsctvo_rdccn_rcbro		int,
			cnsctvo_cdgo_dcmnto		int,
			cnsctvo_cdgo_imgn		int,
			cnsctvo_cdgo_tpo_imgn	int,
			cnsctvo_imgns			int
	)

		create table #tbDocumentosImagenAfiliado(
			cnsctvo_cdgo_dcmnto int,
			cdgo_tpo_idntfccn_afldo varchar(3),
			nmro_idntfccn_afldo varchar(23)
	)

	create table #tbRutasImagenes(
		cnsctvo_cdgo_imgn int,
		rta_imgn varchar(250),
		vlda_imgn int default 1,/*1 indica no es valido la ruta de imagen*/
		exste	int 
		)

	create table #tbConteoRutas(
		rta_imgn varchar(250),
		cntdd int,
		cnsctvo_cdgo_imgn int
	)
	


	-- tmp para la prueba
	insert #tmpRecobros(
				cnsctvo_rdccn_rcbro,			nmro_ntfccn,								nmro_acta_ctc,
				cnsctvo_sde_acta,				nmro_rdccn,									cnsctvo_cdgo_clsfccn_atncn,
				cnsctvo_cdgo_tpo_slctd_no_ps,
				cnsctvo_cdgo_tpo_idntfccn_afldo,
				nmro_idntfccn_afldo,
				cnsctvo_atncn,
				vlr_nmro_rdccn,
				vlr_nmro_acta_ctc,			
				vlr_cnsctvo_rdccn_rcbro		
	
	)Select 	cnsctvo_rdccn_rcbro,			nmro_ntfccn,								nmro_acta_ctc,
				cnsctvo_sde_acta,				nmro_rdccn,									cnsctvo_cdgo_clsfccn_atncn,
				cnsctvo_cdgo_tpo_slctd_no_ps,	
				cnsctvo_cdgo_tpo_idntfccn,
				nmro_idntfccn_afldo,
				cnsctvo_atncn,
				rtrim(ltrim(convert(char(20),nmro_rdccn))),
				rtrim(ltrim(convert(char(20),nmro_acta_ctc))),
				rtrim(ltrim(convert(char(20),cnsctvo_rdccn_rcbro)))										
	From		temporal.dbo.tmpRecobros
	
	
	
	/*actualizar tipo documento*/
	update #tmpRecobros
	set cdgo_tpo_idntfccn_afldo= d2.cdgo_tpo_idntfccn
	from #tmpRecobros d1 inner join bdafiliacion.dbo.tbtiposIdentificacion d2
	on d1.cnsctvo_cdgo_tpo_idntfccn_afldo= d2.cnsctvo_cdgo_tpo_idntfccn

	/*1.Realizar la busqueda de imagenes con el numero de radicacion sin importar el tipo documental*/

	Insert #tbImagenes(
		cnsctvo_rdccn_rcbro, tpo_idntfccn_afldo,nmro_idntfccn_afldo,nmro_ntfccn, cnsctvo_sde_acta,cnsctvo_cdgo_imgn,cnsctvo_cdgo_tpo_imgn,cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_tpo_sprte_dcmntl,nmro_acta_ctc,indcdr_acta,orgn_imgn
	)
	Select Distinct d1.cnsctvo_rdccn_rcbro,d1.cdgo_tpo_idntfccn_afldo,d1.nmro_idntfccn_afldo,d1.nmro_ntfccn,  d1.cnsctvo_sde_acta,d3.cnsctvo_cdgo_imgn,d3.cnsctvo_cdgo_tpo_imgn, d3.cnsctvo_cdgo_dcmnto, 4 as 	cnsctvo_cdgo_tpo_sprte_dcmntl,case d3.cnsctvo_cdgo_tpo_imgn when 135 then d1.vlr_nmro_acta_ctc else 0 end as nmro_acta_ctc,0,1
	from #tmpRecobros d1 Inner Join	tbIndicesxDocumentosDigitalizados d2 with(nolock)	
	On d1.vlr_nmro_rdccn=d2.vlr
	inner join tbImagenesxDocumentosDigitalizados d3 with(nolock)	
	on d2.cnsctvo_cdgo_dcmnto=d3.cnsctvo_cdgo_dcmnto
	where d2.cnsctvo_cdgo_tpo_indce = 2  -- Numero radicacion
	and d3.cnsctvo_cdgo_tpo_imgn not in(0,999)

	/*para cada documento recupere el numero del recobro*/
	update #tbImagenes
	set vlr_nmro_rcbro= d2.vlr
	from #tbImagenes d1 inner join tbIndicesxDocumentosDigitalizados d2 with(nolock)	
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
	where d2.cnsctvo_cdgo_tpo_indce=9

	/*quitar las imagenes que no estan relacionadas con el recobro*/
	delete #tbImagenes
	where cnsctvo_rdccn_rcbro!=vlr_nmro_rcbro

	
	

	
	/*2 realizar la busqueda de numero de acta*/
	
	Insert #tbImagenes(
		cnsctvo_rdccn_rcbro,tpo_idntfccn_afldo,nmro_idntfccn_afldo,nmro_ntfccn, cnsctvo_sde_acta,cnsctvo_cdgo_imgn,cnsctvo_cdgo_tpo_imgn,cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_tpo_sprte_dcmntl,nmro_acta_ctc,indcdr_acta,orgn_imgn
	)
	Select Distinct d1.cnsctvo_rdccn_rcbro,d1.cdgo_tpo_idntfccn_afldo,d1.nmro_idntfccn_afldo,d1.nmro_ntfccn,  d1.cnsctvo_sde_acta, d3.cnsctvo_cdgo_imgn,d3.cnsctvo_cdgo_tpo_imgn, d3.cnsctvo_cdgo_dcmnto, 1 as 	cnsctvo_cdgo_tpo_sprte_dcmntl, 
	case d3.cnsctvo_cdgo_tpo_imgn when 135 then d1.vlr_nmro_acta_ctc else 0 end as nmro_acta_ctc,1,2
	from #tmpRecobros d1 Inner Join		tbIndicesxDocumentosDigitalizados d2 with(nolock)	
	On	d1.vlr_nmro_acta_ctc=d2.vlr
	inner join tbImagenesxDocumentosDigitalizados d3 with(nolock)	
	on d2.cnsctvo_cdgo_dcmnto=d3.cnsctvo_cdgo_dcmnto
	left join #tbImagenes dx
	on dx.cnsctvo_cdgo_imgn=d3.cnsctvo_cdgo_imgn
	where d2.cnsctvo_cdgo_tpo_indce = 8  -- Numero ACTA
	--and d3.cnsctvo_cdgo_tpo_imgn not in(0,999)
	and dx.cnsctvo_cdgo_imgn is null
	/*Debe tener numero de acta asociada*/
	and ltrim(rtrim(isnull(d1.vlr_nmro_acta_ctc,''))) not in ('0','')


	update #tbImagenes
	set cnsctvo_cdgo_tpo_dcmntl=d2.cnsctvo_cdgo_tpo_dcmntl
	from #tbImagenes d1 inner join tbDocumentosDigitalizados d2
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
	--where d1.indcdr_acta=1

	/*para cada documento recupere el numero de notificacion del documento*/
	update #tbImagenes
	set vlr_nmro_ntfccn= d2.vlr
	from #tbImagenes d1 inner join tbIndicesxDocumentosDigitalizados d2 with(nolock)	
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
	where d2.cnsctvo_cdgo_tpo_indce=5
	and  d1.indcdr_acta=1

	/*para cada documento recupere la sede del acta*/
	update #tbImagenes
	set vlr_sde_acta= d2.vlr
	from #tbImagenes d1 inner join tbIndicesxDocumentosDigitalizados d2 with(nolock)	
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
	where d2.cnsctvo_cdgo_tpo_indce=19
	and  d1.indcdr_acta=1
		
	/*quitar las imagenes que no estan relacionadas con la notficacion y el acta*/
	delete #tbImagenes
	where nmro_ntfccn!=vlr_nmro_ntfccn
	and  indcdr_acta=1

	delete #tbImagenes
	where nmro_ntfccn=vlr_nmro_ntfccn
	and cnsctvo_sde_acta!=vlr_sde_acta
	and  indcdr_acta=1

	
		
	Insert #tbConsecutivosActas(
			cnsctvo_rdccn_rcbro,
			cnsctvo_cdgo_dcmnto,
			cnsctvo_cdgo_imgn,
			cnsctvo_cdgo_tpo_imgn,
			cnsctvo_imgns
			)
	Select	cnsctvo_rdccn_rcbro,
			cnsctvo_cdgo_dcmnto,
			cnsctvo_cdgo_imgn,
			cnsctvo_cdgo_tpo_imgn,
			row_number() over(partition by cnsctvo_rdccn_rcbro,cnsctvo_cdgo_dcmnto  order by cnsctvo_rdccn_rcbro,cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_imgn) as cnsctvo_imgns
	from #tbImagenes 
	where indcdr_acta=1 
	and cnsctvo_cdgo_tpo_dcmntl = 1 -- CTC
	Order by cnsctvo_rdccn_rcbro, cnsctvo_cdgo_dcmnto, cnsctvo_cdgo_imgn


	update #tbImagenes
	set cnsctvo_imgns= d2.cnsctvo_imgns		
	from #tbImagenes d1 inner join #tbConsecutivosActas d2
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
	and d1.cnsctvo_cdgo_imgn=d2.cnsctvo_cdgo_imgn
	and d1.cnsctvo_rdccn_rcbro=d2.cnsctvo_rdccn_rcbro
	and d1.cnsctvo_cdgo_tpo_imgn= d2.cnsctvo_cdgo_tpo_imgn
	where d1.indcdr_acta=1
	and d1.cnsctvo_cdgo_tpo_dcmntl = 1 -- CTC
	
	Update	#tbImagenes
	Set			cnsctvo_cdgo_tpo_imgn = case When cnsctvo_imgns = 1 then 135
											 When cnsctvo_imgns = 2 then 135
											 When cnsctvo_imgns = 3 then 225
											 else   cnsctvo_cdgo_tpo_imgn
										End,
				actlzr_tbla =			case When cnsctvo_imgns = 1 then 1
											 When cnsctvo_imgns = 2 then 1
										     When cnsctvo_imgns = 3 then 1 
											 else actlzr_tbla
										End
    Where cnsctvo_cdgo_tpo_dcmntl = 1 -- CTC
	And  indcdr_acta=1
	and orgn_imgn=2
	

	
	

	
	/*3 realizar la busqueda por recobro radicado*/
	Insert #tbImagenes(
		cnsctvo_rdccn_rcbro, tpo_idntfccn_afldo,nmro_idntfccn_afldo,nmro_ntfccn, cnsctvo_sde_acta,cnsctvo_cdgo_imgn,cnsctvo_cdgo_tpo_imgn,cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_tpo_sprte_dcmntl,nmro_acta_ctc,indcdr_acta,orgn_imgn
	)
	Select Distinct d1.cnsctvo_rdccn_rcbro,d1.cdgo_tpo_idntfccn_afldo,d1.nmro_idntfccn_afldo,d1.nmro_ntfccn,  d1.cnsctvo_sde_acta,d3.cnsctvo_cdgo_imgn,d3.cnsctvo_cdgo_tpo_imgn, d3.cnsctvo_cdgo_dcmnto, 0 as 	cnsctvo_cdgo_tpo_sprte_dcmntl,case d3.cnsctvo_cdgo_tpo_imgn when 135 then d1.vlr_nmro_acta_ctc else 0 end as nmro_acta_ctc,0,3
	
	from  #tmpRecobros d1 Inner Join		tbIndicesxDocumentosDigitalizados d2 with(nolock)	
	On	 d1.vlr_cnsctvo_rdccn_rcbro=d2.vlr
	inner join tbImagenesxDocumentosDigitalizados d3 with(nolock)	
	on d2.cnsctvo_cdgo_dcmnto=d3.cnsctvo_cdgo_dcmnto
	left join #tbImagenes dx
	on dx.cnsctvo_cdgo_imgn=d3.cnsctvo_cdgo_imgn
	where d2.cnsctvo_cdgo_tpo_indce = 9  -- Numero Recobros
	and d3.cnsctvo_cdgo_imgn is null
	and d3.cnsctvo_cdgo_tpo_imgn not in(0,999)


	/*marcar busqueda que fue por recobros */
	
	update #tbImagenes
	set orgn_imgn=3 --recobros
	--select * 
	from #tbImagenes d1 inner join 	tbIndicesxDocumentosDigitalizados d2 with(nolock)	
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
	and d1.vlr_nmro_rcbro= d2.vlr
	where d2.cnsctvo_cdgo_tpo_indce=9
	and  d1.orgn_imgn!=3
	/*20180628 ajuste detectado genera problema */
	and isnumeric(d2.vlr)=1
	
	/*calcular el afiliado que tiene asigana las imagenes*/
	update #tbImagenes
	set vlr_tpo_idntfccn_afldo= d2.vlr
	from #tbImagenes d1 inner join tbIndicesxImagenesDigitalizadas d2 with(nolock)	
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
	and d1.cnsctvo_cdgo_imgn=d2.cnsctvo_cdgo_imgn
	where d2.cnsctvo_cdgo_tpo_indce=16
	
	--update #tbImagenes set vlr_nmro_idntfccn_afldo=null, vlr_tpo_idntfccn_afldo=null
	
	update #tbImagenes
	set vlr_nmro_idntfccn_afldo= d2.vlr
	from #tbImagenes d1 inner join tbIndicesxImagenesDigitalizadas d2 with(nolock)	
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
	and d1.cnsctvo_cdgo_imgn=d2.cnsctvo_cdgo_imgn
	where d2.cnsctvo_cdgo_tpo_indce=1
	
	--delete #tbDocumentosImagenAfiliado
	Insert #tbDocumentosImagenAfiliado(
		cnsctvo_cdgo_dcmnto,
		cdgo_tpo_idntfccn_afldo,
		nmro_idntfccn_afldo

	)Select Distinct cnsctvo_cdgo_dcmnto,
					  vlr_tpo_idntfccn_afldo,
					  vlr_nmro_idntfccn_afldo
	from #tbImagenes
	where vlr_nmro_idntfccn_afldo  is not null

	update #tbImagenes
	set vlr_tpo_idntfccn_afldo=d2.cdgo_tpo_idntfccn_afldo,
		vlr_nmro_idntfccn_afldo=d2.nmro_idntfccn_afldo
	--select *
	from #tbImagenes d1 inner join #tbDocumentosImagenAfiliado d2
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
	where d1.vlr_nmro_idntfccn_afldo  is null

	/*quitar imagenes no corresponde al afiliado donde se haya calculado este dato*/	
	delete #tbImagenes
	where vlr_nmro_idntfccn_afldo is not  null 
	and  ltrim(rtrim(nmro_idntfccn_afldo)) != ltrim(rtrim(vlr_nmro_idntfccn_afldo))


	insert #tbImagenesObligatorias(
		cnsctvo_rdccn_rcbro			,
		cnsctvo_cdgo_clsfccn_atncn	,
		cnsctvo_cdgo_imgn			,
		cnsctvo_cdgo_tpo_imgn		,
		cnsctvo_cdgo_dcmnto			,
		cnsctvo_cdgo_tpo_sprte_dcmntl,
		cnsctvo_cdgo_estdo_imgn_rcbro,
		cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro,
		fcha_crcn,
		usro_crcn,
		nmro_acta,
		orgn_imgn,
		gd_tpo_idntfccn_afldo,
		gd_nmro_idntfccn_afldo
		)

	Select	Distinct d1.cnsctvo_rdccn_rcbro,
			d1.cnsctvo_cdgo_clsfccn_atncn,
			d2.cnsctvo_cdgo_imgn,
			d2.cnsctvo_cdgo_tpo_imgn,
			d2.cnsctvo_cdgo_dcmnto,
			d1.cnsctvo_cdgo_tpo_sprte_dcmntl,
			2,
			2,
			getdate(),
			'Migra01',
			case d2.cnsctvo_cdgo_tpo_imgn when 135 then d2.nmro_acta_ctc else null end as nmro_acta_ctc,
			d2.orgn_imgn,
			d2.vlr_tpo_idntfccn_afldo,
			d2.vlr_nmro_idntfccn_afldo
	from temporal.dbo.tmpRecobrosxImagen d1 with(nolock) inner join #tbImagenes d2
	on d1.cnsctvo_rdccn_rcbro = d2.cnsctvo_rdccn_rcbro
	and d1.cnsctvo_cdgo_tpo_imgn=d2.cnsctvo_cdgo_tpo_imgn
	
	update #tbImagenesObligatorias
	set cnsctvo_ntfccn = d2.nmro_ntfccn,
		cnsctvo_cdgo_sde= d2.cnsctvo_sde_acta,
		nmro_acta=d2.nmro_acta_ctc
	from #tbImagenesObligatorias d1 inner join #tmpRecobros d2
	on d1.cnsctvo_rdccn_rcbro=d2.cnsctvo_rdccn_rcbro
	where d1.cnsctvo_cdgo_tpo_sprte_dcmntl = 1 --marca actas
	
	/*asumir que todas las actas vienen dobles*/
	update #tbImagenesObligatorias
	set dplcdo=1
	where cnsctvo_cdgo_tpo_imgn=135

	/*validar que seleccione un documento del ultimo acta*/	
	update #tbImagenesObligatorias
	set fcha_dgtlzcn=d2.fcha_dgtlzcn,
		cnsctvo_cdgo_tpo_dcmnto= d2.cnsctvo_cdgo_tpo_dcmntl
	from #tbImagenesObligatorias d1 inner join tbDocumentosDigitalizados d2
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
		
	Insert #tbRevisionDuplicidad(nmro_acta_ctc, cnsctvo_cdgo_tpo_imgn,fcha_dgtlzcn)
	Select nmro_acta,cnsctvo_cdgo_tpo_imgn, max(fcha_dgtlzcn) as fcha_dgtlzcn
	from #tbImagenesObligatorias
	group by nmro_acta,cnsctvo_cdgo_tpo_imgn

	/*activa los documentos que no son duplicados*/
	
	update #tbImagenesObligatorias
	set dplcdo=0
	from #tbImagenesObligatorias d1 inner join #tbRevisionDuplicidad d2
	on d1.nmro_acta=d2.nmro_acta_ctc
	and d1.cnsctvo_cdgo_tpo_imgn=d2.cnsctvo_cdgo_tpo_imgn
	where d1.fcha_dgtlzcn=d2.fcha_dgtlzcn

	/*descartar registros duplicados*/
	delete #tbImagenesObligatorias	where  dplcdo=1


	/*validacione de existencia de imagen */
	
	Insert #tbRutasImagenes(
		cnsctvo_cdgo_imgn
	)Select distinct cnsctvo_cdgo_imgn
	from #tbImagenesObligatorias 

	update #tbRutasImagenes
	set rta_imgn=d2.rta_imgn
	from #tbRutasImagenes d1 inner join tbImagenesxDocumentosDigitalizados d2
	on d1.cnsctvo_cdgo_imgn= d2.cnsctvo_cdgo_imgn

	
	insert #tbConteoRutas(rta_imgn,cntdd,cnsctvo_cdgo_imgn)
	select rta_imgn, count(*) as cntdd, max(cnsctvo_cdgo_imgn) 
	from #tbRutasImagenes
	group by rta_imgn
	
	
	update #tbRutasImagenes
	set vlda_imgn=0 /*es valida la ruta*/
	from #tbRutasImagenes d1 inner join #tbConteoRutas d2
	on d1.cnsctvo_cdgo_imgn=d2.cnsctvo_cdgo_imgn
	where d2.cntdd=1

	update #tbRutasImagenes
	set vlda_imgn=0 /*es valida la ruta*/
	from #tbRutasImagenes d1 inner join #tbConteoRutas d2
	on d1.cnsctvo_cdgo_imgn=d2.cnsctvo_cdgo_imgn
	where d2.cntdd>1



	/*validar existencia archivo en la ruta de atlas */
	update #tbRutasImagenes
	set rta_imgn='\\atlas'+ltrim(rtrim(rta_imgn))

	/*verifica si existe el archivo en la ruta*/
	update #tbRutasImagenes
	set exste = d2.exste
	from #tbRutasImagenes d1 inner join temporal.dbo.tbExistenciaRutaImagen d2
	on d1.cnsctvo_cdgo_imgn = d2.cnsctvo_cdgo_imgn

	update #tbRutasImagenes
	set exste= BDGestionDocumental.dbo.fnValidarExisteArchivo(rta_imgn)
	where vlda_imgn=0
	and exste=0


	update #tbRutasImagenes
	set vlda_imgn=1
	where exste=0

	/*eliminar imagenes invalidas que no deben asociarse*/
	
	update #tbImagenesObligatorias
	set vlda_imgn=d2.vlda_imgn
	from #tbImagenesObligatorias d1  inner join #tbRutasImagenes d2
	on d1.cnsctvo_cdgo_imgn=d2.cnsctvo_cdgo_imgn
	
	update #tbImagenes
	set vlda_imgn=d2.vlda_imgn
	from #tbImagenes d1  inner join #tbRutasImagenes d2
	on d1.cnsctvo_cdgo_imgn=d2.cnsctvo_cdgo_imgn
	
	/*se coloca por defecto numero de paginas con valor 1*/
	update #tbImagenesObligatorias
	set nmro_pgns_imgn=1

	
	delete temporal.dbo.tbImagenesObligatoriasRecobros
	
	insert temporal.dbo.tbImagenesObligatoriasRecobros(
		cnsctvo_rdccn_rcbro,
		cnsctvo_cdgo_clsfccn_atncn,
		cnsctvo_cdgo_imgn,
		cnsctvo_cdgo_tpo_imgn,
		cnsctvo_cdgo_dcmnto,
		cnsctvo_cdgo_tpo_sprte_dcmntl,
		cnsctvo_cdgo_estdo_imgn_rcbro,
		cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro,
		cnsctvo_ntfccn,
		cnsctvo_cdgo_sde,
		nmro_acta,
		fcha_crcn,
		usro_crcn,
		cnsctcvo_ordn_imprsn,
		nmro_pgns_imgn,
		cnsctvo_cdgo_tpo_dcmnto,
		cnsctvo_cdgo_ofcna,
		orgn_imgn,
		gd_tpo_idntfccn_afldo,
		gd_nmro_idntfccn_afldo

	)
	Select  Distinct 
		cnsctvo_rdccn_rcbro,
		cnsctvo_cdgo_clsfccn_atncn,
		cnsctvo_cdgo_imgn,
		cnsctvo_cdgo_tpo_imgn,
		cnsctvo_cdgo_dcmnto,
		cnsctvo_cdgo_tpo_sprte_dcmntl,
		cnsctvo_cdgo_estdo_imgn_rcbro,
		cnsctvo_cdgo_csa_estdo_estdo_imgn_rcbro,
		cnsctvo_ntfccn,
		cnsctvo_cdgo_sde,
		nmro_acta,
		fcha_crcn,
		usro_crcn,
		cnsctcvo_ordn_imprsn,
		nmro_pgns_imgn,
		cnsctvo_cdgo_tpo_dcmnto,
		cnsctvo_cdgo_sde,
		orgn_imgn,
		gd_tpo_idntfccn_afldo,
		gd_nmro_idntfccn_afldo
	from #tbImagenesObligatorias
	where vlda_imgn=0  /*es valida la ruta*/
	
	
	/*actualizar el tipo de imagen ya que se esta modificando */
	delete temporal.dbo.tbMarcasImagen

	Insert temporal.dbo.tbMarcasImagen(
		cnsctvo_cdgo_dcmnto,
		cnsctvo_cdgo_imgn,
		cnsctvo_cdgo_tpo_imgn_antr,
		cnsctvo_cdgo_tpo_imgn_nvo,
		vlda_imgn						
	)Select Distinct d1.cnsctvo_cdgo_dcmnto,
			d1.cnsctvo_cdgo_imgn,
			d1.cnsctvo_cdgo_tpo_imgn,
			d2.cnsctvo_cdgo_tpo_imgn,
			d2.vlda_imgn	
	from tbImagenesxDocumentosDigitalizados d1 inner join #tbImagenes d2
	on d1.cnsctvo_cdgo_imgn=d2.cnsctvo_cdgo_imgn
	where d2.actlzr_tbla=1
	and d2.vlda_imgn=0


	--actualizar en la base de datos la imagenes que se les cambio el tipo de imagen
	
	update tbImagenesxDocumentosDigitalizados 
	set cnsctvo_cdgo_tpo_imgn=d2.cnsctvo_cdgo_tpo_imgn
	--select d1.*
	from tbImagenesxDocumentosDigitalizados d1  inner join #tbImagenes d2
	on d1.cnsctvo_cdgo_imgn=d2.cnsctvo_cdgo_imgn
	where d2.actlzr_tbla=1
	and d2.vlda_imgn=0
	

		

End