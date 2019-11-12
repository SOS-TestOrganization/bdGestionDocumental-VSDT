
/*---------------------------------------------------------------------------------    
* Metodo o PRG              : spGDGrabarImagenesFacturasRecobrosMyt
* Desarrollado por			: <\A Luis Fernando Benavides						 A\>    
* Descripcion				: <\D Graba imagenes Facturas Recobros Myt			 D\>    
* Observaciones				: <\O O\>    
* Parametros				: <\P @estdo_grbr: estado grabacion (1 o 0)			 P\>    
* Variables					: <\V V\>    
* Fecha Creacion			: <\FC 2014/02/15									FC\>    
----------------------------------------------------------------------------------    
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM Luis Fernando Benavides AM\>
* Descripcion				: <\DM RESO 458 QUICK: 2015-00001-000031717 DM\>
* Nuevos Parametros			: <\PM @cnsctvo_cdgo_imgn: Agrega parametro que retorna el codigo de la imagen PM\>
* Nuevas Variables			: <\VM  VM\>
* Fecha Modificacion		: <\FM 2015/10/08	FM\>
*---------------------------------------------------------------------------------*/

CREATE Procedure	[dbo].[spGDGrabarImagenesFacturasRecobrosMyt]
@estdo_grbr				Int Output,
@cnsctvo_cdgo_imgn		Int = 0 Output
As

Set NoCount On

Declare	@tbImagenesxDocumentosDigitalizados As Table
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
	/*@cnsctvo_cdgo_imgn			Int,*/
	@consecFin					Int,
	@consecIni					Int,
	@usro_crcn					udtUsuario,
	@cnsctvo_cdgo_dgtlzdr		udtConsecutivo,
	@cnsctvo_cdgo_tpo_imgn		udtConsecutivo,
	@cnsctvo_cdgo_tpo_indce1	udtConsecutivo,
	@cnsctvo_cdgo_tpo_indce2	udtConsecutivo,
	@cnsctvo_cdgo_tpo_indce3	udtConsecutivo

	Declare	@tbConsecutivos Table
	(
	consecFin Int,
	consecIni Int
	)

	Set	@fcha_crcn					=	GetDate()
	Set	@cnsctvo_cdgo_tpo_dcmntl	=	32			-- Formato Myt						(tbTiposdocumental)
	Set	@cnsctvo_opcn_ejccn			=	1
	Set	@usro_crcn					=	Substring(System_User,CharIndex('\',System_User) + 1,Len(System_User))
	Set	@cnsctvo_cdgo_dgtlzdr		=	5			-- SOS							(tbDigitalizadores)
	Set	@cnsctvo_cdgo_tpo_imgn		=	223			-- Formato MYT					(tbTiposImagenes)
	Set	@cnsctvo_cdgo_tpo_indce1	=	9			-- Número Recobro				(tbtiposIndices)
	Set	@cnsctvo_cdgo_tpo_indce2	=	64			-- Numero Factura Recobro SOS	(tbtiposIndices)
	Set	@cnsctvo_cdgo_tpo_indce3	=	65			-- Numero Envio					(tbtiposIndices)
			
	Exec		spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn

	Select		@nmro_imgns		=	Count(*)
	From		#tmpImagenesMyt	   
	----------------------------------------- Insertar en tbDocumentosDigitalizados -----------------------------------------
	Insert Into	bdGestionDocumental.dbo.tbDocumentosDigitalizados
	(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,			cnsctvo_cdgo_dgtlzdr,		fcha_dgtlzcn	)
	Values			
	(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	@nmro_imgns,		@cnsctvo_cdgo_dgtlzdr,		@fcha_crcn		)

	----------------------------------------- Insertar en tbImagenesxDocumentosDigitalizados -----------------------------------------
	Insert Into	@tbImagenesxDocumentosDigitalizados
	Select		0,		@cnsctvo_dcmnto,	@cnsctvo_cdgo_tpo_imgn,	rta_dstno,	'N',	'A',	@usro_crcn
	From		#tmpImagenesMyt

	/** Calcular */
	/*
	Insert Into	@tbConsecutivos(consecFin,consecIni)
	Exec		spGDCalcularConsecutivosImagenesDigitalizadas @nmro_imgns

	Select		@consecFin = consecFin,
				@consecIni = consecIni
	From		@tbConsecutivos

	Update			@tbImagenesxDocumentosDigitalizados
	Set				@consecIni	=	cnsctvo_cdgo_imgn	=	@consecIni + 1
	*/
	Update			@tbImagenesxDocumentosDigitalizados
	Set				cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn

	Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
	Select			*
	From			@tbImagenesxDocumentosDigitalizados
	----------------------------------------- Insertar en tbIndicesxDocumentosDigitalizados -----------------------------------------
	 -- Insertar índices x documentos digitalizadas
	Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
	Select			@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		@cnsctvo_cdgo_tpo_indce1,		cnsctvo_fctra_sos_rcbro
	From			#tmpImagenesMyt

	Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
	Select			@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		@cnsctvo_cdgo_tpo_indce2,		nmro_fctra_sos
	From			#tmpImagenesMyt

	Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
	Select			@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		@cnsctvo_cdgo_tpo_indce3,		nmro_cnsctvo
	From			#tmpImagenesMyt


IF @@error !=	0
	Begin
		Set	@estdo_grbr	=	1
		Rollback Transaction
	End
Else
	Begin
		Set	@estdo_grbr	=	0
		Commit Transaction
	End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasRecobrosMyt] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasRecobrosMyt] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasRecobrosMyt] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasRecobrosMyt] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasRecobrosMyt] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasRecobrosMyt] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesFacturasRecobrosMyt] TO [visosservice_role]
    AS [dbo];

