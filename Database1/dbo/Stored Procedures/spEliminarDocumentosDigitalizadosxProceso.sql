/*----------------------------------------------------------------------------------------------------------------------------------------   
* Metodo o PRG 	         : spEliminarDocumentosDigitalizadosxProceso
* Desarrollado por		 : <\A Ing. Omar Granados 	A\>
* Descripcion			 : <\D 
                               Procedimiento que se encargar de eliminar
                            D\>
* Observaciones		     : <\O	O\>
* Parametros			 : <\P  
                               @cnsctvo_prcso   Int     -- Consecutivo del proceso que agrupa los registros a utilizar
							   @cnsctvo_cdgo_dgtlzdr Int -- Consecutivo del digitalizador
						   P\>		
* Fecha Creacion		 : <\FC  2014/07/21							FC\>
*-----------------------------------------------------------------------------------------------------------------------------------------   
* DATOS DE MODIFICACION   
*-----------------------------------------------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM AM\>
* Descripcion			 : <\DM DM\>
* Nuevos Parametros	 	 : <\PM PM\>
* Nuevas Variables		 : <\VM VM\>
* Fecha Modificacion	 : <\FM FM\>
*-----------------------------------------------------------------------------------------------------------------------------------------*/
/*
Exec dbo.spEliminarDocumentosDigitalizadosxProceso 60,10 --IQ
*/

CREATE Procedure [dbo].[spEliminarDocumentosDigitalizadosxProceso]
 @cnsctvo_prcso Int,
 @cnsctvo_cdgo_dgtlzdr Int,
 @error Int  = 0 Output
AS
SET NOCOUNT ON

Declare @mensajeError varchar(1000)

Create Table #tbDocumentosDigitalizados(
 cnsctvo_cdgo_dcmnto bigint Primary Key
)

Create Table #tbImagenesDigitalizadas(
 cnsctvo_cdgo_imgn Int Primary Key
)

/* <-- Aqui va el proceso */
Begin Try

	Begin Transaction

	Insert Into #tbDocumentosDigitalizados(cnsctvo_cdgo_dcmnto)
	Select cnsctvo_cdgo_dcmnto
	from bdGestionDocumental.dbo.tbDocumentosDigitalizados 
	where cnsctvo_prcso_crga = @cnsctvo_prcso
	And cnsctvo_cdgo_dgtlzdr = @cnsctvo_cdgo_dgtlzdr --Digitalizador

	Insert Into #tbImagenesDigitalizadas(cnsctvo_cdgo_imgn)
	Select i.cnsctvo_cdgo_imgn
	From bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados i
	Inner Join #tbDocumentosDigitalizados d
	On (i.cnsctvo_cdgo_dcmnto = d.cnsctvo_cdgo_dcmnto)


	Delete from bdGestionDocumental.dbo.tbIndicesxImagenesdigitalizadas
	Where cnsctvo_cdgo_imgn in(
	 select cnsctvo_cdgo_imgn From #tbImagenesDigitalizadas
	)

	Delete From bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados 
	Where cnsctvo_cdgo_imgn in(
	 select cnsctvo_cdgo_imgn From #tbImagenesDigitalizadas
	)

	Delete from bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
	Where cnsctvo_cdgo_dcmnto in(
	 select cnsctvo_cdgo_dcmnto From #tbDocumentosDigitalizados
	)
	
	Delete From bdGestionDocumental.dbo.tbDocumentosDigitalizados
	Where cnsctvo_cdgo_dcmnto in(
	 Select cnsctvo_cdgo_dcmnto From #tbDocumentosDigitalizados
	)

	Commit 
	
	Drop Table #tbDocumentosDigitalizados
	Drop Table #tbImagenesDigitalizadas
	Set @error = 0
End Try
Begin Catch
	Rollback Tran
	Drop Table #tbDocumentosDigitalizados
	Drop Table #tbImagenesDigitalizadas

	Set @error =  ERROR_NUMBER()
	Set @mensajeError = ERROR_MESSAGE();
	RAISERROR (@mensajeError, 16, 2) WITH SETERROR
End Catch


