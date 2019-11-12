

CREATE procedure [dbo].[spValidacionFacturasDigitalizadas]
@cnsctvo_cdgo_prcso_crga_imgn	Int

As

Select	Distinct cnsctvo_cdgo_prcso_crga_imgn
Into	#cargas
From	bdGestionDocumental.dbo.tbRegistrosArchivosIndices
Where	estdo_vldcn Is Null
And		cnsctvo_cdgo_tpo_dcmnto			=	2
And		cnsctvo_cdgo_prcso_crga_imgn	=	@cnsctvo_cdgo_prcso_crga_imgn

Update			bdGestionDocumental.dbo.tbRegistrosArchivosIndices
Set				estdo_vldcn = case when b.cnsctvo_rdccn_rcbro is null then 1 else 0 end
From			bdGestionDocumental.dbo.tbRegistrosArchivosIndices	a
Left Outer Join	bdSiSalud.dbo.tbcrRadicacionEventoRecobrable		b		On	a.indce1						= b.nmro_rdccn
																			And a.indce2						= b.cnsctvo_rdccn_rcbro
Inner Join		#cargas												c		On	a.cnsctvo_cdgo_prcso_crga_imgn	= c.cnsctvo_cdgo_prcso_crga_imgn
Where			a.cnsctvo_cdgo_tpo_dcmnto = 2

Insert
Into			bdGestionDocumental.dbo.tbLogValidaciones
				(	cnsctvo_cdgo_prcso_crga_imgn,
					cnsctvo_cdgo_tpo_vldcn,
					nmbre_archvo
				)
Select Distinct	a.cnsctvo_cdgo_prcso_crga_imgn,
				1 as cnsctvo_cdgo_tpo_vldcn, -- validación de facturas
				a.nmbre_archvo
From			bdGestionDocumental.dbo.tbRegistrosArchivosIndices	a
Inner Join		#cargas												b	On	a.cnsctvo_cdgo_prcso_crga_imgn = b.cnsctvo_cdgo_prcso_crga_imgn
Where			a.estdo_vldcn		=	1

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionFacturasDigitalizadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionFacturasDigitalizadas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionFacturasDigitalizadas] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionFacturasDigitalizadas] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spValidacionFacturasDigitalizadas] TO [visosservice_role]
    AS [dbo];

