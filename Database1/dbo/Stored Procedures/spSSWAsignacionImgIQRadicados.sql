
/*---------------------------------------------------------------------------------
* Metodo o PRG 				: [spSSWAsignacionImgIQRadicados]
* Desarrollado Por			: <\AC	Analista de Desarrollo Cristhian Hernandez - QVision AC\>
* Descripcion				: <\DC  Copiar datos de factura devuelta - SIL_FCC_229 DC\>
* Nuevos Parametros			: <\PC  PC\>
* Nuevas Variables			: <\VC  VC\>
* Fecha Creacion			: <\FC	2018/12/28	FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION   
*---------------------------------------------------------------------------------  
* Modificado Por			: <\AM  Ing. Jean Paul Villaquiran AM\>
* Descripcion				: <\DM  Se realiza refactorización de codigo de acuerdo a los estandares de SOS EPS DM\>
* Nuevos Parametros	 		: <\PM  PM\>
* Nuevas Variables			: <\VM  VM\>
* Fecha Modificacion		: <\FM  2019/02/11 FM\>
----------------------------------------------------------------------------------*/

CREATE PROCEDURE [dbo].[spSSWAsignacionImgIQRadicados]
(
    @xml xml,
	@usuario udtUsuario
)
as
set nocount on;
begin
	begin try
		declare		@fechaActual datetime = getdate(), 
					@tipoIndiceNumeroRadicacion int = 2,
					@tipoDocumentoFactura int = 2,
					@mensajeError varchar(max) = 'Ocurrió error copiando las imagenes a la factura nueva: ';

		set nocount on;

		--Radicaciones para procesar
		create 
		table		#radicacionesAProcesar
					(
					nmro_rdccn_antrr				varchar(10),
					nmro_rdccn_nva					varchar(10)
					);

		create		
		table		#tbIndicesxImagenesDigitalizadas
					(
					cnsctvo_indce_imgn_dgtlzda int,
					nmro_rdccn_nva varchar(10),
					cnsctvo_cdgo_imgn int,
					cnsctvo_cdgo_dcmnto int,
					cnsctvo_cdgo_tpo_dcmntl int,
					cnsctvo_cdgo_tpo_indce int,
					vlr varchar(10)
					);

		create 
		table		#tbIndicesxDocumentosDigitalizados
					(
					cnsctvo_indce_dcmnto int,
					nmro_rdccn_nva varchar(10),
					cnsctvo_cdgo_dcmnto int,
					cnsctvo_cdgo_tpo_dcmntl int ,
					cnsctvo_cdgo_tpo_indce int,
					vlr varchar(10)
					);		

		--Datos enviados por medio del XML
		insert 
		into		#radicacionesAProcesar
					(
					nmro_rdccn_antrr,
					nmro_rdccn_nva
					)  
		Select		cast(colx.query('data(nroRadicacionOrigen)') as varchar(max)) as nmro_rdccn_antrr,
					cast(colx.query('data(nroRadicacionDestino)') as varchar(max)) as nmro_rdccn_nva
		from		@xml.nodes('cargue/fila') as TABX(COLX);

		---Tabla temporal para guardar tbIndicesxImagenesDigitalizadas Origen
		insert into	#tbIndicesxImagenesDigitalizadas
					(
					cnsctvo_indce_imgn_dgtlzda,
					nmro_rdccn_nva,
					cnsctvo_cdgo_imgn,
					cnsctvo_cdgo_dcmnto,
					cnsctvo_cdgo_tpo_dcmntl,
					cnsctvo_cdgo_tpo_indce,
					vlr
					)
		select		a.cnsctvo_indce_imgn_dgtlzda,
					b.nmro_rdccn_nva,
					a.cnsctvo_cdgo_imgn,
					a.cnsctvo_cdgo_dcmnto,
					a.cnsctvo_cdgo_tpo_dcmntl,
					a.cnsctvo_cdgo_tpo_indce,
					a.vlr					
		from		dbo.tbIndicesxImagenesDigitalizadas a with(nolock) 
		inner join	#radicacionesAProcesar b
		On			b.nmro_rdccn_antrr = a.vlr
		where		a.cnsctvo_cdgo_tpo_indce = @tipoIndiceNumeroRadicacion
		and			a.cnsctvo_cdgo_tpo_dcmntl = @tipoDocumentoFactura;

		---Tabla temporal para guardar tbIndicesxDocumentosDigitalizados Origen
		insert into	#tbIndicesxDocumentosDigitalizados
					(
					cnsctvo_indce_dcmnto,
					nmro_rdccn_nva,
					cnsctvo_cdgo_dcmnto,
					cnsctvo_cdgo_tpo_dcmntl,
					cnsctvo_cdgo_tpo_indce,
					vlr
					)
		select		a.cnsctvo_indce_dcmnto,
					b.nmro_rdccn_nva,
					a.cnsctvo_cdgo_dcmnto,
					a.cnsctvo_cdgo_tpo_dcmntl,
					a.cnsctvo_cdgo_tpo_indce,
					a.vlr
		from		dbo.tbIndicesxDocumentosDigitalizados a with(nolock) 
		inner join	#radicacionesAProcesar b
		On			b.nmro_rdccn_antrr = a.vlr
		where		a.cnsctvo_cdgo_tpo_indce = @tipoIndiceNumeroRadicacion;

		--Graba nuevo tbIndicesxImagenesDigitalizadas para la radicacion Detino
		insert into BDGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas
					(
					cnsctvo_cdgo_imgn,
					cnsctvo_cdgo_dcmnto,
					cnsctvo_cdgo_tpo_dcmntl,
					cnsctvo_cdgo_tpo_indce,
					vlr
					) 
		select		cnsctvo_cdgo_imgn,
					cnsctvo_cdgo_dcmnto,
					cnsctvo_cdgo_tpo_dcmntl,
					cnsctvo_cdgo_tpo_indce,
					a.nmro_rdccn_nva 
		from		#tbIndicesxImagenesDigitalizadas a with(nolock);

		--Graba nuevo tbIndicesxDocumentosDigitalizados para la radicacion Detino
		insert into BDGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
					(
					cnsctvo_cdgo_dcmnto,
					cnsctvo_cdgo_tpo_dcmntl,
					cnsctvo_cdgo_tpo_indce,
					vlr
					) 
		select		a.cnsctvo_cdgo_dcmnto,
					a.cnsctvo_cdgo_tpo_dcmntl,
					a.cnsctvo_cdgo_tpo_indce,
					a.nmro_rdccn_nva 
		from		#tbIndicesxDocumentosDigitalizados a;
	end try
	begin catch
		set			@mensajeError = @mensajeError+error_message();
		throw		51000,@mensajeError,1;
	end catch	
end
GO
GRANT ALTER
    ON OBJECT::[dbo].[spSSWAsignacionImgIQRadicados] TO [suit_webusr]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[spSSWAsignacionImgIQRadicados] TO [suit_webusr]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spSSWAsignacionImgIQRadicados] TO [suit_webusr]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[spSSWAsignacionImgIQRadicados] TO [suit_webusr]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[spSSWAsignacionImgIQRadicados] TO [suit_webusr]
    AS [dbo];

