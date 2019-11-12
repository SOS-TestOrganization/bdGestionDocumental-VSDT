/*-------------------------------------------------------------------------------
* Procedimiento		: spCRConsultarRutaImagenesRecobro
* Desarrollado por  : <\A  Warner Fernando Valencia - Geniar SAS A\>                
* Descripción		: <\D Permite extraer la información  de facturas, recobros, D\>     
*					  <\D numero radicación fosyga y el cosecutivo de las imagenes asociadas a los recobros. D\>     
* Observaciones		: <\O    O\>                
* Parámetros		: <\P    P\>
* Fecha Creación	: <\FC 2014/02/27 FC\>                 
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------
* Modificado Por	 : <\AM Luis Fernando Benavides AM\>
* Descripcion		 : <\DM Ajuste para corregir imagenes que no estan en la unidad mapeada imagenes si no en ATLAS. DM\>
*					   <\DM Borra archivos en formato pdf aprobados por error DM\>
* Nuevos Parametros	 : <\PM PM\>
* Nuevas Variables	 : <\VM	VM\>
* Fecha Modificacion : <\FM	2015/11/13 FM\>
-----------------------------------------------------------------------------------
* Modificado Por	 : <\AM Meisner Preciado AM\>
* Descripcion		 : <\DM En GestionSolicitudes CTC esta guardando el nombre del servidor y por estandar debe solo quedar la ruta de la imagen no debe contener el servidor. Linea(95) 	DM\>
*					   <\DM Borra archivos en formato pdf aprobados por error DM\>
* Nuevos Parametros	 : <\PM PM\>
* Nuevas Variables	 : <\VM	VM\>
* Fecha Modificacion : <\FM	2016/09/15 FM\>
-----------------------------------------------------------------------------------
* Modificado Por	 : <\AM Ing. Jean Paul Villaquiran Madrigal AM\>
* Descripcion		 : <\DM Se realiza cambio en metodo de extracción de datos del xml para disminuir conversiones DM\>
					   <\DM Se integran dos update en uno solo, para mejorar rendimiento, autorizado DM\>
* Nuevos Parametros	 : <\PM PM\>
* Nuevas Variables	 : <\VM	VM\>
* Fecha Modificacion : <\FM	2017/03/22 FM\>
-----------------------------------------------------------------------------------
* Modificado Por	 : <\AM Ing. Jean Paul Villaquiran Madrigal AM\>
* Descripcion		 : <\DM Se quita variable numero de radicacion DM\>
* Nuevos Parametros	 : <\PM PM\>
* Nuevas Variables	 : <\VM	VM\>
* Fecha Modificacion : <\FM	2017/04/28 FM\>
-----------------------------------------------------------------------------------
* Modificado Por	 : <\AM Ing. Jean Paul Villaquiran Madrigal AM\>
* Descripcion		 : <\DM Se adiciona tipo de recobros DM\>
* Nuevos Parametros	 : <\PM PM\>
* Nuevas Variables	 : <\VM	VM\>
* Fecha Modificacion : <\FM	2017/07/24 FM\>
-----------------------------------------------------------------------------------
* Modificado Por	 : <\AM Ing. Jean Paul Villaquiran Madrigal AM\>
* Descripcion		 : <\DM se realiza refactorizacion de codigo, se adiciona llamado a stored procedure que adiciona imagenes faltantes a las glosas DM\>
* Nuevos Parametros	 : <\PM PM\>
* Nuevas Variables	 : <\VM	VM\>
* Fecha Modificacion : <\FM	2018/08/08 FM\>
*---------------------------------------------------------------------------------*/
/*
--test
	declare  @facturasXML xml;

	set @facturasXML = '<listaFactura>
						  <factura>
						   <numEnvio>136470</numEnvio>
						   <numFactura>1342970</numFactura>
						   <numRecobro>1342970</numRecobro>
						   <numFacturaSOS>1528218</numFacturaSOS>
						   <numRadicacionFosyga>100000</numRadicacionFosyga>
						   <consecutivoImagen>129667011</consecutivoImagen>
						   <tipoImagen>135</tipoImagen>
						   <tipoSoporteDocumental>T0001</tipoSoporteDocumental>
						   <numeroProcesoJuridico>0</numeroProcesoJuridico>
						   <numeroComunicadoRespuesta></numeroComunicadoRespuesta>
						  </factura>
						</listaFactura>';

	exec  [dbo].[spCRConsultarRutaImagenesRecobro] @facturasXML;
*/
CREATE Procedure [dbo].[spCRConsultarRutaImagenesRecobro]
(              
	@facturasXML xml  
)
as
begin       
	set nocount on;

	declare		@rta_srvdr	varchar(250),
				@consecutivoCodigoTipoIndice int,
				@consecutivoCodigoTipoImagen int,
				@codigoTipoDocumento varchar(5);

    create 
	table		#TEMP1
				(
				nmro_envo  int,
				nmro_fctra int, 
				cnsctvo_fctra_sos_rcbro udtConsecutivo, 
				nmro_rcbro	varchar(20),
				cnsctvo_cdgo_imgn int,
				rta_imgn varchar(250),
				cnsctvo_cdgo_tpo_dcmnto	udtConsecutivo,
				cdgo_tpo_dcmnto varchar(5),
				cnsctvo_cdgo_dcmnto udtConsecutivo,
				tpo_rcbro varchar(10),
				tne_dmnda int,
				nmro_dmnda varchar(20),
				nmro_cmncdo varchar(30)
				) ;     
  
	insert		#TEMP1			
				(
				nmro_envo,
				nmro_fctra,
				cnsctvo_fctra_sos_rcbro,
				nmro_rcbro,
				cnsctvo_cdgo_imgn,
				cnsctvo_cdgo_tpo_dcmnto,
				cdgo_tpo_dcmnto,
				tpo_rcbro,
				tne_dmnda,
				nmro_dmnda,
				nmro_cmncdo
				) 
	select		colx.value('(numEnvio)[1]','numeric'),
				colx.value('(numFactura)[1]','numeric'),
				colx.value('(numRecobro)[1]','varchar(20)'),
				colx.value('(numFacturaSOS)[1]','varchar(20)'),
				colx.value('(consecutivoImagen)[1]','numeric'),
				colx.value('(tipoImagen)[1]','numeric'),
				colx.value('(tipoSoporteDocumental)[1]','varchar(5)'),
				colx.value('(tipoRecobro)[1]','varchar(10)'),
				case ltrim(rtrim(colx.value('(esDemanda)[1]','varchar(10)'))) when 'true' then 1 else 0 end,
				colx.value('(numeroProcesoJuridico)[1]','varchar(20)'),
				rtrim(ltrim(colx.value('(numeroComunicadoRespuesta)[1]','varchar(30)')))
	from		@facturasXML.nodes('listaFactura/factura') as tabx(colx);

	
	--recupera los soportes adicionales para el caso de las facturas de envios de glosa 
	
	set			@consecutivoCodigoTipoIndice = 84;
	set			@consecutivoCodigoTipoImagen = 332;
	set			@codigoTipoDocumento = 'T0007';
	exec		dbo.spInsertarImagenesAdicionalesGlosa @consecutivoCodigoTipoIndice,@consecutivoCodigoTipoImagen,@codigoTipoDocumento;
	
	set			@consecutivoCodigoTipoIndice = 64;
	set			@consecutivoCodigoTipoImagen = 223;
	set			@codigoTipoDocumento = 'T0003';
	exec		dbo.spInsertarImagenesAdicionalesGlosa @consecutivoCodigoTipoIndice,@consecutivoCodigoTipoImagen,@codigoTipoDocumento;
	 
	set			@rta_srvdr = '';  
	update		#TEMP1
	set			rta_imgn = @rta_srvdr + dbo.fnCorregirRutaImagenesRecobro(a.rta_imgn)
	from		dbo.tbImagenesXDocumentosDigitalizados a  with (nolock) 
	inner join	#TEMP1 tmp 
	on			a.cnsctvo_cdgo_imgn = tmp.cnsctvo_cdgo_imgn;

	update		#TEMP1
	set			rta_imgn=replace(rta_imgn,'\\ATLAS','');

	/*ajuste temporal rutas ATLAS*/
	/*se realiza integración de dos update en uno solo adicionanado "OR", esto es autorizado ya que se comprueba
	rendimiento con plan de ejeución real Ing. felipe Arcos, Ing. Cesar Garcia autorizan*/
	update		#TEMP1
	set			rta_imgn = replace(rta_imgn,'\\imagenes','\\ATLAS')
	where		charindex('RESPONDE_ANEXOS',rta_imgn) != 0 or charindex('Imagenes_iSalud',rta_imgn) != 0;

	select		tmp.nmro_envo,  
				tmp.nmro_fctra,   
				tmp.cnsctvo_fctra_sos_rcbro,  
				tmp.nmro_rcbro,
				tmp.cnsctvo_cdgo_imgn, 
				tmp.rta_imgn as rta_imgn,
				tmp.cnsctvo_cdgo_tpo_dcmnto,
				tmp.cdgo_tpo_dcmnto,
				a.cnsctvo_cdgo_dcmnto,
				tmp.tpo_rcbro,
				tmp.tne_dmnda
	from		dbo.tbImagenesXDocumentosDigitalizados a with (nolock) 
	inner join	#TEMP1 tmp 
	on			a.cnsctvo_cdgo_imgn = tmp.cnsctvo_cdgo_imgn
	group by	tmp.nmro_envo,  
				tmp.nmro_fctra,   
				tmp.cnsctvo_fctra_sos_rcbro,  
				tmp.nmro_rcbro,  				
				tmp.cnsctvo_cdgo_imgn, 
				tmp.rta_imgn,
				tmp.cnsctvo_cdgo_tpo_dcmnto,
				tmp.cdgo_tpo_dcmnto,
				a.cnsctvo_cdgo_dcmnto,
				a.cnsctvo_cdgo_imgn,
				tmp.tpo_rcbro,
				tmp.tne_dmnda
	order by	tmp.nmro_fctra, 
				a.cnsctvo_cdgo_imgn;
              
	drop table	#TEMP1;                
END 
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCRConsultarRutaImagenesRecobro] TO [visosservice_role]
    AS [dbo];

