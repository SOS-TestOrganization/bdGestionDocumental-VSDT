

/*----------------------------------------------------------------------------------                                 
* Metodo o PRG		:	spGDRecuperarTiposImagenesxTipoDocumento                                 
* Desarrollado por  :	<\A Ing. Cesar García																A\>
* Descripcion		:	<\D Este procedimiento realiza la búsqueda de lor tipos de imágenes para SOA.		D\>
						<\D .																				D\>
* Observaciones		:	<\O																					O\>
* Parametros		:	<\P Consecutivo Tipo Documento														P\>
						<\P 																				P\>
* Variables			:	<\V																					V\>
* Fecha Creacion	:	 <\FC 2011/08/23																	FC\>
*/

CREATE Procedure	[dbo].[spGDRecuperarTiposImagenesxTipoDocumento]
@cnsctvo_cdgo_tpo_dcmnto	Int

As
Set NoCount On

Declare		@tbTiposImagenesxTipoDocumento As Table
(
cnsctvo_cdgo_tpo_dcmnto		Int,
cnsctvo_cdgo_tpo_imgn		Int,
cdgo_tpo_imgn				Varchar(5),
dscrpcn_tpo_imgn			Varchar(150)
)

Insert Into	@tbTiposImagenesxTipoDocumento
Select		cnsctvo_cdgo_tpo_dcmnto,		cnsctvo_cdgo_tpo_imgn,		'',				''
From		tbTiposImagenesxTiposDocumento
Where		cnsctvo_cdgo_tpo_dcmnto		=	@cnsctvo_cdgo_tpo_dcmnto


Update		@tbTiposImagenesxTipoDocumento
Set			cdgo_tpo_imgn		=	b.cdgo_tpo_imgn,
			dscrpcn_tpo_imgn	=	b.dscrpcn_tpo_imgn
From		@tbTiposImagenesxTipoDocumento		a
Inner Join	tbTiposImagenes_Vigencias			b	On	b.cnsctvo_cdgo_tpo_imgn		=	a.cnsctvo_cdgo_tpo_imgn

Select		cnsctvo_cdgo_tpo_imgn,		cdgo_tpo_imgn,			dscrpcn_tpo_imgn
From		@tbTiposImagenesxTipoDocumento
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposImagenesxTipoDocumento] TO [Prestaciones Economicas]
    AS [dbo];

