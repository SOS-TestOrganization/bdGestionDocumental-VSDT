CREATE Procedure	dbo.spGDGenerarVistaInformeFormularios
As
Set Nocount On


Declare	@tmpDatosInformeFinal As Table
(
cnsctvo_cdgo_tpo_frmlro		Int,
dscrpcn_tpo_frmlro			Varchar	(50),
nmro_frmlro					Varchar(20),
fcha_dgtcn_rdccn			Datetime,
estdo						Varchar(15),
cnsctvo						Int
)

Insert Into	@tmpDatosInformeFinal
Select		*
From		#tmpDatosInforme


Declare	@tmpFinal As Table
(
fcha_dgtcn			Datetime,
dscrpcn_tpo_frmlro	Varchar	(50),
ttl_dgtdo			Int,
ttl_dgtlzdo			Int
)

Declare	@tmpFinal2 As Table
(
fcha_dgtcn			Datetime,
dscrpcn_tpo_frmlro	Varchar	(50),
ttl_dgtdo			Int,
ttl_dgtlzdo			Int
)

Insert Into	@tmpFinal
Select		fcha_dgtcn_rdccn,	dscrpcn_tpo_frmlro,		Count(estdo),		0
From		@tmpDatosInformeFinal
Where		estdo	=	'Digitado'
Group By	fcha_dgtcn_rdccn,	dscrpcn_tpo_frmlro

Insert Into	@tmpFinal
Select		fcha_dgtcn_rdccn,	dscrpcn_tpo_frmlro,		0,					Count(estdo)
From		@tmpDatosInformeFinal	a
Where		a.estdo	=	'Digitalizado'
Group By	a.fcha_dgtcn_rdccn,	a.dscrpcn_tpo_frmlro

Insert Into	@tmpFinal2
Select		*
From		@tmpFinal

Update		@tmpFinal
Set			ttl_dgtlzdo	=	b.ttl_dgtlzdo
From		@tmpFinal	a
Inner Join	@tmpFinal2	b	On	b.dscrpcn_tpo_frmlro	=	a.dscrpcn_tpo_frmlro
							And	b.fcha_dgtcn			=	a.fcha_dgtcn
Where		b.ttl_dgtlzdo != 0

		
Select		*
From		@tmpFinal
Where		ttl_dgtdo !=0


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarVistaInformeFormularios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarVistaInformeFormularios] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarVistaInformeFormularios] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

