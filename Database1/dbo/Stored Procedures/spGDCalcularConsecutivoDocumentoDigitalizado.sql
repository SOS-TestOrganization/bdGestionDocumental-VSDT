--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
-- Stored Procedure

/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDCalcularConsecutivoDocumentoDigitalizado
* Desarrollado por		 :  <\A   sisogb01		A\>
* Descripcion			 :  <\D   Calcula y devuelve el siguiente consecutivopara insertar el tbDocumentoDigitalizado	D\>
* Observaciones		     :  <\O	  Si no existe el registro de consecutivos en la tabla de tbInformacionConsecutivos, se crea el primer registro O\>
* Parametros			 :  <\P   @ttl_cnsctvs_dcmnts: Es el numero de consecutivos que deben contar P\>
* Variables				 :  <\V					V\>
* Fecha Creacion		 :  <\FC	22/09/2011	FC\>
*  Select  *From tbInformacionConsecutivo
*  Exec [spGDCalcularConsecutivoDocumentoDigitalizado] 3
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Omar Granados  AM\>
* Descripcion			 : <\DM Se cambia logica para actualizar primero, consultar y retornar los consecutivos despues  DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  2017/05/18 FM\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Omar Granados  AM\>
* Descripcion			 : <\DM Se agrega instrucción para generar traza de error y se elimina manejo de error, porque una transacción ya lo esta haciendo  DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  2017/05/23 FM\>
*---------------------------------------------------------------------------------
* Exec dbo.spGDCalcularConsecutivoDocumentoDigitalizado 2
*/
CREATE Procedure [dbo].[spGDCalcularConsecutivoDocumentoDigitalizado]
	@ttl_cnsctvs_dcmnts		Int = 1
As
Begin

Set Nocount On

Declare	@cnsctvo_cdgo_dcmnto int
Declare	@cnsctvo_cdgo_dcmnto_antrr int
Declare @use_tran udtLogico 

set @use_tran = Case when (@@TRANCOUNT>0) then 'N' else 'S' End --Si hay transaccion entonces no cree una nueva (en java se crea), si no hay transaccion entonces creela (begin tran-commit-rollback). 

Set Transaction Isolation Level SERIALIZABLE;
Declare @tmpConsecutivosSalida Table(cnsctvo_cdgo_dcmnto Int,cnsctvo_cdgo_dcmnto_antrr Int)
Begin Try
		/* */
		If(@use_tran = 'S')
		Begin
			Begin Tran
		End
		Update		tbInformacionConsecutivo With(Rowlock) 
		Set			cnsctvo_cdgo_dcmnto	=	 cnsctvo_cdgo_dcmnto+@ttl_cnsctvs_dcmnts

		Output		inserted.cnsctvo_cdgo_dcmnto, deleted.cnsctvo_cdgo_dcmnto
		Into		@tmpConsecutivosSalida(cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_dcmnto_antrr)

		Select		@cnsctvo_cdgo_dcmnto =	cnsctvo_cdgo_dcmnto,
					@cnsctvo_cdgo_dcmnto_antrr = cnsctvo_cdgo_dcmnto_antrr		
		From		@tmpConsecutivosSalida
		If(@use_tran = 'S')
		Begin
			Commit
		End
End Try
Begin Catch
	--2017/05/23
	Begin Try
		If object_id('tempdb..##tbMensajesErrorGD') IS NULL
		BEGIN
			Create table ##tbMensajesErrorGD(
						id				UdtConsecutivo Identity(1,1),
						mnsje			Varchar(max),
						fnte			Int,
						fcha			Datetime default(getDate())
			);
		END
		Insert Into ##tbMensajesErrorGD(mnsje,fnte) values(ERROR_MESSAGE(),1)
	End Try
	Begin Catch
		/* No-Op */
	End Catch

	If(@use_tran = 'S')
	Begin
		Rollback
	End
	--2017/05/23

	;Throw --Escala la excepción generada.
End Catch

Select	@cnsctvo_cdgo_dcmnto		cnsctvo_cdgo_dcmnto,
		@cnsctvo_cdgo_dcmnto_antrr	cnsctvo_cdgo_dcmnto_antrr
Return 0
End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivoDocumentoDigitalizado] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivoDocumentoDigitalizado] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivoDocumentoDigitalizado] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivoDocumentoDigitalizado] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivoDocumentoDigitalizado] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivoDocumentoDigitalizado] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivoDocumentoDigitalizado] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivoDocumentoDigitalizado] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivoDocumentoDigitalizado] TO [visosservice_role]
    AS [dbo];

