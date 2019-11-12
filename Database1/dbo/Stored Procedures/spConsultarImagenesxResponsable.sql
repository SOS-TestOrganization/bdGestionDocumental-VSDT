


/*---------------------------------------------------------------------------------
* Metodo o PRG 	        :   spConsultarImagenesxResponsable
* Desarrollado por		:  <\A   Cesar García											A\>
* Descripcion			:  <\D   Procedimiento que consulta las imágenes				D\>
* Descripcion			:  <\D															D\>
* Observaciones		    :  <\O															O\>
* Parametros			:  <\P   numero identificacion, numero formulario				P\>
		                :  <\P															P\>
                        :  <\P															P\>
* Variables				:  <\V															V\>
* Fecha Creacion		:  <\FC 20090121												FC\>
*---------------------------------------------------------------------------------*/
CREATE Procedure	[dbo].[spConsultarImagenesxResponsable]
--Declare
@usro_gstn			Varchar(30)

As
Set Nocount On

Select			ia.cnsctvo_cdgo_imgn,				ia.anno,							ia.cnsctvo_agrpdr_imgn,
				ia.fcha_dgtlzcn,					ia.cntdd_pgns,						ia.nmro_dsco,
				ia.nmro_frmlro,						ia.nmro_idntfccn,					ia.nmbre_prsna,
				ia.nmro_cntrto,						ia.nmro_blsa,						ia.tpo_aflcn,
				ia.nmbre_cntrto,					ia.sde,								ia.tpo_dcmnto,
				ia.fcha_rdccn,						ia.nmro,							ia.rta,
				space(100) As dscrpcn_ara_fnte,		space(100) as dscrpcn_ara_dstno,	0 As cnsctvo_cdgo_ara_fnte,
				0 As cnsctvo_cdgo_ara_dstno,		space(100) As dscrpcn_itrcn,		ifd.cnsctvo_cdgo_itrcn,
				iv.rspnsble_itrcn,					fv.nmro_itrcns,						fd.cnsctvo_cdgo_fljo
Into			#tmpInfoImagenes
From			bdAfiliacion.dbo.tbImagenesSoporteAfiliacion			ia
Inner Join		bdGestionDocumental.dbo.tbFlujosxDocumentos				fd	On	fd.cnsctvo_cdgo_dcmnto						=	ia.cnsctvo_cdgo_imgn
																			And	fd.nmro_idntfccn_dcmnto						=	ia.nmro_idntfccn
Inner Join		bdGestionDocumental.dbo.tbIteracionesxFlujoDocumentos	ifd	On	ifd.cnsctvo_cdgo_fljo_pr_dcmnto				=	fd.cnsctvo_cdgo_fljo_pr_dcmnto
Inner Join		bdGestionDocumental.dbo.tbIteraciones_Vigencias			iv	On	iv.cnsctvo_cdgo_itrcn						=	ifd.cnsctvo_cdgo_itrcn
Inner Join		bdGestionDocumental.dbo.tbFlujos_Vigencias				fv	On	fv.cnsctvo_cdgo_fljo						=	fd.cnsctvo_cdgo_fljo
--Where			iv.rspnsble_itrcn	=	@usro_gstn
Where			ifd.vsble_usro		=	'S'
And				fd.vsble_usro		=	'S'


--Código de pueba
Update			#tmpInfoImagenes
Set				cnsctvo_cdgo_itrcn	=	Case	When cnsctvo_cdgo_itrcn + 1 <= nmro_itrcns Then cnsctvo_cdgo_itrcn + 1
												Else	cnsctvo_cdgo_itrcn
										End
From			#tmpInfoImagenes


Update			#tmpInfoImagenes
Set				rspnsble_itrcn	=	a.rspnsble_itrcn
From			#tmpInfoImagenes										i
Inner Join		bdGestionDocumental.dbo.tbFlujosxDocumentos				fd	On	fd.cnsctvo_cdgo_dcmnto						=	i.cnsctvo_cdgo_imgn
																			And	fd.nmro_idntfccn_dcmnto						=	i.nmro_idntfccn
Inner Join		bdGestionDocumental.dbo.tbIteracionesxFlujoDocumentos	ifd	On	ifd.cnsctvo_cdgo_fljo_pr_dcmnto				=	fd.cnsctvo_cdgo_fljo_pr_dcmnto
Inner Join		bdGestionDocumental.dbo.tbIteraciones_Vigencias			a	On	a.cnsctvo_cdgo_itrcn						=	i.cnsctvo_cdgo_itrcn



Update			#tmpInfoImagenes
Set				cnsctvo_cdgo_ara_fnte	=	iv.ara_fnte,
				cnsctvo_cdgo_ara_dstno	=	iv.ara_dstno	
From			bdGestionDocumental.dbo.tbFlujosxDocumentos					f
Inner Join		bdGestionDocumental.dbo.tbIteracionesxFlujoDocumentos		g	On	g.cnsctvo_cdgo_fljo_pr_dcmnto	=	f.cnsctvo_cdgo_fljo_pr_dcmnto
Inner join		bdGestionDocumental.dbo.tbIteraciones_Vigencias				iv	On	iv.cnsctvo_cdgo_itrcn			=	g.cnsctvo_cdgo_itrcn
Inner Join		#tmpInfoImagenes											i	On	i.cnsctvo_cdgo_imgn				=	f.cnsctvo_cdgo_dcmnto
Where			g.vsble_usro = 'S'

Update			#tmpInfoImagenes
Set				dscrpcn_ara_fnte	=	a.dscrpcn_ara
From			bdServiciocliente.dbo.tbAreas_Vigencias	a
Inner Join		#tmpInfoImagenes							f On f.cnsctvo_cdgo_ara_fnte = a.cnsctvo_cdgo_ara
Where			Getdate() >= a.inco_vgnca
And				Getdate() <= a.fn_vgnca

Update			#tmpInfoImagenes
Set				dscrpcn_ara_dstno	=	a.dscrpcn_ara
From			bdServiciocliente.dbo.tbAreas_Vigencias	a
Inner Join		#tmpInfoImagenes							f On f.cnsctvo_cdgo_ara_dstno = a.cnsctvo_cdgo_ara
Where			Getdate() >= a.inco_vgnca
And				Getdate() <= a.fn_vgnca

Update			#tmpInfoImagenes
Set				dscrpcn_itrcn	=	Case When cnsctvo_cdgo_ara_fnte <> 0 And cnsctvo_cdgo_ara_dstno <> 0 Then	dscrpcn_ara_fnte+'  -->  '+dscrpcn_ara_dstno
									Else	'Sin flujo de trabajo'
									End

Select			cnsctvo_cdgo_imgn,				anno,							cnsctvo_agrpdr_imgn,				fcha_dgtlzcn,
				cntdd_pgns,						nmro_dsco,						nmro_frmlro,						nmro_idntfccn,
				nmbre_prsna,					nmro_cntrto,					nmro_blsa,							tpo_aflcn,
				nmbre_cntrto,					sde,							tpo_dcmnto,							fcha_rdccn,
				nmro,							rta,							dscrpcn_itrcn,						cnsctvo_cdgo_fljo
From			#tmpInfoImagenes
Where			rspnsble_itrcn	=	@usro_gstn

Drop Table		#tmpInfoImagenes





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spConsultarImagenesxResponsable] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spConsultarImagenesxResponsable] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spConsultarImagenesxResponsable] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spConsultarImagenesxResponsable] TO [visosservice_role]
    AS [dbo];

