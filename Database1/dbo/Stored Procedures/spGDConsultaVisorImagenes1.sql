


/*---------------------------------------------------------------------------------
* Metodo o PRG 	            :  spGDConsultaVisorImagenes
* Desarrollado por		 	: <\A Ing. JORGE A. PARRA							A\>
* Descripcion			  	: <\D PERMITE CONSULTAR LAS IMAGENES DIGITALIZAS PARA SER VISUALIZADAS DESDE EL APLICATIVO DE RECOBROS				D\>
* Observaciones		        : <\O											O\>
* Parametros			  	: <\P @mensaje											P\>
* Variables			  		: <\V  											V\>
* Fecha Creacion	          		: <\FC 2009/03/13									FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por				: <\AM  AM\>
* Descripcion				: <\DM 	DM\>
* Nuevos Parametros			: <\PM 	PM\>
* Nuevas Variables			: <\VM 	VM\>
* Fecha Modificacion			: <\FM 	FM\>
*---------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[spGDConsultaVisorImagenes1]
	@msnje varchar(150) output

AS

SET NOCOUNT ON


declare @cantidadIndicesXTipoDocumento  int,
		@cantidadIndice					int,
		@contador						int,
		@tipodocumental					int

--Tabla que almacena las Imagenes
CREATE TABLE #tbImagenes
(	accn varchar(50),
	rta_imgn varchar(250), 
	dscrpcn_tpo_imgn  udtDescripcion
)

--Almacena la cantidad de indices x Cada tipo de documento
create table #cantidadIndices
(	cnsctvo_cntdd int identity(1,1),
	cntdd int,
	cnsctvo_tpo_dcmntl int
)


BEGIN TRY


--Calculo la cantidad de indices por tipo de documento
insert into #cantidadIndices (cntdd,cnsctvo_tpo_dcmntl)
select  count(*) as cntdd,cnsctvo_tpo_dcmntl 
from	#tmpValoresIndices
group by cnsctvo_tpo_dcmntl


set @contador = 1 --permite iterar sobre el WHILE

--Indica la cantidad de indices
select @cantidadIndicesXTipoDocumento = count(*)
from	#cantidadIndices

Select * 
into #TiposImagenes
From tbTiposImagenes


WHILE  @contador <= @cantidadIndicesXTipoDocumento
	BEGIN
			--Obtengo la cantidad de indices que maneja cada tipo de Documento
			select @cantidadIndice = cntdd,
					@tipodocumental = cnsctvo_tpo_dcmntl
			from	#cantidadIndices
			where  cnsctvo_cntdd  =  @contador
				

			--Si maneja un indice compuesto
			IF @cantidadIndice > 1
				BEGIN
					-- si tienes varios ìndices
					INSERT INTO #tbImagenes (accn, rta_imgn,dscrpcn_tpo_imgn )
					SELECT DISTINCT 'NO SELECCIONADO' AS accn, B.rta_imgn, C.dscrpcn_tpo_imgn 
					FROM	#tmpValoresIndices	X
					INNER JOIN tbIndicesxDocumentosDigitalizados	A
					ON(	X.cnsctvo_indce			= A.cnsctvo_cdgo_tpo_indce	AND 
						LTRIM(RTRIM(X.vlr))		= LTRIM(RTRIM(A.vlr))		AND
						X.cnsctvo_tpo_dcmntl	= A.cnsctvo_cdgo_tpo_dcmntl  )
					INNER JOIN	tbImagenesxDocumentosDigitalizados	B
					ON ( A.cnsctvo_cdgo_dcmnto = B.cnsctvo_cdgo_dcmnto)
					INNER JOIN  #TiposImagenes C
					ON ( B.cnsctvo_cdgo_tpo_imgn = C.cnsctvo_cdgo_tpo_imgn )
					where	X.cnsctvo_tpo_dcmntl = @tipodocumental
					GROUP BY B.rta_imgn, C.dscrpcn_tpo_imgn, a.cnsctvo_cdgo_dcmnto,
					a.cnsctvo_cdgo_tpo_dcmntl
					HAVING COUNT(*) = @cantidadIndice
					ORDER BY C.dscrpcn_tpo_imgn
					
				END
			ELSE
				BEGIN	
					-- si tiene un sòlo indice
					INSERT INTO #tbImagenes (accn, rta_imgn,dscrpcn_tpo_imgn )	
					SELECT  DISTINCT 'NO SELECCIONADO' AS accn, B.rta_imgn, C.dscrpcn_tpo_imgn 
					FROM	#tmpValoresIndices	X
					INNER JOIN tbIndicesxDocumentosDigitalizados	A
					ON(	X.cnsctvo_indce			= A.cnsctvo_cdgo_tpo_indce	AND 
						ltrim(rtrim(X.vlr))		= ltrim(rtrim(A.vlr))		AND
						X.cnsctvo_tpo_dcmntl	= A.cnsctvo_cdgo_tpo_dcmntl  )
					INNER JOIN	tbImagenesxDocumentosDigitalizados	B
					ON ( A.cnsctvo_cdgo_dcmnto = B.cnsctvo_cdgo_dcmnto)
					INNER JOIN  #TiposImagenes C
					ON ( B.cnsctvo_cdgo_tpo_imgn = C.cnsctvo_cdgo_tpo_imgn )
					where	X.cnsctvo_tpo_dcmntl = @tipodocumental
					ORDER BY C.dscrpcn_tpo_imgn
				
				END
		SET @contador = @contador +1
	END


	SELECT DISTINCT * FROM #tbImagenes

	drop table #tbImagenes
	drop table #cantidadIndices	
	drop table #TiposImagenes
	




END TRY
BEGIN CATCH

	set @msnje = 'Se presento un error consultando las Imagenes para el Visor.'
	drop table #tbImagenes	
	
END CATCH





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [380003 Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaVisorImagenes1] TO [visosservice_role]
    AS [dbo];

