
CREATE Procedure [dbo].[spGDRecuperarTiposDocumentoxTipoDocumental]

As
Set Nocount On

Declare		@tbTiposDocumento As Table
(
dscrpcn_tpo_dcmnto			Varchar(100),
cdgo_tpo_dcmnto				Varchar(10),
cnsctvo_cdgo_tpo_dcmnto		Int,
cnsctvo_cdgo_tpo_dcmntl		Int
)

Insert Into	@tbTiposDocumento
Select		Upper(dscrpcn_tpo_dcmnto),		cdgo_tpo_dcmnto,		cnsctvo_cdgo_tpo_dcmnto,		cnsctvo_agrpdr_tpo_dcmntl
From		tbTiposDocumento_Vigencias
Where		Getdate()	>=	inco_vgnca
And			Getdate()	<=	fn_vgnca
And			vsble_usro	=	'S'


Insert Into	@tbTiposDocumento
Values	('TODOS',	'99',	99,		1)

Insert Into	@tbTiposDocumento
Values	('TODOS',	'99',	99,		2)

Insert Into	@tbTiposDocumento
Values	('TODOS',	'99',	99,		3)

Insert Into	@tbTiposDocumento
Values	('TODOS',	'99',	99,		4)

Select		dscrpcn_tpo_dcmnto,			cdgo_tpo_dcmnto,		cnsctvo_cdgo_tpo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl
From		@tbTiposDocumento


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentoxTipoDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentoxTipoDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentoxTipoDocumental] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentoxTipoDocumental] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentoxTipoDocumental] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDRecuperarTiposDocumentoxTipoDocumental] TO [visosservice_role]
    AS [dbo];

