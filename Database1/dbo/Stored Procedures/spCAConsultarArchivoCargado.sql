CREATE Procedure	dbo.spCAConsultarArchivoCargado
--Declare
@cnsctvo_cdgo_dgtlzdr		Int,
@fcha_cnslta				Datetime,
@cnsctvo_cdgo_tpo_dcmnto	Int

As
Set Nocount On

/*
Set			@cnsctvo_cdgo_dgtlzdr		=	2
Set			@fcha_cnslta				=	'2009/07/24'
Set			@cnsctvo_cdgo_tpo_dcmnto	=	1
Set         @testcase = 'This is a Test Case'
*/



If Exists	(	Select		1
				From		
				bdGestionDocumental.dbo.tbProcesosCargaImagenes
				Where			cnsctvo_cdgo_dgtlzdr		=	@cnsctvo_cdgo_dgtlzdr
				And				cnsctvo_cdgo_tpo_dcmnto		=	@cnsctvo_cdgo_tpo_dcmnto
				And				fcha_crga_prvdr				=	@fcha_cnslta
			)
	Begin
		Select	cntdd_rgstrs_crgds,		fcha_crcn,		nmbre_archvo_indce,		1 As estdo
		From	bdGestionDocumental.dbo.tbProcesosCargaImagenes
		Where	cnsctvo_cdgo_dgtlzdr		=	@cnsctvo_cdgo_dgtlzdr
		And		cnsctvo_cdgo_tpo_dcmnto		=	@cnsctvo_cdgo_tpo_dcmnto
		And		fcha_crga_prvdr				=	@fcha_cnslta
	End
Else
	Select 0 As estdo
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCAConsultarArchivoCargado] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCAConsultarArchivoCargado] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCAConsultarArchivoCargado] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCAConsultarArchivoCargado] TO [visosservice_role]
    AS [dbo];

