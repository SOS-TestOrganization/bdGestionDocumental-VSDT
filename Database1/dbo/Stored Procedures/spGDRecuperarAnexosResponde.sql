

/*-----------------------------------------------------------------------------------
* Metodo o PRG 	        :  spGDRecuperarAnexosResponde
* Desarrollado por	:  <\A    Omar Antonio Granados									A\>
* Descripcion		:  <\D   Consulta el anexo deacuerdo al consecutivo enviado.	D\>
* Observaciones		:  <\O															O\>
* Parametros		:  <\P    Consecutivo de la Imagen					P\>
                        :  <\P												P\>
* Variables		:  <\V												V\>
* Fecha Creacion	:  <\FC  2012/03/07									FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		: <\AM   AM\>
* Descripcion			: <\DM   DM\>
* Nuevos Parametros	 	: <\PM   PM\>
* Nuevas Variables		: <\VM   VM\>
* Fecha Modificacion		: <\FM   FM\>
*---------------------------------------------------------------------------------*/
/*
Exec [dbo].[spGDRecuperarAnexosResponde]  67696231
*/
CREATE Procedure [dbo].[spGDRecuperarAnexosResponde] 
@cnsctvo_cdgo_imgn  Int
    
As
Set NoCount On
    
--Set   @cnsctvo_dcmnto   = 978857294

Declare  @documentosanexos As Table
(
	cnsctvo_cdgo_dcmnto		Int,
	rta_imgn				Varchar(250),
	nmbre_dcmnto			Varchar(255),
	nmro_rdccn				Varchar(50),
	fcha_rdccn				Varchar(50),
	cdgo_cntcto				Varchar(17),
	cnsctvo_cdgo_tpo_imgn	Int,
	cdgo_tpo_imgn			Varchar(10),
	dscrpcn_tpo_imgn		Varchar(150),
	dscrpcn_orgn_dcmnto		Varchar(20),
	cnsctvo_cdgo_imgn		Int
)

Declare			@srvdr_imgn		Varchar(50)
Select			@srvdr_imgn		=	Ltrim(Rtrim(vlr_prmtro_crctr))
From			tbParametrosGenerales_Vigencias
Where			cnsctvo_cdgo_prmtro_gnrl	=	1

   
Insert Into		@documentosanexos
Select			a.cnsctvo_cdgo_dcmnto,			@srvdr_imgn+a.rta_imgn,		'',			'',				'',					'',
				a.cnsctvo_cdgo_tpo_imgn,		'',							'',			'',				cnsctvo_cdgo_imgn
From			tbImagenesxDocumentosDigitalizados a
Where			a.cnsctvo_cdgo_imgn  =	@cnsctvo_cdgo_imgn
And				a.estdo		=	'A'		
  
Update			@documentosanexos  
Set				cdgo_cntcto   =		a.vlr  
From			tbIndicesxDocumentosDigitalizados a,   @documentosanexos b
Where			a.cnsctvo_cdgo_dcmnto		=	b.cnsctvo_cdgo_dcmnto  
And				a.cnsctvo_cdgo_tpo_indce	=	24
  
Update			@documentosanexos
Set				nmbre_dcmnto   =	a.vlr  
From			tbIndicesxDocumentosDigitalizados a,   @documentosanexos b
Where			a.cnsctvo_cdgo_dcmnto		=	b.cnsctvo_cdgo_dcmnto
And				a.cnsctvo_cdgo_tpo_indce	=	22
    
Update			@documentosanexos
Set				nmro_rdccn    =		a.vlr
From			tbIndicesxDocumentosDigitalizados a,   @documentosanexos b
Where			a.cnsctvo_cdgo_dcmnto		=	b.cnsctvo_cdgo_dcmnto
And				a.cnsctvo_cdgo_tpo_indce	=	29
    
Update			@documentosanexos
Set				fcha_rdccn    =		a.vlr
From			tbIndicesxDocumentosDigitalizados a,   @documentosanexos b
Where			a.cnsctvo_cdgo_dcmnto		=	b.cnsctvo_cdgo_dcmnto
And				a.cnsctvo_cdgo_tpo_indce	=	23

Update			@documentosanexos
Set				dscrpcn_orgn_dcmnto    =	a.vlr
From			tbIndicesxDocumentosDigitalizados a,   @documentosanexos b
Where			a.cnsctvo_cdgo_dcmnto		=	b.cnsctvo_cdgo_dcmnto
And				a.cnsctvo_cdgo_tpo_indce	=	30

Update			@documentosanexos
Set				cdgo_tpo_imgn		=	b.cdgo_tpo_imgn,
				dscrpcn_tpo_imgn	=	b.dscrpcn_tpo_imgn
From			@documentosanexos				a  
Inner Join		tbTiposImagenes_Vigencias		b	On b.cnsctvo_cdgo_tpo_imgn  = a.cnsctvo_cdgo_tpo_imgn
    
Select			*
From			@documentosanexos
    
    



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarAnexosResponde] TO [RespondeService]
    AS [dbo];

