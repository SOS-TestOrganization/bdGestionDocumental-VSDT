----/*---------------------------------------------------------------------------------
----* Metodo o PRG 	         :  spGDConsultarDocumentosVisorRecobros
----* Desarrollado por		 :  <\A   Ing. Juan Carlos Vásquez García						A\>
----* Descripcion			 :  <\D  Generar archivo xml de las imagenes de Recobros		D\>
----* Observaciones		     :  <\O															O\>
----* Parametros			 :  <\P	 #tbImagenes = tabla temporal enviada desde fox que 
----*								sirve como insumo para generar el archivo XML			P\>
----* Variables				 :  <\V															V\>
----* Fecha Creacion		 :  <\FC 2015/08/05						     					FC\>
----*  
----*---------------------------------------------------------------------------------
----* DATOS DE MODIFICACION 
----*---------------------------------------------------------------------------------  
----* Modificado Por		 : <\AM   AM\>
----* Descripcion			 : <\DM   DM\>
----*						   <\DM DM\>
----* Nuevos Parametros	 	 : <\PM   PM\>
----* Nuevas Variables		 : <\VM   VM\>
----* Fecha Modificacion	 : <\FM   FM\>
----*---------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[spGDConsultarDocumentosVisorRecobros]

As

Set NoCount On

Begin

	Declare	@lcServidorImagenes		varchar(150),
			@lcfctra				udtConsecutivo,
			@xmlcadena				xml
	 
	Declare @tmpConsecutivosDocumentos Table(
			cnsctvo_cdgo_dcmnto		udtConsecutivo)

	Declare @tmpDocumentos Table(
			dscrpcn_agrpdr_tpo_imgn	udtDescripcion, 
			dscrpcn_tpo_imgn		udtDescripcion,
			cnsctvo_cdgo_imgn		udtConsecutivo,
			cnsctvo_cdgo_dcmnto		udtConsecutivo, 
			rta_imgn				udtObservacion,
			ordn_agrpdr_tpo_imgn	udtConsecutivo,
			cnsctvo_cdgo_tpo_imgn	udtConsecutivo,
			dscrpcn_agrpdr_dcmnto	udtDescripcion,
			dscrpcn_imgn			udtDescripcion
	)
	
	Select		@lcServidorImagenes = Ltrim(Rtrim(vlr_prmtro_crctr))
	From		tbParametrosGenerales_Vigencias
	Where		cnsctvo_cdgo_prmtro_gnrl	=  1
	And			inco_vgnca					<= Getdate()
	And			fn_vgnca					>= Getdate()
	  
	-- tranformamos los datos de la tabla temporal de recobros a la estructura de la tabla para generar XML
	Insert 
	Into		@tmpDocumentos		
	Select		Space(150) As dscrpcn_agrpdr_tpo_imgn,		
				dscrpcn_tpo_imgn,									cnsctvo_cdgo_imgn,				cnsctvo_cdgo_dcmnto,
				@lcServidorImagenes + Ltrim(Rtrim(rta_imgn)),		0 As ordn_agrpdr_tpo_imgn,		cnsctvo_cdgo_tpo_imgn,
				Space(150) As dscrpcn_agrpdr_dcmnto,	Space(150) As dscrpcn_imgn
	From		#tbImagenes

	Update		a
	Set			dscrpcn_agrpdr_dcmnto		= 'Factura : ' +  Ltrim(Rtrim(b.vlr))
	From		@tmpDocumentos a
	Inner Join	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados b	with(nolock)
	On			a.cnsctvo_cdgo_dcmnto = b.cnsctvo_cdgo_dcmnto
	Where		b.cnsctvo_cdgo_tpo_indce	= 3
	And			b.cnsctvo_cdgo_tpo_dcmntl	= 2  -- Facturas

	Select top 1	@lcfctra = cnsctvo_cdgo_dcmnto
	From			@tmpDocumentos;

	Update		a
	Set			dscrpcn_agrpdr_tpo_imgn      = c.dscrpcn_agrpdr_tpo_imgn	
	From		@tmpDocumentos a
	Inner Join	bdGestionDocumental.dbo.tbAgrupadoresTiposImagenxTiposImagenes b with(nolock)	
	On a.cnsctvo_cdgo_tpo_imgn			= b.cnsctvo_cdgo_tpo_imgn
	Inner Join	bdGestionDocumental.dbo.tbAgrupadoresTiposImagen c with(nolock)					
	On b.cnsctvo_cdgo_agrpdr_tpo_imgn	= c.cnsctvo_cdgo_agrpdr_tpo_imgn

	Update		a
	Set			dscrpcn_agrpdr_tpo_imgn     = 'Otros Soportes Facturas'
	From		@tmpDocumentos a
	Where		dscrpcn_agrpdr_tpo_imgn		in('','Vacio')

	Update		a
	Set			dscrpcn_tpo_imgn     = 'Otros Anexos'
	From		@tmpDocumentos a
	Where		dscrpcn_tpo_imgn	in('','Vacio')

	Update		a
	Set			dscrpcn_imgn     = 'Imagen ' +  Ltrim(Rtrim(Str(a.cnsctvo_cdgo_imgn)))
	From		@tmpDocumentos a


			-- validamos si existen imagenes asociadas a la radicación
		IF exists(select 1 from @tmpDocumentos)
			begin
				
				-- generamos la consulta xml
				-- y enviamos el resultado de la consulta
				SELECT (
					Select 'EXPORTAR' as [@permisoUsuario], (
						Select		'Recobros' as 'titulo', (
									Select	cat1.dscrpcn_agrpdr_dcmnto  as [titulo], (
										Select		cat3.dscrpcn_agrpdr_tpo_imgn  as [titulo], (
											Select		cat4.dscrpcn_tpo_imgn  as [titulo], (
												Select		cat5.dscrpcn_imgn  as [titulo],
															cat5.cnsctvo_cdgo_imgn [id],
															cat5.rta_imgn as [ruta]
												From		@tmpDocumentos cat5
												where		cat5.dscrpcn_agrpdr_dcmnto = cat1.dscrpcn_agrpdr_dcmnto
														AND cat5.dscrpcn_agrpdr_tpo_imgn = cat3.dscrpcn_agrpdr_tpo_imgn
														AND cat5.dscrpcn_tpo_imgn = cat4.dscrpcn_tpo_imgn
												Order by	cat5.cnsctvo_cdgo_imgn
												for xml path ('imagen'), type
												)
											From		@tmpDocumentos cat4
											where		cat4.dscrpcn_agrpdr_dcmnto = cat1.dscrpcn_agrpdr_dcmnto
													AND cat4.dscrpcn_agrpdr_tpo_imgn = cat3.dscrpcn_agrpdr_tpo_imgn
											group by	cat4.dscrpcn_tpo_imgn
											Order by	cat4.dscrpcn_tpo_imgn
											for xml path ('categoria'), type
											)
										From		@tmpDocumentos cat3
										where		cat3.dscrpcn_agrpdr_dcmnto = cat1.dscrpcn_agrpdr_dcmnto
										group by	cat3.dscrpcn_agrpdr_tpo_imgn
										Order by	cat3.dscrpcn_agrpdr_tpo_imgn
										for xml path ('categoria'), type
										)
						From		@tmpDocumentos cat1
						group by	cat1.dscrpcn_agrpdr_dcmnto
						Order by	cat1.dscrpcn_agrpdr_dcmnto
						for xml path ('categoria'),  type
					)for xml path ('visosImagenes'), type), (
						Select 'Factura' as nombre, 
								@lcfctra	as valor 
						for xml path ('propiedad'), root('visosPropiedades'),type
					)
					for xml path ('visosModelo'), TYPE
				) AS [xmlarchivo];
		end
	 
	drop table #tbImagenes
End


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [700004 Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorRecobros] TO [visosservice_role]
    AS [dbo];

