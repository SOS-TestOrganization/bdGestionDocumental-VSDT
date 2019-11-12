

/*---------------------------------------------------------------------------------    
* Metodo o PRG      :  [spGDConsultarFechasDigitalizacionxPrestador] 
* Desarrollado por	: <\A Ing. Carlos Estupiñan							A\>    
* Descripcion		: <\D Consulta las fechas de digitalizacion por prestador	D\>    
* Observaciones     : <\O													O\>    
* Parametros		: <\P													P\>    
* Variables			: <\V													V\>    
* Fecha Creacion    : <\FC 2011/02/17										FC\>    
*    
*---------------------------------------------------------------------------------    
* DATOS DE MODIFICACION    
*---------------------------------------------------------------------------------    
* Modificado Por   : <\AM  AM\>    
* Descripcion   : <\DM  DM\>    
* Nuevos Parametros  : <\PM  PM\>    
* Nuevas Variables  : <\VM  VM\>    
* Fecha Modificacion  : <\FM  FM\>    
*---------------------------------------------------------------------------------*/
--	Atenea	bdGestionDocumental
Create Procedure	[dbo].[spGDConsultarFechasDigitalizacionxPrestador] --'10693306'
@lcPrestador char(20)


As
Set NoCount On


--Set	@lcPrestador	= '10693306'

Create table #tmpFechasDigitalizacion (vlr char(100),nmro_imgns int)

	insert into #tmpFechasDigitalizacion
		Select	ltrim(rtrim(vlr)) vlr, sum(nmro_imgns) nmro_imgns
		From	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados i
		inner join bdGestionDocumental.dbo.tbDocumentosDigitalizados d
		on		i.cnsctvo_cdgo_dcmnto	= d.cnsctvo_cdgo_dcmnto
		where	i.cnsctvo_cdgo_dcmnto	IN(	Select	cnsctvo_cdgo_dcmnto
										From	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
										Where	cnsctvo_cdgo_tpo_dcmntl =	16		--Prestadores
										and		vlr						=	@lcPrestador	)
		and		i.cnsctvo_cdgo_tpo_dcmntl =	16	
		and		i.cnsctvo_cdgo_tpo_indce	IN(20)	--Identificacion
		group by vlr
		Order by 1


Select *
From	#tmpFechasDigitalizacion


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [Coordinador Parametros Vision Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [380003 Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarFechasDigitalizacionxPrestador] TO [visosservice_role]
    AS [dbo];

