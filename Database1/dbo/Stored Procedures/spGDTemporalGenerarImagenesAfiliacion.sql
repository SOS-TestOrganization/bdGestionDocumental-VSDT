


CREATE Procedure [dbo].[spGDTemporalGenerarImagenesAfiliacion]
@cnsctvo_cdgo_dcmnto_incl	Int,
@cnsctvo_cdgo_dcmnto_fnl	Int

As
Set NoCount On

/*
Declare	@cnsctvo_cdgo_dcmnto_incl	Int,
		@cnsctvo_cdgo_dcmnto_fnl	Int

Set	@cnsctvo_cdgo_dcmnto_incl	=	60053130
Set	@cnsctvo_cdgo_dcmnto_fnl	=	69654772
*/

Create Table	#tmp1
(
cnsctvo_cdgo_dcmnto				Int,
dscrpcn_dgtlzdr					Varchar(50),
dscrpcn_tpo_dcmnto				Varchar(50),
fcha_dgtlzcn					Varchar(50),
blsa							Varchar(50),
tpo_idntfccn					Varchar(50),
nmro_idntfccn					Varchar(50),
tpo_frmlro						Varchar(50),
nmro_frmlro						Varchar(50),
nmro_nvdd						Varchar(50),
nmro_slctd						Varchar(50),
nmro_imgns						Varchar(50),
rta_imgn						Varchar(250),
cnsctvo_cdgo_tpo_frmlro_a		Varchar(50),
nmro_frmlro_a					Varchar(50),
cnsctvo_tpo_idntfccn_ctznte_a	Varchar(50),
nmro_idntfccn_ctznte_a			Varchar(20),
cnsctvo_tpo_idntfccn_bnfcro_a	Varchar(50),
nmro_idntfccn_bnfcro_a			Varchar(20),
fcha_ncmnto_a					Varchar(50),
cnsctvo_cdgo_sxo_a				Varchar(50),
enctrdo							Varchar(10),
prcsdo							Int
)

Insert Into	#tmp1
Select		a.*
From		Formularios20100331		a
Where		Exists (Select 1 
						From tbCotizantesImagenesSinva b 
						Where a.nmro_idntfccn = b.nmro_idntfccn_ctznte)
Order By	a.cnsctvo_cdgo_dcmnto

/*Select		*
From		Formularios20100331		a
Where		a.enctrdo							=	'1'
And			a.cnsctvo_cdgo_tpo_frmlro_a			=	'NULL'
And			a.nmro_frmlro_a						=	'NULL'
And			a.cnsctvo_tpo_idntfccn_ctznte_a		=	'NULL'
And			a.nmro_idntfccn_ctznte_a			=	'NULL'
And			a.cnsctvo_tpo_idntfccn_bnfcro_a		=	'NULL'
And			a.nmro_idntfccn_bnfcro_a			=	'NULL'
And			a.fcha_ncmnto_a						=	'NULL'
And			a.cnsctvo_cdgo_sxo_a				=	'NULL'
And			a.prcsdo							!=	1
Order By	a.cnsctvo_cdgo_dcmnto*/
/*
Select		*
From		Formularios20100331		a
Where		a.enctrdo							=	'1'
And			a.cnsctvo_cdgo_tpo_frmlro_a			!=	'NULL'
And			a.nmro_frmlro_a						!=	'NULL'
And			a.cnsctvo_tpo_idntfccn_ctznte_a		!=	'NULL'
And			a.nmro_idntfccn_ctznte_a			!=	'NULL'
And			a.cnsctvo_tpo_idntfccn_bnfcro_a		!=	'NULL'
And			a.nmro_idntfccn_bnfcro_a			!=	'NULL'
And			a.fcha_ncmnto_a						!=	'NULL'
And			a.cnsctvo_cdgo_sxo_a				!=	'NULL'
And			a.prcsdo							!=	1
Order By	a.cnsctvo_cdgo_dcmnto
*/

Select		a.cnsctvo_cdgo_dcmnto,Ltrim(Rtrim(a.tpo_idntfccn)) As tpo_idntfccn,
			Ltrim(Rtrim(a.nmro_idntfccn)) As nmro_idntfccn,	Ltrim(Rtrim(b.rta_imgn)) As rta_imgn
From		#tmp1								a
Inner Join	tbImagenesxDocumentosDigitalizados	b	On	b.cnsctvo_cdgo_dcmnto	= a.cnsctvo_cdgo_dcmnto
Where		((a.cnsctvo_cdgo_dcmnto	>=	@cnsctvo_cdgo_dcmnto_incl)	And	(a.cnsctvo_cdgo_dcmnto	<=	@cnsctvo_cdgo_dcmnto_fnl))
Order By	a.cnsctvo_cdgo_dcmnto


Update		Formularios20100331
Set			prcsdo	=	2
Where		((cnsctvo_cdgo_dcmnto	>=	@cnsctvo_cdgo_dcmnto_incl)	And	(cnsctvo_cdgo_dcmnto	<=	@cnsctvo_cdgo_dcmnto_fnl))


Drop Table	#tmp1





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTemporalGenerarImagenesAfiliacion] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTemporalGenerarImagenesAfiliacion] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTemporalGenerarImagenesAfiliacion] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTemporalGenerarImagenesAfiliacion] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTemporalGenerarImagenesAfiliacion] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTemporalGenerarImagenesAfiliacion] TO [visosservice_role]
    AS [dbo];

