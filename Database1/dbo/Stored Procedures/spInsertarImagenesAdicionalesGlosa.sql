/*-------------------------------------------------------------------------------
* Procedimiento		: spInsertarImagenesAdicionalesGlosa
* Desarrollado por  : <\A	Ing. Jean Paul Villaquiran Madrigal A\>                
* Descripción		: <\D	Inserta imagenes adicionales a las glosas D\>
* Observaciones		: <\O   O\>
* Parámetros		: <\P   P\>
* Fecha Creación	: <\FC	2018/08/08 FC\>                 
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------
* Modificado Por	 : <\AM AM\>
* Descripcion		 : <\DM DM\>
* Nuevos Parametros	 : <\PM PM\>
* Nuevas Variables	 : <\VM	VM\>
* Fecha Modificacion : <\FM	FM\>
-----------------------------------------------------------------------------------
*/
CREATE Procedure [dbo].[spInsertarImagenesAdicionalesGlosa]
(
	@consecutivoCodigoTipoIndice int,
	@consecutivoCodigoTipoImagen int,
	@codigoTipoDocumento varchar(5)
)
as
begin
	set nocount on;

	begin try
		create 
		table		#tbIndicesxImagenesDigitalizadas
					(
					cnsctvo_cdgo_imgn int,
					cnsctvo_cdgo_tpo_indce int,
					vlr varchar(255),
					);

		insert 
		into		#tbIndicesxImagenesDigitalizadas
					(
					cnsctvo_cdgo_imgn,
					cnsctvo_cdgo_tpo_indce,
					vlr
					)
		select		a.cnsctvo_cdgo_imgn,
					a.cnsctvo_cdgo_tpo_indce,
					rtrim(ltrim(a.vlr))
		from		dbo.tbIndicesxImagenesDigitalizadas a with(nolock)
		inner join	dbo.tbImagenesxDocumentosDigitalizados b with(nolock)
		on			a.cnsctvo_cdgo_imgn = b.cnsctvo_cdgo_imgn
		where		a.cnsctvo_cdgo_tpo_indce = @consecutivoCodigoTipoIndice;

		if			@consecutivoCodigoTipoIndice = 84 and @consecutivoCodigoTipoImagen = 332
		begin
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
			select		t.nmro_envo,
						t.nmro_fctra,
						t.cnsctvo_fctra_sos_rcbro,
						t.nmro_rcbro,
						b.cnsctvo_cdgo_imgn,
						b.cnsctvo_cdgo_tpo_imgn,
						@codigoTipoDocumento as cdgo_tpo_dcmnto,
						t.tpo_rcbro,
						t.tne_dmnda,
						t.nmro_dmnda,
						t.nmro_cmncdo	
			from		#TEMP1 t 
			inner join	#tbIndicesxImagenesDigitalizadas a
			on			t.nmro_cmncdo = a.vlr
			inner join	dbo.tbImagenesxDocumentosDigitalizados b with (nolock)
			on			a.cnsctvo_cdgo_imgn			= b.cnsctvo_cdgo_imgn
			where		b.cnsctvo_cdgo_tpo_imgn		= @consecutivoCodigoTipoImagen
			and			t.nmro_cmncdo != ''
			group by	t.nmro_envo,
						t.nmro_fctra,
						t.cnsctvo_fctra_sos_rcbro,
						t.nmro_rcbro,
						b.cnsctvo_cdgo_imgn,
						b.cnsctvo_cdgo_tpo_imgn,
						t.tpo_rcbro,
						t.tne_dmnda,
						t.nmro_dmnda,
						t.nmro_cmncdo;
		end

		if			@consecutivoCodigoTipoIndice = 64 and @consecutivoCodigoTipoImagen = 223
		begin
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
			select		t.nmro_envo,
						t.nmro_fctra,
						t.cnsctvo_fctra_sos_rcbro,
						t.nmro_rcbro,
						b.cnsctvo_cdgo_imgn,
						b.cnsctvo_cdgo_tpo_imgn,
						@codigoTipoDocumento as cdgo_tpo_dcmnto,
						t.tpo_rcbro,
						t.tne_dmnda,
						t.nmro_dmnda,
						t.nmro_cmncdo	
			from		#TEMP1 t 
			inner join	#tbIndicesxImagenesDigitalizadas a
			on			t.nmro_fctra = a.vlr
			inner join	dbo.tbImagenesxDocumentosDigitalizados b with (nolock)
			on			a.cnsctvo_cdgo_imgn			= b.cnsctvo_cdgo_imgn
			where		b.cnsctvo_cdgo_tpo_imgn		= @consecutivoCodigoTipoImagen
			and			t.nmro_cmncdo != ''
			group by	t.nmro_envo,
						t.nmro_fctra,
						t.cnsctvo_fctra_sos_rcbro,
						t.nmro_rcbro,
						b.cnsctvo_cdgo_imgn,
						b.cnsctvo_cdgo_tpo_imgn,
						t.tpo_rcbro,
						t.tne_dmnda,
						t.nmro_dmnda,
						t.nmro_cmncdo;
		end
	end try
	begin catch
		throw;
	end catch
end