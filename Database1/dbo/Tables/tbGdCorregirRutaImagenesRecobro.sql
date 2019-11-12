CREATE TABLE [dbo].[tbGdCorregirRutaImagenesRecobro] (
    [cnsctvo_cdgo_crrgr_rta_imgn_rcbro] [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_crrgr_rta_imgn_rcbro]         [dbo].[udtCodigo]      NOT NULL,
    [dscrpcn_crrgr_rta_imgn_rcbro]      [dbo].[udtDescripcion] NOT NULL,
    [fcha_crcn]                         DATETIME               NOT NULL,
    [usro_crcn]                         [dbo].[udtUsuario]     NOT NULL,
    [vsble_usro]                        [dbo].[udtLogico]      NOT NULL,
    CONSTRAINT [PK_tbGdCorregirRutaImagenesRecobro] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_crrgr_rta_imgn_rcbro] ASC) WITH (FILLFACTOR = 98)
);


GO

/*-----------------------------------------------------------------------------------------------
* Nombre			:	TrCodigosEspeciales_tbGdCorregirRutaImagenesRecobro
* Desarrollado por	:	<\A Luis Fernando Benavides												A\>
* Descripcion		:	<\D Protege los registros que cntienen los códigos de Vacio				D\>
*						<\D e Inexistente, para que no se actualicen ni borren					D\>
* Observaciones		:	<\O Inexistente: Código lleno de ceros. Vacio: Código lleno de nueves	O\>
* Parametros		:	<\P  																	P\>
* Variables			:	<\V Longitud del código													V\>
					:	<\V Código de Vacio														V\>
					:	<\V Código de Inexistente												V\>
					:	<\V Texto del mensaje de												V\>
* Fecha Creacion	:	<\FC 2014/04/11															FC\>
-------------------------------------------------------------------------------------------------*/

--ALTER TRIGGER [dbo].[TrCodigosEspeciales_tbGdCorregirRutaImagenesRecobro]
CREATE TRIGGER [dbo].[TrCodigosEspeciales_tbGdCorregirRutaImagenesRecobro]
On  [dbo].[tbGdCorregirRutaImagenesRecobro]
FOR  UPDATE, DELETE
As

Declare	@lcLongitud 	TinyInt,
		@lcCodigov 		VarChar(30),
		@lcCodigoi 		VarChar(30),
		@lcTexto 		VarChar(120)

Set		@lcCodigov	=	'0'
Set		@lcCodigoi	=	'9'

Select	@lcLongitud = (COL_LENGTH('tbGdCorregirRutaImagenesRecobro','cdgo_crrgr_rta_imgn_rcbro')) - 1

While	@lcLongitud > 0
	Begin
		Set	@lcCodigov	=	@lcCodigov + '0'
		Set	@lcCodigoi	=	@lcCodigoi + '9'
	  	Set	@lcLongitud =	@lcLongitud - 1
	--End

Set NoCount On

If	Exists (	Select * From Deleted 
				Where cdgo_crrgr_rta_imgn_rcbro	=	@lcCodigov Or cdgo_crrgr_rta_imgn_rcbro	=	@lcCodigoi
			)
	Begin
		RollBack Transaction
		Select		@lcTexto ='Error, Los registros con códigos '+@lcCodigov+' ó '+@lcCodigoi+' no pueden ser actualizados ni borrados.'
		Raiserror	999904  @lcTexto
		Return	
	End
End


GO

/*--------------------------------------------------------------------------------------------------------
* Nombre                 	: TrReferencia_Usuario_tbGdCorregirRutaImagenesRecobro
* Desarrollado por			: <\A Luis Fernando Benavides												A\>
* Descripcion	 			: <\D Garantiza integridad referencial con una tabla en otra base de Datos	D\>
* Observaciones     		: <\O																		O\>
* Parametros				: <\P																		P\>
* Variables					: <\V																		V\>
* Fecha Creacion			: <\FC 2014/04/11															FC\>
*--------------------------------------------------------------------------------------------------------*/

CREATE TRIGGER  [dbo].[TrReferencia_Usuario_tbGdCorregirRutaImagenesRecobro]
--CREATE TRIGGER  [dbo].[TrReferencia_Usuario_tbGdCorregirRutaImagenesRecobro]
On [dbo].[tbGdCorregirRutaImagenesRecobro]
FOR  INSERT,UPDATE
As
Begin
	Declare 	@lcmnsje	VarChar(400),
				@lcusro		VarChar(10)
	Set Nocount On
	
	If Not Exists (	Select	p.lgn_usro
					From	[bdSeguridad].[dbo].[tbUsuarios] p, Inserted i
					Where	p.lgn_usro = i.usro_crcn)
	Begin
		Select		@lcusro	=  i.usro_crcn
		From		Inserted i

		Rollback Transaction

		Select 		@lcmnsje  =  'Error, El Usuario '+  @lcusro+' no se encuentra creado en  bdSeguridad..tbUsuarios.usro_crcn'
		RaisError	(999902, 0, @lcmnsje)
		Return
	End
End


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro] TO PUBLIC
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro] TO PUBLIC
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro] TO PUBLIC
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro] TO PUBLIC
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro] TO [rcbrs_usr]
    AS [dbo];

