

/*---------------------------------------------------------------------------------    
* Metodo o PRG      :  [spGDGrabarImagenesPrestadoresMasiva] 
* Desarrollado por	: <\A Ing. Carlos Estupiñan							A\>    
* Descripcion		: <\D Iserta los indeces de los documentos digitalizados	D\>    
* Observaciones     : <\O													O\>    
* Parametros		: <\P													P\>    
* Variables			: <\V													V\>    
* Fecha Creacion    : <\FC 2010/06/22										FC\>    
*    
*---------------------------------------------------------------------------------    
* DATOS DE MODIFICACION    
*---------------------------------------------------------------------------------    
* Modificado Por   : <\AM  AM\>    
* Descripcion   : <\DM  DM\>    
* Nuevos Parametros  : <\PM  PM\>    
* Nuevas Variables  : <\VM  VM\>    
* Fecha Modificacion  : <\FM  FM\>    
*---------------------------------------------------------------------------------*/
CREATE Procedure	[dbo].[spGDGrabarImagenesPrestadoresMasiva]
@nmro_idntfccn			Varchar(15),
@nmro_acta				Varchar(15),
@dscrpcn_tpo_anxo		Varchar(20),
@fcha_dgtlzcn			Varchar(10),
@estdo_grbr				Int

As
Set NoCount On

/*
Create Table	#tmpImagenesMasivas
(
nmbre_imgn		Varchar(20),
rta_imgn		Varchar(250)
)
*/

Declare	@tbImagenesxDocumentosDigitalizados As Table
(
cnsctvo_cdgo_imgn		Int,
cnsctvo_cdgo_dcmnto		Int,
cnsctvo_cdgo_tpo_imgn	Int,
rta_imgn				Varchar(250),
prncpl					Char(1),
estdo					Char(1)
)

Begin Transaction
	Declare			@cnsctvo_dcmnto				Int,
					@fcha_crcn					Datetime,
					@nmro_imgns					Int,
					@cnsctvo_cdgo_tpo_dcmntl	Int,
					@cnsctvo_opcn_ejccn			Int,
					@consecFin					Int,
					@consecIni					Int,
					@cnsctvo_cdgo_imgn			Int
	Declare			@tbConsecutivos Table
					(
					consecFin Int,
					consecIni Int
					)

	Set				@fcha_crcn					=	GetDate()
	Set				@cnsctvo_cdgo_tpo_dcmntl	=	16	--Prestadores
	Set				@cnsctvo_opcn_ejccn			=	3
	/*
	Select			@cnsctvo_dcmnto =	Max(cnsctvo_cdgo_dcmnto)+1
	From			bdGestionDocumental.dbo.tbDocumentosDigitalizados
	*/

	Exec			spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn

	Select			@nmro_imgns		=	Count(*)
	From			#tmpImagenesMasivas

	----------------------------------------- Insertar en tbDocumentosDigitalizados -----------------------------------------
	Insert Into		bdGestionDocumental.dbo.tbDocumentosDigitalizados
					(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,	nmro_imgns,			cnsctvo_cdgo_dgtlzdr,
						fcha_dgtlzcn
					)
	Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,	@nmro_imgns,		5,
						@fcha_crcn
					)

	----------------------------------------- Insertar en tbImagenesxDocumentosDigitalizados -----------------------------------------
	Insert Into		@tbImagenesxDocumentosDigitalizados
	Select			0,			@cnsctvo_dcmnto,			999,			rta_dstno,			'N',		'A'
	From			#tmpImagenesMasivas

	/** Calcular */
	Insert Into @tbConsecutivos(consecFin,consecIni)
	Exec		spGDCalcularConsecutivosImagenesDigitalizadas @nmro_imgns

	Select		@consecFin = consecFin,
				@consecIni = consecIni
	From		@tbConsecutivos

	/*
	Declare			@cnsctvo_cdgo_imgn		Int
	Select			@cnsctvo_cdgo_imgn = Max(cnsctvo_cdgo_imgn)
	From			bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
	*/
	
	Update			@tbImagenesxDocumentosDigitalizados
	Set				@consecIni	=	cnsctvo_cdgo_imgn	=	@consecIni + 1


	Insert Into		bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
	Select			*
	From			@tbImagenesxDocumentosDigitalizados
	----------------------------------------- Insertar en tbImagenesxDocumentosDigitalizados -----------------------------------------
	 -- Insertar índices x documentos digitalizadas
	Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
					(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,			vlr	)
	Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		1,								@nmro_idntfccn
					)

	Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
					(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,			vlr	)
	Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		8,								@nmro_acta
					)

	Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
					(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,			vlr	)
	Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		16,								@dscrpcn_tpo_anxo
					)

	Insert Into		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
					(	cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_dcmntl,		cnsctvo_cdgo_tpo_indce,			vlr	)
	Values			(	@cnsctvo_dcmnto,		@cnsctvo_cdgo_tpo_dcmntl,		20,								ltrim(rtrim(@fcha_dgtlzcn))
					)

		If @@error !=	0
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
    ON OBJECT::[dbo].[spGDGrabarImagenesPrestadoresMasiva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesPrestadoresMasiva] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesPrestadoresMasiva] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesPrestadoresMasiva] TO [Coordinador Parametros Vision Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesPrestadoresMasiva] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesPrestadoresMasiva] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesPrestadoresMasiva] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesPrestadoresMasiva] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarImagenesPrestadoresMasiva] TO [visosservice_role]
    AS [dbo];

