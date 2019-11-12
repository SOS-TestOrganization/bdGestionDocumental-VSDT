/*---------------------------------------------------------------------------------
* Metodo o PRG:			spGDModificarIndicesImagen
* Desarrollado por:		<\A	Jorge Marcos Rincón Ardila	A\>
* Descripcion:			<\D	Modificar los Indices de una Imagen	D\>
* Parametros:			<\P   	P\>
* Fecha Creacion:		<\FC	08/01/2009	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por:				<\AM		AM\>
* Descripcion Modificacion:		<\DM		DM\>
* Fecha Modificacion:			<\FM		FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spGDModificarIndicesImagen] 
/* 1 */		@consDocumento			Int, 
/* 2 */		@consAnexo				Int, 
/* 3 */		@codiTipoId				varchar(20), 
/* 4 */		@numeroId				varchar(50), 
/* 5 */		@consTipoImagen			Int, 
/* 6 */		@error					Int Output,
/* 7 */		@consCiudadNacimiento	Int = null


AS

BEGIN
	SET NOCOUNT ON;
	
	--Se settea la variable @error en '0'
	Set @error = 0
	
	Declare @consTipoDocumento		int, 
			@existeTipoId			int, 
			@existeNumeroId			int,
			@existeCiudadNacimiento int
	
	Set @consTipoDocumento = IsNull((Select cnsctvo_cdgo_tpo_dcmntl From tbDocumentosDigitalizados 
									Where cnsctvo_cdgo_dcmnto = @consDocumento), null)
	
	Set @existeTipoId = isNull((Select count(*) From tbIndicesxImagenesDigitalizadas 
								Where cnsctvo_cdgo_imgn = @consAnexo And cnsctvo_cdgo_tpo_indce = 7), 0)
	
	Set @existeNumeroId = isNull((Select count(*) From tbIndicesxImagenesDigitalizadas 
								Where cnsctvo_cdgo_imgn = @consAnexo And cnsctvo_cdgo_tpo_indce = 1), 0)

	Set @existeCiudadNacimiento = isNull((Select count(*) From tbIndicesxImagenesDigitalizadas 
								Where cnsctvo_cdgo_imgn = @consAnexo And cnsctvo_cdgo_tpo_indce = 35), 0)
	
	Begin Transaction
		--Se modifica el Tipo de Imagen
		Update dbo.tbImagenesxDocumentosDigitalizados 
		Set cnsctvo_cdgo_tpo_imgn = @consTipoImagen
		Where cnsctvo_cdgo_imgn = @consAnexo
		
		If (@existeTipoId = 0 And @codiTipoId Is Not Null)
			Begin
				--Se ingresa el Tipo de Identificacion
				Insert Into tbIndicesxImagenesDigitalizadas (
					cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl, 
					cnsctvo_cdgo_tpo_indce,		vlr
				)Values(
					@consAnexo,					@consDocumento,					@consTipoDocumento, 
					7,							@codiTipoId
				)
			End
		Else
			If (@existeTipoId > 0 And @codiTipoId Is Not Null)
				Begin
					--Se modifica el Tipo de Identificacion
					Update tbIndicesxImagenesDigitalizadas 
					Set vlr = @codiTipoId
					Where cnsctvo_cdgo_imgn = @consAnexo
					And cnsctvo_cdgo_tpo_indce = 7 --Tipo de Identificacion
				End
		
		If (@existeNumeroId = 0 And @numeroId Is Not Null)
			Begin
				--Se ingresa el Numero de Identificacion
				Insert Into tbIndicesxImagenesDigitalizadas (
					cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl, 
					cnsctvo_cdgo_tpo_indce,		vlr
				)Values(
					@consAnexo,					@consDocumento,					@consTipoDocumento, 
					1,							@numeroId
				)
			End
		Else
			If (@existeNumeroId > 0 And @numeroId Is Not Null)
				Begin
					--Se modifica el Numero de Identificacion
					Update tbIndicesxImagenesDigitalizadas 
					Set vlr = @numeroId
					Where cnsctvo_cdgo_imgn = @consAnexo
					And cnsctvo_cdgo_tpo_indce = 1 --Numero de Identificacion
				End
		
		If (@existeCiudadNacimiento = 0 And @consCiudadNacimiento Is Not Null)
			Begin
				--Se ingresa la ciudad de nacimiento
				Insert Into tbIndicesxImagenesDigitalizadas (
					cnsctvo_cdgo_imgn,			cnsctvo_cdgo_dcmnto,			cnsctvo_cdgo_tpo_dcmntl, 
					cnsctvo_cdgo_tpo_indce,		vlr
				)Values(
					@consAnexo,					@consDocumento,					@consTipoDocumento, 
					35,							@consCiudadNacimiento
				)
			End
		Else
			If (@existeCiudadNacimiento > 0 And @consCiudadNacimiento Is Not Null)
				Begin
					--Se modifica el Numero de Identificacion
					Update tbIndicesxImagenesDigitalizadas 
					Set vlr = @consCiudadNacimiento
					Where cnsctvo_cdgo_imgn = @consAnexo
					And cnsctvo_cdgo_tpo_indce = 35 --Ciudad de Nacimiento
				End

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
	
END












GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDModificarIndicesImagen] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDModificarIndicesImagen] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDModificarIndicesImagen] TO [visosservice_role]
    AS [dbo];

