
/*--------------------------------------------------------------------------------------------------------------------------------------              
* Procedimiento		:  dbo.[spRECConsultarRutaImagenesRecobro]               
* Desarrollado por  : <\A  Warner Fernando Valencia - Geniar SAS A\>                
* Descripción		: <\D Permite extraer la información  de facturas, recobros, numero radicación fosyga y el cosecutivo de las imagenes asociadas a los recobros .D\>     
* Observaciones		: <\O    O\>                
* Parámetros		: <\P    P\>
* Fecha Creación   : <\FC 2014/02/27 FC\>                 
*                
<listaFactura>

<factura>
<numEnvio>
455
</numEnvio>
<numFactura>
54545
</numFactura>

<numRadicacionFosyga>

</numRadicacionFosyga>

</factura>
</listaFactura>
*-------------------------------------------------------------------------------------------------------------------------------------*/  
 
--exec  [dbo].[spRECConsultarRutaImagenesRecobro]
CREATE Procedure [dbo].[spRECConsultarRutaImagenesRecobro]
(               @facturasXML xml
  
)
as     
SET NOCOUNT ON


        
		    
		Declare @rta_srvdr char(200)
		-- Se crea una tabla temporal 
 
        Create Table #TEMP1
        (
               nmro_envo  int,
                nmro_fctra int, 
                cnsctvo_fctra_sos_rcbro udtConsecutivo, 
                nmro_rcbro	varchar(20),
                nmro_rdccn_fsga varchar(20),
                cnsctvo_cdgo_imgn int,
                rta_imgn varchar(250),
				cnsctvo_cdgo_tpo_dcmnto	udtConsecutivo,
				cdgo_tpo_dcmnto varchar(5)
                 
        )       
  
        -- Se inserta el numero de las facturas en la tabla temporal las cuales vienen en el XML
        Insert #TEMP1 (nmro_envo,nmro_fctra,cnsctvo_fctra_sos_rcbro,nmro_rcbro,nmro_rdccn_fsga,cnsctvo_cdgo_imgn,cnsctvo_cdgo_tpo_dcmnto,cdgo_tpo_dcmnto) 
        Select  convert (numeric,cast(colx.query('data(numEnvio)') as varchar)) as numEnvio, 
                convert (numeric,cast(colx.query('data(numFactura)') as varchar)) as numFactura, 
                cast(colx.query('data(numRecobro)') as varchar(20)) as numRecobro, 
                cast(colx.query('data(numFacturaSOS)') as varchar(20)) as numFacturaSOS, 
                convert (numeric,cast(colx.query('data(numRadicacionFosyga)') as varchar)) as numRadicacionFosyga,
                convert (numeric,cast(colx.query('data(consecutivoImagen)') as varchar)) as consecutivoImagen,
                convert (numeric,cast(colx.query('data(tipoImagen)') as varchar)) as tipoImagen,
				 cast(colx.query('data(tipoSoporteDocumental)') as varchar(5))  as tipoSoporteDocumental                                                     
        From  @facturasXML.nodes('listaFactura/factura') as TABX(COLX);
        
        --Se consulta la ruta  del servidor donde se encuentra las imagenes
		Set  @rta_srvdr = ''
		exec spGDTraerParametroGeneral 1, null, null, null, @rta_srvdr output, null, null

		--if UPPER(rtrim(ltrim(host_name()))) = upper('hades.sos.eps.co')
		--Begin
		--	--Set @rta_srvdr = '\\hades.sos.eps.co\imagenes'
		--	Set @rta_srvdr = '\imagenes'
		--End
	 
	 --Set @rta_srvdr = '\imagenes'
	 Set @rta_srvdr = '\\var\tmp'

	 --\\atlas
	 --/atlas

	 --\\imagenes
	 --/

INSERT INTO [dbo].[tbtemporal_sislbr01]
           ([nmro_envo]
           ,[nmro_fctra]
           ,[cnsctvo_fctra_sos_rcbro]
           ,[nmro_rcbro]
           ,[nmro_rdccn_fsga]
           ,[cnsctvo_cdgo_imgn]
           ,[rta_imgn]
           ,[cnsctvo_cdgo_tpo_dcmnto]
           ,[cdgo_tpo_dcmnto])
       Select  tmp.nmro_envo,  
               tmp.nmro_fctra,   
               tmp.cnsctvo_fctra_sos_rcbro,  
               tmp.nmro_rcbro,  
               tmp.nmro_rdccn_fsga,
               tmp.cnsctvo_cdgo_imgn, 
               ltrim(rtrim(@rta_srvdr))+a.rta_imgn as rta_imgn,
               tmp.cnsctvo_cdgo_tpo_dcmnto,
               tmp.cdgo_tpo_dcmnto
        From  tbImagenesXDocumentosDigitalizados 	        a with (nolock) 
              Inner Join #TEMP1 				tmp On a.cnsctvo_cdgo_imgn = tmp.cnsctvo_cdgo_imgn
              
              order by tmp.nmro_fctra 

		select * from dbo.tbtemporal_sislbr01
              
Drop Table #TEMP1              

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spRECConsultarRutaImagenesRecobro] TO [rcbrs_usr]
    AS [dbo];

