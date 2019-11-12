

/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDGrabarInidicesImagenes
* Desarrollado por:		<\A	Cesar Garcia				A\>
* Descripcion:			<\D	Graba indices de una imagen	D\>
* Descripcion:			<\D   	D\>
* Observaciones:		<\O		O\>
* Parametros:			<\P   	P\>
* Variables:			<\V		V\>
* Fecha Creacion:		<\FC	17/02/2009	FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM		AM\>
* Descripcion:				<\DM		DM\>
* Nuevos Parametros:		<\PM		PM\>
* Nuevas Variables:			<\VM		VM\>
* Fecha Modificacion:		<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[spGDGrabarIndicesImagenes]
@rta_incl_imgn		Varchar(250),
@rta_fnl_imgn		Varchar(150),
@nmbre_imgn			Varchar(150),
@indce1				Varchar(20)	=	Null,
@indce2				Varchar(30)	=	Null,
@indce3				Varchar(30)	=	Null,
@indce4				Varchar(30)	=	Null,
@extnsn_imgn		Char(5),
@fcha_crpta_imgn	Char(6),
@usro_crcn			Char(10),
@obsrvcns			udtObservacion,
@cnsctvo_cdgo_flujo	Int,
@crtla				Char(1),
@indce_cmn			Int,
@estdo				Int		Output,		
@cnsctvo_imgn		Int		Output

As
Set Nocount On


Declare		@cnsctvo_cdgo_tpo_imgn	Int,
			@fcha_crcn				Datetime,
			@cpa_elctrnca			Char(1),
			@actvo					Char(1),
			@cnsctvo_imgn_pr_crtla	Int

Set			@cnsctvo_cdgo_tpo_imgn	=	1
Set			@fcha_crcn				=	Getdate()
Set			@cpa_elctrnca			=	''
Set			@actvo					=	''
		
Begin Transaction
	If Ltrim(Rtrim(@rta_incl_imgn))!=''
		Set @cnsctvo_imgn = IsNull((	Select	Max(cnsctvo_imgn) + 1
										From	bdGestionDocumental.dbo.tbImagenesIndexadas), 1)
	Else
		Set @cnsctvo_imgn = 0	

	If @indce_cmn = 1
		Begin
			Select	@cnsctvo_imgn_pr_crtla	=	IsNull(Max(cnsctvo_imgn_pr_crtla)+1,1)
			From	bdGestionDocumental.dbo.tbImagenesIndexadas
			Where	nmro_idntfccn	=	@indce1
		End
	
	If @indce_cmn = 2
		Begin
			Select	@cnsctvo_imgn_pr_crtla	=	IsNull(Max(cnsctvo_imgn_pr_crtla)+1,1)
			From	bdGestionDocumental.dbo.tbImagenesIndexadas
			Where	indice_3	=	@indce2
		End

	If @indce_cmn = 3
		Begin
			Select	@cnsctvo_imgn_pr_crtla	=	IsNull(Max(cnsctvo_imgn_pr_crtla)+1,1)
			From	bdGestionDocumental.dbo.tbImagenesIndexadas
			Where	nmro_fctra	=	@indce3
		End

	If @indce_cmn = 4
		Begin
			Select	@cnsctvo_imgn_pr_crtla	=	IsNull(Max(cnsctvo_imgn_pr_crtla)+1,1)
			From	bdGestionDocumental.dbo.tbImagenesIndexadas
			Where	indice_4	=	@indce4
		End	

	
	Insert 
	Into		bdGestionDocumental.dbo.tbImagenesIndexadas
	Values	(	@nmbre_imgn,						@cnsctvo_imgn,						@indce1,
				@indce3,							@indce2,							@indce4,								
				@rta_incl_imgn,						@rta_fnl_imgn,						@cnsctvo_cdgo_tpo_imgn,
				@cpa_elctrnca,						@extnsn_imgn,						@fcha_crpta_imgn,
				@fcha_crcn,							@usro_crcn,							@obsrvcns,
				@actvo,								@cnsctvo_cdgo_flujo,				@crtla,
				@cnsctvo_imgn_pr_crtla,				@indce_cmn
			)

	If @@Error != 0
		Begin
			Rollback Transaction
			Return -1
			Set		@estdo = 1
		End
	Else
		Begin
			Commit Transaction
			Return	@cnsctvo_imgn
			Set		@estdo = 0
		End

















GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicesImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicesImagenes] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicesImagenes] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicesImagenes] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicesImagenes] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicesImagenes] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicesImagenes] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarIndicesImagenes] TO [visosservice_role]
    AS [dbo];

