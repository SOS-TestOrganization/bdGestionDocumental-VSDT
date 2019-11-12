
/*-------------------------------------------------------------------------------------------------
* Metodo o PRG 			: spGDConsultarDocumentoDigitalizado
* Desarrollado por		: <\A Omar A. Granados  A\>
* Descripcion			: <\D Procidimiento para consultar un documentos digitalizado 
                              a partir de su llave primaria 
						  D\>
* Observaciones			: <\O O\>
* Parametros			: <\P P\>
* Variables				: <\V V\>
*---------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM Omar A. Granados  AM\>
* Descripcion			 : <\DM Se agrega reemplazo busqueda y concatenacion de la ruta 
                                de almacenamiento definida en parametros generales 
							DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM 2015/04/14  FM\>
*---------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM Omar A. Granados  AM\>
* Descripcion			 : <\DM  Se agregan hints with(nolock) para consultas DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM 2017/06/05  FM\>
*---------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM Ing. Victor Hugo Gil Ramos  AM\>
* Descripcion			 : <\DM 
                               Se modifica el procedimiento adicionando tabla temporal
							   para la validacion de los digitadores
							   Se optimiza procedimiento
                            DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM 2017/12/20  FM\>
*---------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM Ing. Omar A. Granados  AM\>
* Descripcion			 : <\DM 
                               	De forma PROVISIONAL se elimina el digitalizador SOS_GSA del calculo de la raiz mientras se envia solucion definitiva.
						    DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM 2017/12/22  FM\>
*---------------------------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------------------------
* Modificado Por		 : <\AM Ing. Omar A. Granados  AM\>
* Descripcion			 : <\DM 
                               	Se habilita el digitalizador SOS_GSA del calculo de la raiz de la ruta y se agrega reemplazo de la ruta raiz.
						    DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM 2018/01/15  FM\>
*---------------------------------------------------------------------------------------------------*/ 
--Exec dbo.[spGDConsultarDocumentoDigitalizado] 24855659 
CREATE PROCEDURE dbo.spGDConsultarDocumentoDigitalizado
	@cnsctvo_dcmnto udtConsecutivo 
AS
BEGIN 
	SET NOCOUNT ON; 
 
	Declare @rutaAlmacenamiento        Varchar(100)  ,
			@fechaActual		       Datetime      ,
			@vlr_uno                   Int           ,
			@vlr_ds                    Int	         ,
			@vlr_trs                   Int           ,
			@cnsctvo_cdgo_dgtlzdr_isld udtConsecutivo,
			@cnsctvo_cdgo_dgtlzdr_mga  udtConsecutivo;

	Declare @Documentos Table(tmp					  udtConsecutivo Default(1), 
			                  cnsctvo_cdgo_dcmnto	  udtConsecutivo, 
			                  cnsctvo_cdgo_tpo_dcmntl udtConsecutivo, --NO SE ESTA USANDO POR AHORA 
			                  dscrpcn_tpo_dcmntl	  Varchar(300)  , --NO SE ESTA USANDO POR AHORA 
			                  nmro_imgns			  Int           , --NO SE ESTA USANDO POR AHORA 
			                  cnsctvo_cdgo_dgtlzdr	  udtConsecutivo, --NO SE ESTA USANDO POR AHORA 
			                  dscrpcn_dgtlzdr		  Varchar(300)  , --NO SE ESTA USANDO POR AHORA 
			                  fcha_dgtlzcn			  Datetime      , --NO SE ESTA USANDO POR AHORA 
			                  cnsctvo_cdgo_imgn		  udtConsecutivo, 
			                  cnsctvo_cdgo_tpo_imgn	  udtConsecutivo, 
			                  dscrpcn_tpo_imgn		  Varchar(300)  ,  
			                  rta_imgn				  Varchar(250)  , 
			                  prncpl				  udtLogico     , 
			                  estdo					  udtLogico
		                     )

	Declare @tmpDigitalizadores Table(id                   udtConsecutivo Identity(1,1),  
	                                  cnsctvo_cdgo_dgtlzdr udtConsecutivo,
									  rta_antga				   varchar(50) Default(''),
									  rta_nva				   varchar(50) Default('')
	                                 )

	Set	@fechaActual               = getDate()
	Set	@rutaAlmacenamiento        = ''
	Set @vlr_uno                   = 1
	Set @vlr_ds                    = 2
	Set @vlr_trs                   = 3
	Set @cnsctvo_cdgo_dgtlzdr_isld = 11 --iSalud - Transfiriendo
	Set @cnsctvo_cdgo_dgtlzdr_mga  = 13 --SOS_GSA

	Insert Into @tmpDigitalizadores Values (@cnsctvo_cdgo_dgtlzdr_isld,'','')
	Insert Into @tmpDigitalizadores Values (@cnsctvo_cdgo_dgtlzdr_mga,'\Data_Osipro\VisosService','')
		
	Insert 
	Into    @Documentos(cnsctvo_cdgo_dcmnto, cnsctvo_cdgo_tpo_dcmntl, cnsctvo_cdgo_dgtlzdr, 
	                    nmro_imgns         , fcha_dgtlzcn           , tmp 
			           )   
	Select	dd.cnsctvo_cdgo_dcmnto,	dd.cnsctvo_cdgo_tpo_dcmntl,	dd.cnsctvo_cdgo_dgtlzdr,		
	        dd.nmro_imgns         , dd.fcha_dgtlzcn           , @vlr_uno
	From	BDGestionDocumental.dbo.tbdocumentosdigitalizados dd With(NoLock)
	Where	cnsctvo_cdgo_dcmnto = @cnsctvo_dcmnto

	Insert 
	Into       @Documentos(cnsctvo_cdgo_dcmnto, cnsctvo_cdgo_tpo_dcmntl, cnsctvo_cdgo_dgtlzdr , nmro_imgns,
				           fcha_dgtlzcn       , cnsctvo_cdgo_imgn      , cnsctvo_cdgo_tpo_imgn, rta_imgn  ,
				           prncpl             , estdo                  , tmp
			              ) 
	Select     d.cnsctvo_cdgo_dcmnto, d.cnsctvo_cdgo_tpo_dcmntl, d.cnsctvo_cdgo_dgtlzdr , d.nmro_imgns,
			   d.fcha_dgtlzcn       , i.cnsctvo_cdgo_imgn      , i.cnsctvo_cdgo_tpo_imgn, i.rta_imgn  ,
			   i.prncpl             , i.estdo                  , @vlr_ds
	From	   BDGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados i	With(NoLock)
	Inner Join @Documentos d 
	On         d.cnsctvo_cdgo_dcmnto = i.cnsctvo_cdgo_dcmnto

	Delete
	From   @Documentos
	Where  tmp = @vlr_uno

	Insert 
	Into      @Documentos(cnsctvo_cdgo_dcmnto  , cnsctvo_cdgo_tpo_dcmntl, dscrpcn_tpo_dcmntl, cnsctvo_cdgo_dgtlzdr,
                          dscrpcn_dgtlzdr      , nmro_imgns             , fcha_dgtlzcn      , cnsctvo_cdgo_imgn   ,
                          cnsctvo_cdgo_tpo_imgn, dscrpcn_tpo_imgn       , rta_imgn          , prncpl              ,
                          estdo                , tmp
			           )
	Select	  d.cnsctvo_cdgo_dcmnto  , d.cnsctvo_cdgo_tpo_dcmntl, tdl.dscrpcn_tpo_dcmntl, d.cnsctvo_cdgo_dgtlzdr,
			  dg.dscrpcn_dgtlzdr     , d.nmro_imgns             , d.fcha_dgtlzcn        , d.cnsctvo_cdgo_imgn   ,
			  d.cnsctvo_cdgo_tpo_imgn, ti.dscrpcn_tpo_imgn      , rta_imgn              , prncpl                ,
			  estdo                  , @vlr_trs
	From	  @Documentos d 
	Left Join BDGestionDocumental.dbo.tbTiposDocumental	tdl	With(NoLock)
	On	      tdl.cnsctvo_cdgo_tpo_dcmntl = d.cnsctvo_cdgo_tpo_dcmntl 
	Left Join BDGestionDocumental.dbo.tbDigitalizadores	dg	With(NoLock)
	On	      dg.cnsctvo_cdgo_dgtlzdr = d.cnsctvo_cdgo_dgtlzdr
	Left Join BDGestionDocumental.dbo.tbTiposImagenes ti With(NoLock)
	On	      ti.cnsctvo_cdgo_tpo_imgn = d.cnsctvo_cdgo_tpo_imgn
	
	Select @rutaAlmacenamiento = vlr_prmtro_crctr
	From   bdGestionDocumental.dbo.tbParametrosGenerales_Vigencias With(NoLock)
	where  cnsctvo_cdgo_prmtro_gnrl = @vlr_uno --RutaAlmacenamiento
	And	   @fechaActual Between inco_vgnca And fn_vgnca

	-- Concatenar Servidor a la ruta cuando sea digitalizador iSalud y la ruta no contenga la ruta de almacenamiento.
	Update	   a
	Set		   rta_imgn = @rutaAlmacenamiento + replace(rta_imgn,rta_antga,rta_nva)
	From	   @Documentos a
	Inner Join @tmpDigitalizadores b
	On         b.cnsctvo_cdgo_dgtlzdr = a.cnsctvo_cdgo_dgtlzdr
	Where	   Not(rta_imgn like @rutaAlmacenamiento+'%')

	Delete
	From	@Documentos
	Where	tmp = @vlr_ds

	Select	tmp              , cnsctvo_cdgo_dcmnto  , cnsctvo_cdgo_tpo_dcmntl, dscrpcn_tpo_dcmntl,
			nmro_imgns       , cnsctvo_cdgo_dgtlzdr , dscrpcn_dgtlzdr        , fcha_dgtlzcn      ,  
			cnsctvo_cdgo_imgn, cnsctvo_cdgo_tpo_imgn, dscrpcn_tpo_imgn       , rta_imgn          ,
			prncpl           , estdo
	From	@Documentos
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentoDigitalizado] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentoDigitalizado] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentoDigitalizado] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentoDigitalizado] TO [autsalud_rol]
    WITH GRANT OPTION
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentoDigitalizado] TO [visosservice_role]
    AS [dbo];

