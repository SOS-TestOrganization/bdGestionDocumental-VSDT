

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
-- Stored Procedure

/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDCalcularConsecutivosImagenesDigitalizadas
* Desarrollado por		 :  <\A   siscgm01		A\>
* Descripcion			 :  <\D   Calcula y devuelve el siguiente consecutivo para insertar el tbImagenesDigitalizadas cuando hay varias imágenes asociadas	D\>
							<\D   a un mismodocumento																										D\>
* Observaciones		     :  <\O	  Si no existe el registro de consecutivos en la tabla de tbInformacionConsecutivos, se crea el primer registro O\>
* Parametros			 :  <\P   @ttl_cnsctvs_imgns: Es el numero de consecutivos de imágenes que debe contar P\>
* Variables				 :  <\V					V\>
* Fecha Creacion		 :  <\FC	18/07/2012	FC\>
*  Select  *From tbInformacionConsecutivo
*  Exec [spGDCalcularConsecutivosImagenesDigitalizadas] 3
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM  Andres Taborda  AM\>
* Descripcion			 : <\DM  Se realiza mejora al SP ya que se esta evidenciando problemas de concurrencia cuando guarda en la tabla tbImagenexDocuemntosDigitalizados
								 En el cual falla por que ya existe la llave primaria. 
								 Este sp calcula el consecutivo para la tabla transaccional  pero esta fallando de forma repetitiva en el mes de abril/2017 afectando 
								 procesos masivos de IQ, CME, Recobros porque el consecutivo ya existe o lo ha tomado otro proceso.

							 DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM 2017/04/26  FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[spGDCalcularConsecutivosImagenesDigitalizadas]
	@ttl_cnsctvs_imgns		Int = 1
As
Begin
	Set Nocount On
	
	DECLARE @tbConsecutivoImagen table(cnsctvo_cdgo_imgn int NOT NULL,cnsctvo_cdgo_imgn_antrr int not null)
	
	Set Transaction Isolation Level SERIALIZABLE;
	
	Begin Tran

	UPDATE dbo.tbInformacionConsecutivo 
	SET cnsctvo_cdgo_imgn = cnsctvo_cdgo_imgn + @ttl_cnsctvs_imgns	
    OUTPUT inserted.cnsctvo_cdgo_imgn, deleted.cnsctvo_cdgo_imgn    
	INTO @tbConsecutivoImagen;  
	
	If @@error != 0
	begin
		Rollback Tran
	end
	else
	begin
		Commit Tran
	end

	
	Select cnsctvo_cdgo_imgn,(cnsctvo_cdgo_imgn_antrr+1) as cnsctvo_cdgo_imgn_antrr
	from @tbConsecutivoImagen
End

/*  --- codigo anterior 
	Begin
	Set Nocount On
	Declare	@cnsctvo_cdgo_imgn int
	Declare	@cnsctvo_cdgo_imgn_antrr int
	Declare @count_regs int
	Set @count_regs = Null

	Set Transaction Isolation Level SERIALIZABLE;
	Begin Tran

			Select	@cnsctvo_cdgo_imgn	=	IsNull(cnsctvo_cdgo_imgn,0),
					@count_regs				=	1
			From	tbInformacionConsecutivo
			Set		@cnsctvo_cdgo_imgn_antrr =  @cnsctvo_cdgo_imgn + 1

			/*Si no existe el registro */
			If	@count_regs Is Null
				Begin
					Set		@cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn + @ttl_cnsctvs_imgns
					/*Inserta el primer valido*/
					Insert Into	tbInformacionConsecutivo
					Values		(0,	@cnsctvo_cdgo_imgn)
				End
			/*Si existen registros de consecutivos */
			Else
				Begin
					Set		@cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn + @ttl_cnsctvs_imgns
					/* Actualiza el registro */
					Update		tbInformacionConsecutivo
					Set			cnsctvo_cdgo_imgn	=	@cnsctvo_cdgo_imgn
				End
			If @@error != 0
				Begin
					Rollback Tran
				End
			Else
				Begin
					Commit Tran
				End

	Select	@cnsctvo_cdgo_imgn		cnsctvo_cdgo_imgn,
			@cnsctvo_cdgo_imgn_antrr	cnsctvo_cdgo_imgn_antrr
	Return 0
END
*/



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivosImagenesDigitalizadas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivosImagenesDigitalizadas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivosImagenesDigitalizadas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivosImagenesDigitalizadas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivosImagenesDigitalizadas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivosImagenesDigitalizadas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivosImagenesDigitalizadas] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivosImagenesDigitalizadas] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivosImagenesDigitalizadas] TO [visosservice_role]
    AS [dbo];

