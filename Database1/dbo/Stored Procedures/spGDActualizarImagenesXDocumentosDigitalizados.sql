
/*----------------------------------------------------------------------------------
* Metodo o PRG 		 : spGDActualizarImagenesXDocumentosDigitalizados
* Desarrollado por	 : <\A Ing. Luis Fernando Benavides						   A\>
* Descripcion		 : <\D Actualiza tipo imagen							   D\>
* Observaciones		 : <\O Proyecto/Mantenimiento:                             O\>
					   <\O Resolucion 458									   O\>
* Parametros		 : <\P P\>
* Variables			 : <\V V\>
* Fecha Creacion	 : <\FC 2014/03/19 										  FC\>
*
*---------------------------------------------------------------------------------  
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------
* Modificado Por	 : <\AM AM\>
* Descripcion		 : <\DM	DM\>
* Nuevos Parametros	 : <\PM PM\>
* Nuevas Variables	 : <\VM	VM\>
* Fecha Modificacion : <\FM	FM\>
*---------------------------------------------------------------------------------*/
/*
exec spGDActualizarImagenesXDocumentosDigitalizados 62406712, 31
*/

CREATE procedure [dbo].[spGDActualizarImagenesXDocumentosDigitalizados]
--Create procedure [dbo].[spGDActualizarImagenesXDocumentosDigitalizados]
@cnsctvo_cdgo_imgn		udtconsecutivo	= null,
@cnsctvo_cdgo_tpo_imgn	udtconsecutivo	= null,
@rta_imgn				varchar(250)	= ''					
AS

Set Nocount On

Update	tbImagenesxDocumentosDigitalizados
Set		cnsctvo_cdgo_tpo_imgn	= @cnsctvo_cdgo_tpo_imgn,
		rta_imgn				= @rta_imgn		
Where	cnsctvo_cdgo_imgn		= @cnsctvo_cdgo_imgn


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarImagenesXDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];

