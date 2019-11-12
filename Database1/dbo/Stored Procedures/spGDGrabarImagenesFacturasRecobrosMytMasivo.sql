
/*---------------------------------------------------------------------------------    
* Metodo o PRG              : spGDGrabarImagenesFacturasRecobrosMytMasivo
* Desarrollado por			: <\A Meissner Preciado Castaño						A\>    
* Descripcion				: <\D Graba imagenes Facturas Recobros Myt	Masivo	D\>
							  <\D Automático									D\>    
* Observaciones				: <\O												O\>    
* Parametros				: <\P @estdo_grbr: estado grabacion (1 o 0)			P\>    
* Variables					: <\V @cntdr int, @ttl_rgstrs int					V\>    
* Fecha Creacion			: <\FC 2017/03/28									FC\>    
----------------------------------------------------------------------------------    
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM  AM\>
* Descripcion				: <\DM  DM\>
* Nuevos Parametros			: <\PM  PM\>
* Nuevas Variables			: <\VM  VM\>
* Fecha Modificacion		: <\FM 	FM\>
*---------------------------------------------------------------------------------*/

CREATE Procedure	[dbo].[spGDGrabarImagenesFacturasRecobrosMytMasivo]


As

/*
declare @estdo_grbr int
exec bdgestiondocumental.dbo.spGDGrabarImagenesFacturasRecobrosMytMasivo @estdo_grbr
select @estdo_grbr
*/

Set NoCount On

	create table #tbImagenesxDocumentosDigitalizados 
		(
		cnsctvo_cdgo_imgn		Int,
		cnsctvo_cdgo_dcmnto		Int,
		cnsctvo_cdgo_tpo_imgn	Int,
		rta_imgn				Varchar(250),
		prncpl					Char(1),
		estdo					Char(1),
		usro_crcn				Char(30)
		)





Begin Transaction


	Declare	
	@cnsctvo_dcmnto				Int,
	@fcha_crcn					Datetime,
	@nmro_imgns					Int,
	@cnsctvo_cdgo_tpo_dcmntl	Int,
	@cnsctvo_opcn_ejccn			Int,
	@cnsctvo_cdgo_imgn			Int,
	@consecFin					Int,
	@consecIni					Int,
	@usro_crcn					udtUsuario,
	@cnsctvo_cdgo_dgtlzdr		udtConsecutivo,
	@cnsctvo_cdgo_tpo_imgn		udtConsecutivo,
	@cnsctvo_cdgo_tpo_indce1	udtConsecutivo,
	@cnsctvo_cdgo_tpo_indce2	udtConsecutivo,
	@cnsctvo_cdgo_tpo_indce3	udtConsecutivo,
	@cntdr						int,
	@ttl_rgstrs					int


	Set	@fcha_crcn					=	GetDate()
	Set	@cnsctvo_cdgo_tpo_dcmntl	=	32			-- Formato Myt						(tbTiposdocumental)
	Set	@cnsctvo_opcn_ejccn			=	1
	Set	@usro_crcn					=	Substring(System_User,CharIndex('\',System_User) + 1,Len(System_User))
	Set	@cnsctvo_cdgo_dgtlzdr		=	5			-- SOS							(tbDigitalizadores)
	Set	@cnsctvo_cdgo_tpo_imgn		=	223			-- Formato MYT					(tbTiposImagenes)
	Set	@cnsctvo_cdgo_tpo_indce1	=	9			-- Número Recobro				(tbtiposIndices)
	Set	@cnsctvo_cdgo_tpo_indce2	=	64			-- Numero Factura Recobro SOS	(tbtiposIndices)
	Set	@cnsctvo_cdgo_tpo_indce3	=	65			-- Numero Envio					(tbtiposIndices)
	Set	@ttl_rgstrs					=	0			-- cantidad registros tabla		tmpImagenesMyt
	Set	@cntdr						=	1			-- Contador Comienza con primer registro	


-- calculo cantidad de registros que tiene la tabla a procesar
select	@ttl_rgstrs = count(*)
from	bdgestiondocumental.dbo.tmpImagenesMyt


--comienza ciclo para grabar el consecutivo a cada uno de los registros, esto se pone en el where Where	cnsctvo	=	@cntdr
While	@cntdr <=	@ttl_rgstrs
	Begin

	Exec		spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn

	--procesa uno a uno
	set @nmro_imgns	= 1
	--Select		@nmro_imgns		=	Count(*)
	--From		#tmpImagenesMyt	   
	----------------------------------------- Insertar en tbDocumentosDigitalizados -----------------------------------------
	Insert Into	bdGestionDocumental.dbo.tbDocumentosDigitalizados
	(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,			cnsctvo_cdgo_dgtlzdr,		fcha_dgtlzcn	)
	Values			
	(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	@nmro_imgns,		@cnsctvo_cdgo_dgtlzdr,		@fcha_crcn		)

	----------------------------------------- Insertar en tbImagenesxDocumentosDigitalizados -----------------------------------------
	Insert Into	#tbImagenesxDocumentosDigitalizados
	Select		0,		@cnsctvo_dcmnto,	@cnsctvo_cdgo_tpo_imgn,	rta_dstno,	'N',	'A',	@usro_crcn
	From		bdgestiondocumental.dbo.tmpImagenesMyt
	where		cnsctvo = @cntdr


	Update			#tbImagenesxDocumentosDigitalizados
	Set				cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn

	Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
	Select			*
	From			#tbImagenesxDocumentosDigitalizados

	----------------------------------------- Insertar en tbIndicesxDocumentosDigitalizados -----------------------------------------
	 -- Insertar índices x documentos digitalizadas
	Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
	Select			@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		@cnsctvo_cdgo_tpo_indce1,		cnsctvo_fctra_sos_rcbro
	From			bdgestiondocumental.dbo.tmpImagenesMyt
	where			cnsctvo = @cntdr

	Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
	Select			@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		@cnsctvo_cdgo_tpo_indce2,		nmro_fctra_sos
	From			bdgestiondocumental.dbo.tmpImagenesMyt
	where			cnsctvo = @cntdr

	Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
	Select			@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		@cnsctvo_cdgo_tpo_indce3,		nmro_cnsctvo
	From			bdgestiondocumental.dbo.tmpImagenesMyt
	where			cnsctvo = @cntdr

	--Actualizo el consecutivo código imagen en la tabla temporal que irá a gaia
	update	a
	set		a.cnsctvo_cdgo_imgn			=	@cnsctvo_cdgo_imgn
	From	bdgestiondocumental.dbo.tmpImagenesMyt	as	a
	where	a.cnsctvo					 =	@cntdr

	--trunco la tabla para una nueva entrada
	truncate table #tbImagenesxDocumentosDigitalizados

	Set	@cntdr	=	@cntdr + 1
End--While


Commit Transaction


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasRecobrosMytMasivo] TO [rcbrs_usr]
    AS [dbo];

