CREATE TABLE [dbo].[tbGdCorregirRutaImagenesRecobro_vigencias] (
    [cnsctvo_vgnca_crrgr_rta_imgn_rcbro] [dbo].[udtConsecutivo] NOT NULL,
    [cnsctvo_cdgo_crrgr_rta_imgn_rcbro]  [dbo].[udtConsecutivo] NOT NULL,
    [cdgo_crrgr_rta_imgn_rcbro]          [dbo].[udtCodigo]      NOT NULL,
    [dscrpcn_crrgr_rta_imgn_rcbro]       [dbo].[udtDescripcion] NOT NULL,
    [inco_vgnca]                         DATETIME               NOT NULL,
    [fn_vgnca]                           DATETIME               NOT NULL,
    [fcha_crcn]                          DATETIME               NOT NULL,
    [usro_crcn]                          [dbo].[udtUsuario]     NOT NULL,
    [obsrvcns]                           [dbo].[udtObservacion] NOT NULL,
    [vsble_usro]                         [dbo].[udtLogico]      NOT NULL,
    [txto_rta_bscr]                      VARCHAR (200)          NOT NULL,
    [txto_rta_rmplzr]                    VARCHAR (200)          NOT NULL,
    [tme_stmp]                           ROWVERSION             NOT NULL,
    CONSTRAINT [PK_tbGdCorregirRutaImagenesRecobro_vigencias] PRIMARY KEY CLUSTERED ([cnsctvo_vgnca_crrgr_rta_imgn_rcbro] ASC),
    CONSTRAINT [FK_tbGdCorregirRutaImagenesRecobro_vigencias_tbGdCorregirRutaImagenesRecobro] FOREIGN KEY ([cnsctvo_cdgo_crrgr_rta_imgn_rcbro]) REFERENCES [dbo].[tbGdCorregirRutaImagenesRecobro] ([cnsctvo_cdgo_crrgr_rta_imgn_rcbro])
);


GO
ALTER TABLE [dbo].[tbGdCorregirRutaImagenesRecobro_vigencias] NOCHECK CONSTRAINT [FK_tbGdCorregirRutaImagenesRecobro_vigencias_tbGdCorregirRutaImagenesRecobro];


GO

/*--------------------------------------------------------------------------------------------------------
* Nombre                 	: TrReferencia_Usuario_tbtipopagofacturarecobro_vigencias
* Desarrollado por			: <\A Luis Fernando Benavides												A\>
* Descripcion	 			: <\D Garantiza integridad referencial con una tabla en otra base de Datos	D\>
* Observaciones     		: <\O																		O\>
* Parametros				: <\P																		P\>
* Variables					: <\V																		V\>
* Fecha Creacion			: <\FC 2014/02/11															FC\>
*--------------------------------------------------------------------------------------------------------*/

--ALTER TRIGGER  [dbo].[TrReferencia_Usuario_tbGdCorregirRutaImagenesRecobro_vigencias]
CREATE TRIGGER  [dbo].[TrReferencia_Usuario_tbGdCorregirRutaImagenesRecobro_vigencias]
On [dbo].[tbGdCorregirRutaImagenesRecobro_vigencias]
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
		RaisError	(999902,0, @lcmnsje)
		Return
	End
End


GO

/*---------------------------------------------------------------------------------
* Nombre			: TrValidaTraslapeCodigo_tbGdCorregirRutaImagenesRecobro_vigencias
* Desarrollado por	: <\A Luis Fernando Benavides																	A\>
* Descripcion		: <\D Valida que no se traslape  la Vigencia Nueva con Alguna existente para el mismo parametro D\>
* Observaciones		: <\O																							O\>
* Parametros		: <\P																							P\>
* Variables			: <\V	Fecha Inicial Nueva																		V\>
*					: <\V   Fecha Final Nueva																		V\>
*					: <\V   Fecha Inicial Traslape																	V\>
*					: <\V   Fecha Final Traslape																	V\>
*					: <\V   Mensaje de Error																		V\>
*					: <\V   Contador  de registros																	V\>
*					: <\V   Consectivo del Parametro Nuevo															V\>
*					: <\V   Codigo del Parametro Nuevo																V\>
*					: <\V   Consecutivo de la Vigencia																V\>
*					: <\V   Descripción del parámetro Nuevo															V\>
* Fecha Creacion	: <\FC 2014/04/11																				FC\>
*-----------------------------------------------------------------------------------*/

--ALTER  TRIGGER  [dbo].[TrValidaTraslapeCodigo_tbGdCorregirRutaImagenesRecobro_vigencias]
CREATE  TRIGGER  [dbo].[TrValidaTraslapeCodigo_tbGdCorregirRutaImagenesRecobro_vigencias]
ON   [dbo].[tbGdCorregirRutaImagenesRecobro_vigencias]  
FOR  INSERT
As

Begin
	Set NoCount On
	Declare	@inco_vgnca						Datetime,
			@fn_vgnca						Datetime,
			@tinco_vgnca					Datetime,
			@tfn_vgnca						Datetime,
			@mnsje							VarChar(400),
			@contador						Int,
			@Codigo_Consecutivo				UdtConsecutivo,
	  		@cdgo_ara						Char(4),
			@cdgo_vgnca						UdtConsecutivo,
			@dscrpcn_crrgr_rta_imgn_rcbro	UdtDescripcion


	-->Se capturan las variables que se estan tratando de insertar
	Select	@inco_vgnca						=	inco_vgnca,
			@fn_vgnca						=	fn_vgnca,
			@Codigo_Consecutivo				=	cnsctvo_cdgo_crrgr_rta_imgn_rcbro,
			@cdgo_ara						=	cdgo_crrgr_rta_imgn_rcbro,
			@cdgo_vgnca						=	cnsctvo_vgnca_crrgr_rta_imgn_rcbro,
			@dscrpcn_crrgr_rta_imgn_rcbro	=	dscrpcn_crrgr_rta_imgn_rcbro
	From   INSERTED

		
	-->Se Calcula si hay  traslape de fechas
	Select	@contador=count(*)
	From	tbGdCorregirRutaImagenesRecobro_vigencias p
	Where	(	(Convert(VarChar(10),p.inco_vgnca,111)	>=	Convert(VarChar(10),@inco_vgnca,111) 
	And			Convert(VarChar(10),p.inco_vgnca,111)	<=	Convert(VarChar(10),@fn_vgnca,111))   Or
				(Convert(VarChar(10),p.fn_vgnca,111)    >=	Convert(VarChar(10),@inco_vgnca,111) 
	And			Convert(VarChar(10),p.fn_vgnca,111)		<=	Convert(VarChar(10),@fn_vgnca,111))   Or
				(Convert(VarChar(10),p.inco_vgnca,111)  <=	Convert(VarChar(10),@inco_vgnca,111) 
	And			Convert(VarChar(10),p.fn_vgnca,111)     >=	Convert(VarChar(10),@fn_vgnca,111)))
	And			p.cnsctvo_cdgo_crrgr_rta_imgn_rcbro = @Codigo_Consecutivo

	-->Hay traslape de fechas
	If @contador > 1
		Begin   
			-->Para Indicar al usuario contra que fecha hay traslape
			Select	@tinco_vgnca = inco_vgnca,@tfn_vgnca = fn_vgnca
			From	tbGdCorregirRutaImagenesRecobro_vigencias p
			Where	((Convert(VarChar(10),p.inco_vgnca,111) >=	Convert(VarChar(10),@inco_vgnca,111) 
			And		Convert(VarChar(10),p.inco_vgnca,111)	<=	Convert(VarChar(10),@fn_vgnca,111))   Or
					(Convert(VarChar(10),p.fn_vgnca,111)    >=	Convert(VarChar(10),@inco_vgnca,111) 
			And		Convert(VarChar(10),p.fn_vgnca,111)		<=	Convert(VarChar(10),@fn_vgnca,111))   Or
					(Convert(VarChar(10),p.inco_vgnca,111)  <=	Convert(VarChar(10),@inco_vgnca,111) 
			And		Convert(VarChar(10),p.fn_vgnca,111)     >=	Convert(VarChar(10),@fn_vgnca,111)))  
			And		p.cnsctvo_cdgo_crrgr_rta_imgn_rcbro		=	@Codigo_Consecutivo
			And 	cnsctvo_vgnca_crrgr_rta_imgn_rcbro		!=	@cdgo_vgnca
			
			
			Rollback Transaction
			Select		@mnsje  =  'Error, Insertando, Existe  Traslape con   '+  Convert(VarChar(10),@tinco_vgnca,111) + '  ' + Convert(VarChar(10),@tfn_vgnca,111)
			RaisError	(999905,0, @mnsje)
			Return
		End

	Update	tbGdCorregirRutaImagenesRecobro
	Set		dscrpcn_crrgr_rta_imgn_rcbro			= @dscrpcn_crrgr_rta_imgn_rcbro
	Where	cnsctvo_cdgo_crrgr_rta_imgn_rcbro		= @Codigo_Consecutivo
End


GO

/*---------------------------------------------------------------------------------
* Nombre			: TrValidaUpdateTraslapeCodigo_tbGdCorregirRutaImagenesRecobro_vigencias
* Desarrollado por	: <\A Luis Fernando Benavides												A\>
* Descripcion		: <\D Valida que no se traslape  las fechas Modificadas con una exitente	D\>
* Observaciones		: <\O																		O\>
* Parametros		: <\P																		P\>
* Variables			: <\V   Fecha Inicial Nueva													V\>
*					: <\V   Fecha Final Nueva													V\>
*					: <\V   Fecha Inicial Traslape												V\>
*					: <\V   Fecha Final Traslape												V\>
*					: <\V   Mensaje de Error													V\>
*					: <\V   Contador  de registros												V\>
*					: <\V   Consectivo del Parametro Nuevo										V\>
*					: <\V   Mensaje de Error													V\>
*					: <\V   Contador  de registros												V\>
*					: <\V   Fecha Inicial Modificada											V\>
*					: <\V   Fecha Final Modificada												V\>
*					: <\V   Consecutivo del Parametro Modificado								V\>
*					: <\V   Codigo del Parametro Nuevo											V\>
*					: <\V   Consecutivo de la Vigencia Modificado								V\>
* Fecha Creacion	: <\FC	2014/04/11															FC\>
-----------------------------------------------------------------------------------*/

--ALTER  TRIGGER  [dbo].[TrValidaUpdateTraslapeCodigo_tbGdCorregirRutaImagenesRecobro_vigencias] 
CREATE  TRIGGER  [dbo].[TrValidaUpdateTraslapeCodigo_tbGdCorregirRutaImagenesRecobro_vigencias] 
ON   [dbo].[tbGdCorregirRutaImagenesRecobro_vigencias]
FOR  UPDATE
As
Begin
	Set NoCount On
	Declare	@inco_vgnca			Datetime,
			@fn_vgnca			Datetime,
			@tinco_vgnca		Datetime,
			@tfn_vgnca			Datetime,
			@mnsje				VarChar(400),
			@contador			Int,
			@Codigo_Consecutivo	UdtConsecutivo,
			@dinco_vgnca		Datetime,
  			@dfn_vgnca			Datetime,
  			@dcnsctvo_tbla		UdtConsecutivo,
			@cdgo_ara			Char(4),
			@cnsctvo_vgnca		UdtConsecutivo

	--> Se capturan las variables que se estan tratando de insertar
	Select	@inco_vgnca			=	inco_vgnca,
			@fn_vgnca			=	fn_vgnca,
			@Codigo_Consecutivo =	cnsctvo_cdgo_crrgr_rta_imgn_rcbro,
			@cdgo_ara			=	cdgo_crrgr_rta_imgn_rcbro
	From   INSERTED

	-->    Se capturan las variables que se estan modificando
	Select	@dinco_vgnca		=	inco_vgnca,
			@dfn_vgnca			=	fn_vgnca,
			@dcnsctvo_tbla		=	cnsctvo_cdgo_crrgr_rta_imgn_rcbro,
			@cnsctvo_vgnca		=	cnsctvo_vgnca_crrgr_rta_imgn_rcbro
	From	deleted
	 
	-->Obtener la imagen de los registros Modificados (Deleted) e Insertados (Inserted)
	Select	*
	Into	#tbValoresAnteriores
	From	Deleted

	Select	*
	Into	#tbValoresNuevos
	From	Inserted


	-->valida que los campos que se estan modificando sean los campos de fecha de vigencia 
	If Exists	(	Select	*
					From	#tbValoresAnteriores d,  #tbValoresNuevos n
					Where   (Convert(VarChar(10),d.inco_vgnca,111)	<>	Convert(VarChar(10),n.inco_vgnca,111)
             		Or		Convert(VarChar(10),d.fn_vgnca,111)		<>	Convert(VarChar(10),n.fn_vgnca,111))
					And		d.cnsctvo_vgnca_crrgr_rta_imgn_rcbro	=	n.cnsctvo_vgnca_crrgr_rta_imgn_rcbro)

		Begin
			--> Valida que el parametro a modificar sea vigente
			If	(	Convert(VarChar(10),@dfn_vgnca,111)		<	Convert(VarChar(10),getDate(),111)  and 
					Convert(VarChar(10),@inco_vgnca,111)	<=	Convert(VarChar(10),@dfn_vgnca,111) and
					Convert(VarChar(10),@fn_vgnca,111)		>=  Convert(VarChar(10),@dinco_vgnca,111)
				)

	    		Begin
					Drop Table #tbValoresAnteriores
					Drop Table #tbValoresNuevos
					
					Rollback Transaction
					
					Select		@mnsje  =  'Error,  No se puede Modificar la Vigencia de un Parámetro no Vigente'
					RaisError	(999909,0, @mnsje)
					Return
				End
			
			--> Valida que si el parametro es vigente no pueda incrementar inicio vigencia
			If	Convert(VarChar(10),@dfn_vgnca,111)		>=	Convert(VarChar(10),getDate(),111)  And
                Convert(VarChar(10),@dinco_vgnca,111)	<=	Convert(VarChar(10),getDate(),111)  And
				Convert(VarChar(10),@dinco_vgnca,111)	<	Convert(VarChar(10),@inco_vgnca,111) And
				Convert(VarChar(10),@inco_vgnca,111)	<	Convert(VarChar(10),@dfn_vgnca,111)
				
				Begin 
					Drop Table #tbValoresAnteriores
					Drop Table #tbValoresNuevos

					Rollback Transaction

					Select		@mnsje  =  'Error, No se permite Incrementar el Inicio de Vigencia de un Parámetro Vigente '
					RaisError	(999908,0, @mnsje)
					Return
 				End
	
			-->Valida que el fin de vigencia no sea inferior a fecha actual  para un parametro vigente
			If	Convert(VarChar(10),@dfn_vgnca,111)		>=	Convert(VarChar(10),getDate(),111)  And
      			Convert(VarChar(10),@fn_vgnca,111)		<	Convert(VarChar(10),getDate(),111) And
				Convert(VarChar(10),@dinco_vgnca,111)	< =	Convert(VarChar(10),@fn_vgnca,111)
					
				Begin
					Drop Table	#tbValoresAnteriores
					Drop Table	#tbValoresNuevos

					Rollback Transaction

					Select		@mnsje  =  'Error, El  Fin de Vigencia debe ser Superior  a  la Fecha Actual para un Parámetro Vigente '
					RaisError	999907   @mnsje
					Return
				End
			
			-->Se Calcula si hay  traslape de fechas
			Select	@contador									=	Count(*)
			From	tbGdCorregirRutaImagenesRecobro_vigencias p
			Where	( (Convert(VarChar(10),p.inco_vgnca,111)	>=	Convert(VarChar(10),@inco_vgnca,111)
			And		Convert(VarChar(10),p.inco_vgnca,111)		<=	Convert(VarChar(10),@fn_vgnca,111))  Or
					(Convert(VarChar(10),p.fn_vgnca,111)		>=	Convert(VarChar(10),@inco_vgnca,111)
			And		Convert(VarChar(10),p.fn_vgnca,111)			<=	Convert(VarChar(10),@fn_vgnca,111))  Or
					(Convert(VarChar(10),p.inco_vgnca,111)		<=	Convert(VarChar(10),@inco_vgnca,111)
			And		Convert(VarChar(10),p.fn_vgnca,111)			>=	Convert(VarChar(10),@fn_vgnca,111)))
			And		p.cnsctvo_cdgo_crrgr_rta_imgn_rcbro			=	@Codigo_Consecutivo
    
			If @contador > 1
				-->Hay traslape de fechas
				Begin
					Select	@tinco_vgnca								=	inco_vgnca,
							@tfn_vgnca									=	fn_vgnca
					From	tbGdCorregirRutaImagenesRecobro_vigencias p
					Where	((Convert(VarChar(10),p.inco_vgnca,111)		>=	Convert(VarChar(10),@inco_vgnca,111)
					And		Convert(VarChar(10),p.inco_vgnca,111)		<=	Convert(VarChar(10),@fn_vgnca,111))   Or
							(Convert(VarChar(10),p.fn_vgnca,111)		>=	Convert(VarChar(10),@inco_vgnca,111)
					And		Convert(VarChar(10),p.fn_vgnca,111)			<=	Convert(VarChar(10),@fn_vgnca,111))   Or
							(Convert(VarChar(10),p.inco_vgnca,111)		<=	Convert(VarChar(10),@inco_vgnca,111)
					And		Convert(VarChar(10),p.fn_vgnca,111)			>=	Convert(VarChar(10),@fn_vgnca,111)))
					And		p.cnsctvo_cdgo_crrgr_rta_imgn_rcbro			=	@Codigo_Consecutivo
  	      			And		p.cnsctvo_vgnca_crrgr_rta_imgn_rcbro		!=	@cnsctvo_vgnca

					Drop Table	#tbValoresAnteriores
					Drop Table	#tbValoresNuevos

					Rollback Transaction

					Select		@mnsje  =  'Error, Insertando, Existe  Traslape con  '+  Convert(VarChar(10),@tinco_vgnca,111) + '  ' + Convert(VarChar(10),@tfn_vgnca,111)
					RaisError	(999905,0, @mnsje)
					Return
				End

		End
End


GO

/*-----------------------------------------------------------------------------------------------
* Nombre			:	TrCodigosEspeciales_tbGdCorregirRutaImagenesRecobro_vigencias
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

CREATE TRIGGER [dbo].[TrCodigosEspeciales_tbGdCorregirRutaImagenesRecobro_vigencias]
--CREATE TRIGGER [dbo].[TrCodigosEspeciales_tbGdCorregirRutaImagenesRecobro_vigencias]
On  [dbo].[tbGdCorregirRutaImagenesRecobro_vigencias]
FOR  UPDATE, DELETE
As

Declare	@lcLongitud 	TinyInt,
		@lcCodigov 		VarChar(30),
		@lcCodigoi 		VarChar(30),
		@lcTexto 		VarChar(120)

Set		@lcCodigov	=	'0'
Set		@lcCodigoi	=	'9'

Select	@lcLongitud = (COL_LENGTH('tbGdCorregirRutaImagenesRecobro_vigencias','cdgo_crrgr_rta_imgn_rcbro')) - 1

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
		Raiserror	(999904, 0, @lcTexto)
		Return	
	End
End


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro_vigencias] TO PUBLIC
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro_vigencias] TO PUBLIC
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro_vigencias] TO PUBLIC
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro_vigencias] TO PUBLIC
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro_vigencias] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro_vigencias] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro_vigencias] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbGdCorregirRutaImagenesRecobro_vigencias] TO [rcbrs_usr]
    AS [dbo];

