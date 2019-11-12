
-- Atenea / Apolo

/*---------------------------------------------------------------------------------    
* Metodo o PRG      :  SpCRConsultaImagenesDigitalizadasSOS    
* Desarrollado por	: <\A Ing. Carlos Estupiñan									A\>    
* Descripcion		: <\D Recupera la ruta de las imagenes marcadas para imprimir	D\>    
* Observaciones     : <\O																	O\>    
* Parametros		: <\P																	P\>    
* Variables			: <\V																	V\>    
* Fecha Creacion    : <\FC 2009/10/08														FC\>    
*    
*---------------------------------------------------------------------------------    
* DATOS DE MODIFICACION    
*---------------------------------------------------------------------------------    
* Modificado Por		: <\AM  AM\>    
*
 Descripcion			: <\DM  DM\>    
* Nuevos Parametros		: <\PM  PM\>    
* Nuevas Variables		: <\VM  VM\>    
* Fecha Modificacion	: <\FM  FM\>    
*---------------------------------------------------------------------------------*/  
Create procedure [dbo].[SpCRConsultaImagenesDigitalizadasSOS]


AS
Set Nocount On  


	Select	i.*
	From	#tmpRecobrosImagenes r,
			tbImagenesxDocumentosDigitalizados i
	Where	r.cnsctvo_cdgo_imgn		= i.cnsctvo_cdgo_imgn
--	And		i.cnsctvo_cdgo_tpo_imgn	!= 100	--Facturas  (select * from tbTiposImagenes)
	order by cnsctvo_rdccn_rcbro,cnsctvo_ordn_imprsn


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SpCRConsultaImagenesDigitalizadasSOS] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SpCRConsultaImagenesDigitalizadasSOS] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SpCRConsultaImagenesDigitalizadasSOS] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SpCRConsultaImagenesDigitalizadasSOS] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SpCRConsultaImagenesDigitalizadasSOS] TO [visosservice_role]
    AS [dbo];

