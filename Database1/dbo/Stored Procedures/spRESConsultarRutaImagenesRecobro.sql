
/*--------------------------------------------------------------------------------------------------------------------------------------              
* Procedimiento		:  dbo.[spRESConsultarRutaImagenesRecobro]               
* Desarrollado por  : <\A  Warner Fernando Valencia - Geniar SAS A\>                
* Descripción		: <\D Permite extraer la información  de facturas, recobros, numero radicación fosyga y el cosecutivo de las imagenes asociadas a los recobros .D\>     
* Observaciones		: <\O    O\>                
* Parámetros		: <\P    P\>
* Fecha Creación   : <\FC 2014/02/27 FC\>                 
*                

*-------------------------------------------------------------------------------------------------------------------------------------*/  
 
--exec  [dbo].[spRESConsultarRutaImagenesRecobro]
CREATE Procedure [dbo].[spRESConsultarRutaImagenesRecobro]
(               @facturasXML xml
  
)
as     
SET NOCOUNT ON

        -- Se crea una tabla temporal 
		Declare @rta_srvdr char(200)


        Create Table #TEMP1
        (
                nmro_envo  int,
                nmro_fctra int, 
                cnsctvo_fctra_sos_rcbro udtConsecutivo, 
                nmro_rcbro	char(20),
                nmro_rdccn_fsga char(20),
                cnsctvo_cdgo_imgn int,
                rta_imgn varchar(250)
                 
        )        
        -- Se inserta el numero de las facturas en la tabla temporal las cuales vienen en el XML
        Insert #TEMP1 (nmro_envo,nmro_fctra,cnsctvo_fctra_sos_rcbro,nmro_rcbro,nmro_rdccn_fsga,cnsctvo_cdgo_imgn) 
        Select  convert (numeric,cast(colx.query('data(numEnvio)') as varchar)) as numEnvio, 
                convert (numeric,cast(colx.query('data(numFactura)') as varchar)) as numFactura, 
                convert (numeric,cast(colx.query('data(numRecobro)') as varchar)) as numRecobro, 
                convert (numeric,cast(colx.query('data(numFacturaSOS)') as varchar)) as numFacturaSOS, 
                convert (numeric,cast(colx.query('data(numRadicacionFosyga)') as varchar)) as numRadicacionFosyga,
                convert (numeric,cast(colx.query('data(consecutivoImagen)') as varchar)) as consecutivoImagen                                                    
        From  @facturasXML.nodes('listaFactura/factura') as TABX(COLX);
        
		Set  @rta_srvdr = ''
		exec spGDTraerParametroGeneral 1, null, null, null, @rta_srvdr output, null, null
		--print @rta_srvdr
  
       Select  tmp.nmro_envo,  
               tmp.nmro_fctra,   
               tmp.cnsctvo_fctra_sos_rcbro,  
               tmp.nmro_rcbro,  
               tmp.nmro_rdccn_fsga,
               tmp.cnsctvo_cdgo_imgn, 
               ltrim(rtrim(@rta_srvdr))+a.rta_imgn,
               b.cnsctvo_cdgo_tpo_imgn,
               d.cdgo_tpo_dcmnto
        From  tbImagenesXDocumentosDigitalizados a 
              Inner Join #TEMP1 tmp                           On a.cnsctvo_cdgo_imgn = tmp.cnsctvo_cdgo_imgn
              Inner Join tbTiposImagenes                        b  On a.cnsctvo_cdgo_tpo_imgn = b.cnsctvo_cdgo_tpo_imgn
              Inner Join tbTiposImagenesXTiposDocumento         c  On  b.cnsctvo_cdgo_tpo_imgn = c.cnsctvo_cdgo_tpo_imgn
              Inner Join tbTiposDocumento                       d  On c.cnsctvo_cdgo_tpo_dcmnto = d.cnsctvo_cdgo_tpo_dcmnto
              order by tmp.nmro_fctra 
