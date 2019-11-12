



/*---------------------------------------------------------------------------------
* Metodo o PRG 	        :   spConsultarImagenes
* Desarrollado por		:  <\A   Cesar García											A\>
* Descripcion			:  <\D   Procedimiento que consulta las imágenes				D\>
* Descripcion			:  <\D															D\>
* Observaciones		    :  <\O															O\>
* Parametros			:  <\P   numero identificacion, numero formulario				P\>
		                :  <\P															P\>
                        :  <\P															P\>
* Variables				:  <\V															V\>
* Fecha Creacion		:  <\FC 20090226												FC\>
*---------------------------------------------------------------------------------*/
CREATE Procedure	[dbo].[spGDConsultarDocumentosxFlujo]
--Declare
@nmro_idntfccn		varchar(11),
@cnsctvo_cdgo_fljo	udtConsecutivo

As
Set Nocount On

Select			'NO SELECCIONADO' As accn,		cnsctvo_cdgo_imgn,						'2009' As anno,				0 As cnsctvo_agrpdr_imgn,
				fcha_crcn As fcha_dgtlzcn,		0 As cntdd_pgns,						1 As nmro_dsco,				2560 As nmro_frmlro,
				nmro_idntfccn,					'Carlos Alberto Perez' As nmbre_prsna,	'7812' As nmro_cntrto,		2 As nmro_blsa,
				'' As tpo_aflcn,				'POS' As nmbre_cntrto,					'NACIONAL' As sde,			'1' As tpo_dcmnto,
				'2009/01/31' As fcha_rdccn,		10 As nmro,
				rta_fnl_imgn+Convert(Varchar(10),cnsctvo_imgn)+Ltrim(Rtrim(extnsn_imgn)) As rta,
				space(150) As dscrpcn_fljo,		0 As cnsctvo_cdgo_rta,					cnsctvo_cdgo_fljo,			cnsctvo_cdgo_indce
Into			#tmpInfoImagenes
From			bdGestionDocumental.dbo.tbImagenesIndexadas
Where			(nmro_idntfccn		=	@nmro_idntfccn	Or @nmro_idntfccn Is Null)
And				cnsctvo_cdgo_fljo	=	@cnsctvo_cdgo_fljo	
--And				(nmro_frmlro = @nmro_frmlro Or @nmro_frmlro Is Null)


Update			#tmpInfoImagenes
Set				cnsctvo_cdgo_rta		=	rfd.cnsctvo_cdgo_rta
From			bdGestionDocumental.dbo.tbRutasxFlujosDocumentos			rfd
Inner Join		#tmpInfoImagenes											i	On	i.cnsctvo_cdgo_imgn		=	rfd.cnsctvo_cdgo_dcmnto
																				And	i.cnsctvo_cdgo_fljo		=	rfd.cnsctvo_cdgo_fljo
Where			rfd.vsble_usro = 'S'


Update			#tmpInfoImagenes
Set				dscrpcn_fljo	=	f.dscrpcn_fljo
From			bdGestionDocumental.dbo.tbFlujos_Vigencias	f
Inner Join		#tmpInfoImagenes							r	On	r.cnsctvo_cdgo_fljo	=	f.cnsctvo_cdgo_fljo
Where			Getdate()			>=	f.inco_vgnca
And				Getdate()			<=	f.fn_vgnca

-- Código 13/02/2009
Update			#tmpInfoImagenes
Set				cnsctvo_cdgo_indce		=	i.cnsctvo_cdgo_indce
				--rta_dcmnto				=	i.rta_fnl_imgn+Convert(Varchar(10),i.cnsctvo_imgn)+Ltrim(Rtrim(i.extnsn_imgn))
From			#tmpInfoImagenes								t
Inner join		bdGestionDocumental.dbo.tbImagenesIndexadas		i	On	i.cnsctvo_cdgo_imgn		=	t.cnsctvo_cdgo_imgn
-- Código 13/02/2009

Select			accn,							cnsctvo_cdgo_imgn,				anno,						cnsctvo_agrpdr_imgn,
				fcha_dgtlzcn,					cntdd_pgns,						nmro_dsco,					nmro_frmlro,
				nmro_idntfccn,					nmbre_prsna,					nmro_cntrto,				nmro_blsa,
				tpo_aflcn,						nmbre_cntrto,					sde,						tpo_dcmnto,
				fcha_rdccn,						nmro,							rta,						dscrpcn_fljo,
				cnsctvo_cdgo_rta,				cnsctvo_cdgo_fljo,				'N' As prsnta_incnsstnca,	'N' As cndcn1,
				'N' As cndcn2,					'N' As prsnta_incnsstnca2,		cnsctvo_cdgo_indce,			'N' As rps,
				'N' As rps_prsnta_incnsstnca,	'N' As atncn_audtda,			'N' As prsnta_glsa,			'N' As aprba_nta
From			#tmpInfoImagenes

Drop Table		#tmpInfoImagenes



















GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosxFlujo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosxFlujo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosxFlujo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosxFlujo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosxFlujo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosxFlujo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosxFlujo] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosxFlujo] TO [visosservice_role]
    AS [dbo];

