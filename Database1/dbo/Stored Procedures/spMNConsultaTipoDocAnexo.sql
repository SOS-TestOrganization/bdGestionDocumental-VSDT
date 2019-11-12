
/*------------------------------------------------------------------------------------------
* Método o PRG		:	dbo.spMNConsultaTipoDocAnexo							
* Desarrollado por	: <\A	Ing. Juan Carlos Paz H		    	  A\>	
* Descripción		: <\D   Devuelve los Tipos de Documentos      D\>	
* Observaciones		: <\O																O\>	
* Parámetros		: <\P																P\>	
* Variables			: <\V																V\>	
* Fecha Creación	: <\	FC 2009/08/25												FC\>
*-------------------------------------------------------------------------------------------
* DATOS DE MODIFICACIÓN																		
*-------------------------------------------------------------------------------------------
* Modificado Por	: <\AM	Ing. Cesar García											AM\>
* Descripción		: <\DM	Retornar Tipos de Imágenes									DM\>
* Nuevos Parámetros	: <\PM																PM\>
* Nuevas Variables	: <\VM																VM\>
* Fecha Modificación: <\FM	2010/09/27 11:32pm											FM\>
*-----------------------------------------------------------------------------------------*/
CREATE PROCEDURE	[dbo].[spMNConsultaTipoDocAnexo]
@cnsctvo_cdgo_tpo_imgn_fnte int

As
Set NoCount On

/*
Declare	@ldFechaHoy	DATETIME
Set		@ldFechaHoy	= GETDATE()

Select	a.cnsctvo_cdgo_tpo_imgn,	a.cdgo_tpo_imgn, a.dscrpcn_tpo_imgn
From	dbo.tbTiposImagenes_vigencias a
Where   a.cnsctvo_cdgo_tpo_imgn_fnte = @cnsctvo_cdgo_tpo_imgn_fnte
*/


Declare		@tbTiposImagenesxTipoDocumento As Table
(
cnsctvo_cdgo_tpo_imgn		Int,
cdgo_tpo_imgn				Varchar(5),
dscrpcn_tpo_imgn			Varchar(150)
)

Insert Into	@tbTiposImagenesxTipoDocumento
Select		cnsctvo_cdgo_tpo_imgn,		'',				''
From		bdGestionDocumental.dbo.tbTiposImagenesxTiposDocumento
Where		cnsctvo_cdgo_tpo_dcmnto		=	@cnsctvo_cdgo_tpo_imgn_fnte


Update		@tbTiposImagenesxTipoDocumento
Set			cdgo_tpo_imgn		=	b.cdgo_tpo_imgn,
			dscrpcn_tpo_imgn	=	b.dscrpcn_tpo_imgn
From		@tbTiposImagenesxTipoDocumento							a
Inner Join	bdGestionDocumental.dbo.tbTiposImagenes_Vigencias		b	On	b.cnsctvo_cdgo_tpo_imgn		=	a.cnsctvo_cdgo_tpo_imgn

Select		cnsctvo_cdgo_tpo_imgn,		cdgo_tpo_imgn,			dscrpcn_tpo_imgn
From		@tbTiposImagenesxTipoDocumento
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [310009 Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [310004 Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Auxiliar Prestaciones Medicas y Validacion de Derechos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Coordinador Juridico Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [visosservice_role]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spMNConsultaTipoDocAnexo] TO [Auditor Autorizador CNA]
    AS [dbo];

