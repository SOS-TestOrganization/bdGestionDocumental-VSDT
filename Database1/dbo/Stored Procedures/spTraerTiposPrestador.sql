
/*---------------------------------------------------------------------------------
* Metodo o PRG 	          :  spTraerTiposPrestador
* Desarrollado por		  : <\A Ing. Phaonr Mesias							A\>
* Descripcion			  : <\D Trae los tipor de prestador para recobros	D\>
* Observaciones		          	  : <\O											O\>
* Parametros			  : <\P  											P\>
* Variables			  : <\V  											V\>
* Fecha Creacion	          	  : <\FC 2015/10/								FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por			: <\AM  AM\>
* Descripcion			: <\DM  DM\>
* Nuevos Parametros		: <\PM  PM\>
* Nuevas Variables		: <\VM  VM\>
* Fecha Modificacion		: <\FM  FM\>
*---------------------------------------------------------------------------------*/
--exec spTraerTiposPrestador
Create	procedure dbo.spTraerTiposPrestador

AS
BEGIN
Set Nocount On

	Select	cdgo_tpo_mrca_prco_tcho,dscrpcn_tpo_mrca_prco_tcho,cnsctvo_cdgo_tpo_mrca_prco_tcho
	From	bdSisalud.dbo.tbTiposMarcasPrecioTecho  WITH (NOLOCK)
	Where	(vsble_usro	= 	'S' )

END
