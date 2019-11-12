
/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDCalcularConsecutivo
* Desarrollado por		 :  <\A   siscgm01		A\>
* Descripcion			 :  <\D   Calcula y devuelve el siguiente consecutivo (documento, imagen) para insertar en tbdocumentosdigitalizados D\>
* Observaciones		     :  <\O	  O\>
* Parametros			 :  <\P   @cnsctvo_cdgo_dcmnto: Es el consecutivo de documento generado P\>
							<\P   @cnsctvo_cdgo_imgn: Es el consecutivo de imagen generado P\>
							<\P   @cnsctvo_opcn_ejccn: Define si se debe generar un nuevo consecutivo documento o solo un nuevo conswecutivo imagen P\>
* Variables				 :  <\V					V\>
* Fecha Creacion		 :  <\FC	16/07/2012	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Omar Granados  AM\>
* Descripcion			 : <\DM  Se modifica la forma de consultar y actualizar el consecutivo, ahora primero se actualiza, luego se consulta inmediatamente y se asigna a la variable DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM 2017/05/18  FM\>
*---------------------------------------------------------------------------------*/
/*
Declare @dcmnto Int
Declare @imgn Int
Exec bdGestionDocumental..spGDCalcularConsecutivo2 @dcmnto output, @imgn output,3
select @dcmnto, @imgn 
*/
CREATE Procedure [dbo].[spGDCalcularConsecutivo]
@cnsctvo_cdgo_dcmnto	Int	= Null Output,
@cnsctvo_cdgo_imgn		Int	= Null Output,
@cnsctvo_opcn_ejccn		Int
As
Set Nocount On

Begin
	Set Transaction Isolation Level SERIALIZABLE;
	Declare @tmpConsecutivosSalida Table(cnsctvo_cdgo_dcmnto Int,cnsctvo_cdgo_imgn Int)
	Begin Try
		Begin Tran
			/*Se genera un nuevo consecutivo de documento y un nuevo consecutivo de imagen cuando @cnsctvo_opcn_ejccn es 1 */
			/*Se genera solo un nuevo consecutivo de imagen cuando @cnsctvo_opcn_ejccn es 2 */
			/*Se genera solo un nuevo consecutivo de documento cuando @cnsctvo_opcn_ejccn es 3 */

			Update		tbInformacionConsecutivo With(Rowlock) /* Bloqueo del registro para que no se consulte hasta terminar el update */
			Set			cnsctvo_cdgo_dcmnto	=	 Case When @cnsctvo_opcn_ejccn in(1,3) Then (cnsctvo_cdgo_dcmnto + 1) Else cnsctvo_cdgo_dcmnto End,
						cnsctvo_cdgo_imgn	=	 Case When @cnsctvo_opcn_ejccn in(1,2) Then (cnsctvo_cdgo_imgn   + 1) Else cnsctvo_cdgo_imgn   End
	
			Output		inserted.cnsctvo_cdgo_dcmnto, inserted.cnsctvo_cdgo_imgn
			Into		@tmpConsecutivosSalida(cnsctvo_cdgo_dcmnto,cnsctvo_cdgo_imgn)

			Select		@cnsctvo_cdgo_imgn   = cnsctvo_cdgo_imgn,
						@cnsctvo_cdgo_dcmnto =	cnsctvo_cdgo_dcmnto		
			From		@tmpConsecutivosSalida

		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
		Throw --Escala la excepción generada.
	End Catch
End
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [900005 Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Consultor Asesor Comercial]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [310009 Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [310004 Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Administrador Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Analista Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Autorizador Validacion Servicio al Cliente]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Administrador Planeacion Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Consultor Salud Privilegiado]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Coordinador Parametros Vision Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Administrador Red Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Administrador Juridico Gestion IT]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDCalcularConsecutivo] TO [visosservice_role]
    AS [dbo];

