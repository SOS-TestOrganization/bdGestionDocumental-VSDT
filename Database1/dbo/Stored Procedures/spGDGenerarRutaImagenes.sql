 
-- ============================================= 
-- Author:		<sisogb01> 
-- Create date: <23/04/2010> 
-- Description:	<Genera la ruta tentativa donde deberia quedar una imagen> 
-- dbo.spGDGenerarRutaImagenes '1010.tiff',6,18,'20090416','','\'
-- ============================================= 
CREATE PROCEDURE [dbo].[spGDGenerarRutaImagenes] ( 
	@rta_archvo				Varchar(500), 
	@cnsctvo_dgtlzdr		Int, 
	@cnsctvo_tpo_dcmnto		Int, 
	@fcha_dgtlzcn			DateTime, 
	@raiz					varchar(100), 
	@sprdr					varchar(2) 
	 
) 
AS 
BEGIN 
	SET NOCOUNT ON; 
	Declare @crpta_dgtlzdr		Varchar(500) 
	Declare @crpta_tpo_dcmnto	Varchar(500) 
	Declare @crpta_fcha_dgtlzcn	Varchar(500) 
	Declare @rta_incl			Varchar(500) 
	Declare @rta_intrna			Varchar(500) 
	 
	--Select  @rta_incl = vlr_prmtro_crctr From dbo.tbParametrosGenerales_vigencias Where cnsctvo_cdgo_prmtro_gnrl = 4 And	getDate() Between inco_vgnca And fn_vgnca 
 
	Select	@crpta_dgtlzdr = crpta_srvdr From dbo.tbDigitalizadores Where cnsctvo_cdgo_dgtlzdr = @cnsctvo_dgtlzdr 
 
	Select	@crpta_tpo_dcmnto = rta_tpo_dcmnto From dbo.tbTiposDocumento_Vigencias  
	Where	cnsctvo_cdgo_tpo_dcmnto = @cnsctvo_tpo_dcmnto 
	And		getDate() Between inco_vgnca And fn_vgnca 
 
	Set @crpta_fcha_dgtlzcn = convert(char(8),@fcha_dgtlzcn,112) 
	Select @crpta_fcha_dgtlzcn = Substring(Convert(Char(8),@fcha_dgtlzcn,112),1,4) + @sprdr +  
								 Substring(Convert(Char(8),@fcha_dgtlzcn,112),5,2) + @sprdr +  
								 Substring(Convert(Char(8),@fcha_dgtlzcn,112),7,9) + '' 
	 
	SET		@rta_intrna = replace(replace((@raiz + @sprdr + @crpta_dgtlzdr + 'Digitalizacion'+ @sprdr + @crpta_tpo_dcmnto + @crpta_fcha_dgtlzcn + @sprdr),'\',@sprdr),(@sprdr+@sprdr),@sprdr)
	SELECT  @rta_intrna as "rta",@rta_intrna + @rta_archvo as "rta_archvo" 
END 

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarRutaImagenes] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarRutaImagenes] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarRutaImagenes] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGenerarRutaImagenes] TO [visosservice_role]
    AS [dbo];

