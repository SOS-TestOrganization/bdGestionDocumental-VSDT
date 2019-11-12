
CREATE Procedure	[dbo].[spGDRecuperarCamposArchivoIndice]
@rta_tpo_dcmnto				Varchar(100),
@cnsctvo_cdgo_tpo_dcmnto	UdtConsecutivo	Output,
@mnjo_mlti_tff				UdtConsecutivo	Output

As
Set Nocount On

/*
Declare
@rta_tpo_dcmnto				Varchar(100),
@cnsctvo_cdgo_tpo_dcmnto	UdtConsecutivo,
@crpta_tpo_dcmnto			Varchar(100)

Set	@rta_tpo_dcmnto				=	'FORMULARIOS AFILIACION'
Set	@cnsctvo_cdgo_tpo_dcmnto	=	0
Set	@crpta_tpo_dcmnto			=	'\'+@rta_tpo_dcmnto+'\'
*/

Declare	@tbCamposIndice	As Table
(
cnsctvo_cdgo_tpo_indce		Int,
nmbre						Varchar(50),
ordn_indce					Int,
tpo_dto						Char(1),
tmno						Int					
)

Declare		@crpta_tpo_dcmnto		Varchar(100)
Set			@crpta_tpo_dcmnto		=	'\'+@rta_tpo_dcmnto+'\'

Select		@cnsctvo_cdgo_tpo_dcmnto	=	cnsctvo_cdgo_tpo_dcmnto
From		bdGestionDocumental.dbo.tbTiposDocumento_Vigencias
Where		Upper(rta_tpo_dcmnto)		=	Upper(@crpta_tpo_dcmnto)

Select		@mnjo_mlti_tff	=	mnjo_mlti_tff
From		bdGestionDocumental.dbo.tbTiposDocumento_Vigencias  
Where		cnsctvo_cdgo_tpo_dcmnto = @cnsctvo_cdgo_tpo_dcmnto  

Insert Into	@tbCamposIndice
Select		cnsctvo_cdgo_tpo_indce,		nmbre,		ordn_indce,			'',			Null
From		dbo.tbTiposIndicesxTiposDocumentos
Where		cnsctvo_cdgo_tpo_dcmnto	=	@cnsctvo_cdgo_tpo_dcmnto
Order By	ordn_indce

Update		@tbCamposIndice
Set			tpo_dto		=		a.tpo_dato,
			tmno		=		a.tmno
From		dbo.tbTiposIndices					a
Inner Join	@tbCamposIndice						b	On	b.cnsctvo_cdgo_tpo_indce	=	a.cnsctvo_cdgo_tpo_indce

Select		*
From		@tbCamposIndice
Order By	ordn_indce
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarCamposArchivoIndice] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarCamposArchivoIndice] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarCamposArchivoIndice] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarCamposArchivoIndice] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarCamposArchivoIndice] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarCamposArchivoIndice] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarCamposArchivoIndice] TO [visosservice_role]
    AS [dbo];

