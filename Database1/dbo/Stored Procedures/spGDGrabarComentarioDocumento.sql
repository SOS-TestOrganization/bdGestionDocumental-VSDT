

CREATE Procedure [dbo].[spGDGrabarComentarioDocumento]
@cnsctvo_cdgo_dcmnto		udtConsecutivo,
@cnsctvo_cdgo_fljo			udtConsecutivo,
@cnsctvo_cdgo_rta			udtConsecutivo,
@cmntro						Varchar(7500),
@fcha_cmntro				Datetime,
@usro_cmntro				Char(30),
@estdo						Int			Output

As
Set Nocount On

Declare	--@cnsctvo_cdgo_cmntro	Int,
		@cnsctvo_cdgo_cmntro	Int

Set		@estdo = 0

Begin Transaction
	Select	@cnsctvo_cdgo_cmntro = IsNull(Max(cnsctvo_cdgo_cmntro)+1,1)
	From	bdGestionDocumental.dbo.tbComentariosDocumentos
	Where	cnsctvo_cdgo_dcmnto = @cnsctvo_cdgo_dcmnto

	Insert Into	bdGestionDocumental.dbo.tbComentariosDocumentos
				(	cnsctvo_cdgo_cmntro,			cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_fljo,
					cnsctvo_cdgo_rta,				cmntro,						fcha_cmntro,
					usro_cmntro
				)
	Values		(
					@cnsctvo_cdgo_cmntro,			@cnsctvo_cdgo_dcmnto,		@cnsctvo_cdgo_fljo,
					@cnsctvo_cdgo_rta,				@cmntro,					@fcha_cmntro,
					@usro_cmntro
				)

	If @@Error != 0
		Begin
			Set @estdo = 1 
			Rollback Transaction
			Return -1
		End
	Else
		Commit Transaction

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarComentarioDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarComentarioDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarComentarioDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarComentarioDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarComentarioDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarComentarioDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarComentarioDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarComentarioDocumento] TO [visosservice_role]
    AS [dbo];

