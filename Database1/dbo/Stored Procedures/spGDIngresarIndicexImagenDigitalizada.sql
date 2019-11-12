/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDIngresarIndicexImagenDigitalizada
* Desarrollado por:		<\A	Ing. Jorge Marcos Rincon Ardila	A\>
* Descripcion:			<\D	Ingresa Indice de Imagen Digitalizada	D\>
* Parametros:			<\P   	P\>
* Fecha Creacion:		<\FC	31/05/2010	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:			<\AM		AM\>
* Descripcion:				<\DM		DM\>
* Nuevos Parametros:		<\PM		PM\>
* Nuevas Variables:			<\VM		VM\>
* Fecha Modificacion:		<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spGDIngresarIndicexImagenDigitalizada](
/* 1 */	@consImagen					Int,
/* 2 */	@consDocumento				Int,
/* 3 */	@consTipoDocumento			Int,
/* 4 */	@consTipoIndice				Int,
/* 5 */	@valor						varchar(255), 
/* 6 */	@error						int output
)
As
Begin
	Set Nocount On
	
	--Se settea la variable @error en '0'
	Set @error = 0
	
	Begin Transaction
		Insert Into bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas(
			cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto,		cnsctvo_cdgo_tpo_dcmntl, 
			cnsctvo_cdgo_tpo_indce,		vlr
		) Values (
			@consImagen,				@consDocumento,				@consTipoDocumento, 
			@consTipoIndice,			@valor
		)
	
	If @@Error <> 0
		Begin
			Set @error = 1
			Rollback Transaction
			Return -1
		End
	Else
		Begin
			Commit Transaction
		End

End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarIndicexImagenDigitalizada] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarIndicexImagenDigitalizada] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDIngresarIndicexImagenDigitalizada] TO [visosservice_role]
    AS [dbo];

