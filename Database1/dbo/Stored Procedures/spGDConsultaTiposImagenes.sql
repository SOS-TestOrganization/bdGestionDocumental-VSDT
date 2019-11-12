
/*----------------------------------------------------------------------------------
* Metodo o PRG 		 : spGDConsultaTiposImagenes
* Desarrollado por	 : <\A Ing. Luis Fernando Benavides						   A\>
* Descripcion		 : <\D Consulta Tipos de Imagenes						   D\>
* Observaciones		 : <\O Proyecto/Mantenimiento:                             O\>
					   <\O Resolucion 458									   O\>
* Parametros		 : <\P P\>
* Variables			 : <\V V\>
* Fecha Creacion	 : <\FC 2014/03/13 										  FC\>
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
exec spGDConsultaTiposImagenes
*/
IF object_id('[dbo].[spGDConsultaTiposImagenes]') IS NULL
BEGIN
    EXEC sp_executesql N'CREATE PROCEDURE [dbo].[spGDConsultaTiposImagenes] AS SELECT 1;'
END
Go

Alter procedure [dbo].[spGDConsultaTiposImagenes]
--Create procedure [dbo].[spGDConsultaTiposImagenes]

AS

Set Nocount On

Declare	@fecha datetime
Set		@fecha = getdate()

Select		a.cnsctvo_cdgo_tpo_imgn, b.dscrpcn_tpo_imgn 
From		tbTiposImagenes a			with (nolock)
Inner join	tbTiposImagenes_vigencias b	with (nolock)
On			a.cnsctvo_cdgo_tpo_imgn = b.cnsctvo_cdgo_tpo_imgn
Where		@fecha between inco_vgnca and fn_vgnca 
and a.vsble_usro = 'S'

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Consultor de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaTiposImagenes] TO [visosservice_role]
    AS [dbo];

