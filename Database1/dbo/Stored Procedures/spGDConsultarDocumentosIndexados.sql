


CREATE Procedure [dbo].[spGDConsultarDocumentosIndexados]
--Declare
@nmro_idntfccn		Varchar(20)	=	Null,
@nmro_rdccn			Varchar(20)	=	Null,
@nmro_fctra			Varchar(20)	=	Null,
@nmro_atncn			Varchar(20)	=	Null,
@nmbre_dcmnto		Varchar(50)	=	Null,
@fcha_dsde			Datetime	=	Null,
@fcha_hsta			Datetime	=	Null

As
Set Nocount On

/*
set	@nmro_idntfccn	=	Null
set @nmro_rdccn		=	Null
set @nmro_fctra		=	Null
set @nmro_atncn		=	Null	
set @nmbre_dcmnto	=	Null	
set @fcha_dsde		=	'2009-03-02'
set @fcha_hsta		=	'2009-03-02'
*/

--Create Table #tbImagenesIndexadas
Declare	@tbImagenesIndexadas As Table
(
accn					Varchar(15),
nmbre_imgn				Varchar(150),
nmro_idntfccn			Varchar(20),
nmro_fctra				Varchar(30),
nmro_rdccn				Varchar(30),
nmro_atncn				Varchar(30),
rta_imgn				Varchar(150),  -- Test
--rta_fnl_imgn			Varchar(150),
cnsctvo_cdgo_dcmnto		Int, -- Test
cnsctvo_cdgo_imgn		Int, 
cnsctvo_imgn			Int,
extnsn_imgn				Char(5),
fcha_crcn				Datetime,
usro_crcn				Varchar(15),
rta_mstrr_imgn			Varchar(150),
cnsctvo_cdgo_fljo		Int,
cnsctvo_cdgo_rta		Int,
dscrpcn_fljo			Varchar(100),
cnsctvo_cdgo_indce		Int,
cntdd_dcmntos			Int
)


Declare	@tbTotalDocumentos As Table
(
ttl_dcmnts			Int,
idntfccn			Varchar(30),
cnsctvo_cdgo_indce	Int
)

Insert Into		@tbImagenesIndexadas
Select			'NO SELECCIONADO',					nmbre_imgn,					nmro_idntfccn,			nmro_fctra,
				indice_3,							indice_4,					rta_fnl_imgn,			cnsctvo_cdgo_imgn,	cnsctvo_cdgo_imgn,
				cnsctvo_imgn,						extnsn_imgn,				fcha_crcn,				usro_crcn,
				--rta_fnl_imgn+nmbre_imgn,
				rta_fnl_imgn+Convert(Varchar(10),cnsctvo_imgn)+Ltrim(Rtrim(extnsn_imgn)),
				Case When cnsctvo_cdgo_fljo Is Null Then 0 else cnsctvo_cdgo_fljo end,
				0,									'',							cnsctvo_cdgo_indce,		0
From			dbo.tbImagenesIndexadas
Where			(nmro_idntfccn	=	@nmro_idntfccn	Or	@nmro_idntfccn Is Null)
And				(nmro_fctra		=	@nmro_fctra		Or	@nmro_fctra Is Null)
And				(indice_3		=	@nmro_rdccn		Or	@nmro_rdccn Is Null)
And				(indice_4		=	@nmro_atncn		Or	@nmro_atncn Is Null)
And				(nmbre_imgn like '%'+@nmbre_dcmnto+'%' Or @nmbre_dcmnto Is Null)
And				((Convert(char(8),fcha_crcn) Between Convert(char(8),@fcha_dsde) And Convert(char(8),@fcha_hsta)) Or (@fcha_dsde Is Null And @fcha_hsta Is Null))
--And				crtla			=	'S'

Insert Into		@tbTotalDocumentos
Select			Count(cnsctvo_imgn_pr_crtla), nmro_idntfccn,	cnsctvo_cdgo_indce
From			tbImagenesIndexadas
Where			cnsctvo_cdgo_indce = 1
Group By		nmro_idntfccn,	cnsctvo_cdgo_indce

Insert Into		@tbTotalDocumentos
Select			Count(cnsctvo_imgn_pr_crtla), indice_3,			cnsctvo_cdgo_indce
From			tbImagenesIndexadas
Where			cnsctvo_cdgo_indce = 2
Group By		indice_3,	cnsctvo_cdgo_indce

Insert Into		@tbTotalDocumentos
Select			Count(cnsctvo_imgn_pr_crtla), nmro_fctra,		cnsctvo_cdgo_indce
From			tbImagenesIndexadas
Where			cnsctvo_cdgo_indce =3
Group By		nmro_fctra,	cnsctvo_cdgo_indce

Insert Into		@tbTotalDocumentos
Select			Count(cnsctvo_imgn_pr_crtla), indice_4,			cnsctvo_cdgo_indce
From			tbImagenesIndexadas
Where			cnsctvo_cdgo_indce = 4
Group By		indice_4,	cnsctvo_cdgo_indce


Update			@tbImagenesIndexadas
Set				cntdd_dcmntos			=	t2.ttl_dcmnts
From			@tbImagenesIndexadas	t1
Inner Join		@tbTotalDocumentos		t2	On	t2.idntfccn				=	t1.nmro_idntfccn
											And	t2.cnsctvo_cdgo_indce	=	t1.cnsctvo_cdgo_indce

											Or	t2.idntfccn				=	t1.nmro_fctra
											And	t2.cnsctvo_cdgo_indce	=	t1.cnsctvo_cdgo_indce

											Or	t2.idntfccn				=	t1.nmro_rdccn
											And	t2.cnsctvo_cdgo_indce	=	t1.cnsctvo_cdgo_indce

											Or	t2.idntfccn				=	t1.nmro_atncn
											And	t2.cnsctvo_cdgo_indce	=	t1.cnsctvo_cdgo_indce

Select			*
From			@tbImagenesIndexadas
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosIndexados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosIndexados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosIndexados] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosIndexados] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosIndexados] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosIndexados] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosIndexados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosIndexados] TO [visosservice_role]
    AS [dbo];

