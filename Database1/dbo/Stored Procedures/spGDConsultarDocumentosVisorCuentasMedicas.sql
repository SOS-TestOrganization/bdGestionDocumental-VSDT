----/*---------------------------------------------------------------------------------
----* Metodo o PRG 	         :  spGDConsultarDocumentosVisorCuentasMedicas
----* Desarrollado por		 :  <\A   Ing. Juan Carlos Vásquez García						A\>
----* Descripcion			 :  <\D  Generar archivo xml de las imagenes de ctas medicas	D\>
----* Observaciones		     :  <\O															O\>
----* Parametros			 :  <\P  @lcNumeroRadicacion = Número de Radicación
----*								 @lnIndiceAtencion = Número Indice de Atención					
----*								 @lcError	= indicador manejo de error					P\>
----* Variables				 :  <\V															V\>
----* Fecha Creacion		 :  <\FC 2015/07/21						     					FC\>
----*  
----*---------------------------------------------------------------------------------
----* DATOS DE MODIFICACION 
----*---------------------------------------------------------------------------------  
----* Modificado Por		 : <\AM Samuel Muñoz  AM\>
----* Descripcion			 : <\DM Se ajusta la estructura del arbol de consulta de imagenes para que no tenga tantos niveles DM\>
----*						   <\DM DM\>
----* Nuevos Parametros	 	 : <\PM   PM\>
----* Nuevas Variables		 : <\VM   VM\>
----* Fecha Modificacion	 : <\FM 2015/08/18 FM\>
----*---------------------------------------------------------------------------------

----*---------------------------------------------------------------------------------
----* DATOS DE MODIFICACION 
----*---------------------------------------------------------------------------------  
----* Modificado Por		 : <\AM Ing. Juan Carlos Vásquez García  AM\>
----* Descripcion			 : <\DM Se ajusta para clasificar la consulta si es de factura Global o Individual			 DM\>
----*						   <\DM DM\>
----* Nuevos Parametros	 	 : <\PM   PM\>
----* Nuevas Variables		 : <\VM   VM\>
----* Fecha Modificacion	 : <\FM 2016/01/29 FM\>
----*---------------------------------------------------------------------------------*/
/*
exec spGDConsultarDocumentosVisorCuentasMedicas '1001760006  ',Null,''
exec spGDConsultarDocumentosVisorCuentasMedicas '9772660',Null,''
*/
CREATE Procedure [dbo].[spGDConsultarDocumentosVisorCuentasMedicas]
/*1*/  @lcNumeroRadicacion		Varchar(23),
/*2*/  @lnIndiceAtencion		Varchar(10)	= Null,
/*3*/  @lcError					char(1)		= '0' Output

As

Set NoCount On

Begin

--set @lcNumeroRadicacion='1000194383' --'1150091918' --'1000194383'
--select @lcNumeroRadicacion;

	Declare	@lcServidorImagenes		VarChar(50),
			@xmlcadena				xml,
			@lcNumeroFactura		VarChar(50),
			@lcFechaActual			Datetime,
			@lncntddatncs			int
			

	Set @lcFechaActual = Getdate()
	Set @lncntddatncs = 0

			
	Declare @tmpConsecutivosDocumentos Table(
			cnsctvo_cdgo_dcmnto		udtConsecutivo);

	Declare @tmpDocumentos Table(
			atncn					udtConsecutivo,	
			dscrpcn_agrpdr_atncn	udtDescripcion,		
			dscrpcn_tpo_imgn		udtDescripcion,
			cnsctvo_cdgo_imgn		udtConsecutivo,
			cnsctvo_cdgo_dcmnto		udtConsecutivo, 
			rta_imgn				udtObservacion,
			cnsctvo_cdgo_tpo_imgn	udtConsecutivo,
			ordn_agrpdr_tpo_imgn	udtConsecutivo);

	Insert 
	Into		@tmpConsecutivosDocumentos
	Select		cnsctvo_cdgo_dcmnto
	From		bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados a With(NoLock)
	Where		a.cnsctvo_cdgo_tpo_indce	= 2
	And			a.vlr						= @lcNumeroRadicacion
	And			a.cnsctvo_cdgo_tpo_dcmntl	= 2;  -- Facturas

	Select		@lcNumeroFactura			= 'Factura : ' +  Ltrim(Rtrim(b.vlr))
	From		@tmpConsecutivosDocumentos a
	Inner Join	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados b	With(NoLock) On	a.cnsctvo_cdgo_dcmnto = b.cnsctvo_cdgo_dcmnto
	Where		b.cnsctvo_cdgo_tpo_indce	= 3   -- Numero Radicacion
	And			b.cnsctvo_cdgo_tpo_dcmntl	= 2;  -- Factura


	If @lnIndiceAtencion Is Not Null
		Begin 
			/* Consulta x Atencion */
			Insert 
			Into		@tmpDocumentos
			Select		@lnIndiceAtencion As atncn,				Space(150) As dscrpcn_agrpdr_atncn,			i.dscrpcn_tpo_imgn,						
						c.cnsctvo_cdgo_imgn,					a.cnsctvo_cdgo_dcmnto,						b.rta_imgn,								
						b.cnsctvo_cdgo_tpo_imgn,				4 As ordn_agrpdr_tpo_imgn
			From		@tmpConsecutivosDocumentos a
			Inner Join	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados b With(NoLock)	On	a.cnsctvo_cdgo_dcmnto		= b.cnsctvo_cdgo_dcmnto
			Inner Join	bdGestionDocumental.dbo.tbTiposImagenes i					 With(NoLock)	On	b.cnsctvo_cdgo_tpo_imgn		= i.cnsctvo_cdgo_tpo_imgn
			Inner Join	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas c	 With(NoLock)	On	b.cnsctvo_cdgo_dcmnto		= c.cnsctvo_cdgo_dcmnto
																									And	b.cnsctvo_cdgo_imgn			= c.cnsctvo_cdgo_imgn
																									And	c.cnsctvo_cdgo_tpo_indce	= 71	-- Consecutivo tipo indice 
																									And	c.cnsctvo_cdgo_tpo_dcmntl	= 2		-- Factura
			Where		c.vlr		= @lnIndiceAtencion		-- Indice Atencion 
			Order by	b.cnsctvo_cdgo_imgn;
		End 
	Else 
		Begin
			/* Consulta x Radicacion */

			--Select * from bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados where cnsctvo_cdgo_imgn= 83321497
			Insert 
			Into		@tmpDocumentos		
			Select		1 As atncn,								Space(150) As dscrpcn_agrpdr_atncn,			i.dscrpcn_tpo_imgn,						
						b.cnsctvo_cdgo_imgn,					b.cnsctvo_cdgo_dcmnto,						b.rta_imgn,								
						i.cnsctvo_cdgo_tpo_imgn,				4 As ordn_agrpdr_tpo_imgn
			From		@tmpConsecutivosDocumentos a
			Inner Join	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados b	With(NoLock) On	a.cnsctvo_cdgo_dcmnto	= b.cnsctvo_cdgo_dcmnto
			Inner Join	bdGestionDocumental.dbo.tbTiposImagenes i						With(NoLock) On	b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
			Order by	b.cnsctvo_cdgo_imgn;

			/* ajuste geniarjcv -2016-01-29*/
			select		@lncntddatncs = count(1)
			From		@tmpDocumentos a
			Inner Join	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas b With(NoLock)	
			On			a.cnsctvo_cdgo_imgn			= b.cnsctvo_cdgo_imgn
			And			b.cnsctvo_cdgo_tpo_indce	= 71	-- Consecutivo Atencion
			And			b.cnsctvo_cdgo_tpo_dcmntl	= 2;	-- Factura
			
			if @lncntddatncs > 1
				Begin
					Update		a
					Set			atncn      = b.vlr
					From		@tmpDocumentos a
					Inner Join	bdGestionDocumental.dbo.tbIndicesxImagenesDigitalizadas b With(NoLock)	
					On			a.cnsctvo_cdgo_imgn			= b.cnsctvo_cdgo_imgn
					And			b.cnsctvo_cdgo_tpo_indce	= 71	-- Consecutivo Atencion
					And			b.cnsctvo_cdgo_tpo_dcmntl	= 2;	-- Factura
				End
			
		End 
			
	Update		a
	Set			dscrpcn_agrpdr_atncn		= 'Atencion : ' +  Ltrim(Rtrim(Str(a.atncn)))
	From		@tmpDocumentos a
	Where		a.atncn						> 0;

	Update		a
	Set			dscrpcn_agrpdr_atncn		= 'General'
	From		@tmpDocumentos a
	Where		a.atncn						= 0;
										
	Update		a
	Set			ordn_agrpdr_tpo_imgn		= c.ordn
	From		@tmpDocumentos a
	Inner Join	bdGestionDocumental.dbo.tbAgrupadoresTiposImagenxTiposImagenes b With(NoLock)	On  a.cnsctvo_cdgo_tpo_imgn				= b.cnsctvo_cdgo_tpo_imgn
	Inner Join	bdGestionDocumental.dbo.tbAgrupadoresTiposImagen_Vigencias c	 With(NoLock)	On  b.cnsctvo_cdgo_agrpdr_tpo_imgn		= c.cnsctvo_cdgo_agrpdr_tpo_imgn
																								And	c.cnsctvo_cdgo_estrctra_arbl_vsr	= 1 -- Consulta Cuentas Medicas
																								And	c.inco_vgnca						<= @lcFechaActual
																								And	c.fn_vgnca							>= @lcFechaActual

	Select		@lcServidorImagenes = Ltrim(Rtrim((vlr_prmtro_crctr)))
	From		bdGestionDocumental.dbo.tbParametrosGenerales_Vigencias
	Where		cnsctvo_cdgo_prmtro_gnrl	=  1
	And			inco_vgnca					<= @lcFechaActual
	And			fn_vgnca					>= @lcFechaActual;
	
	-- validamos si existen imagenes asociadas a la radicación
	IF Exists(Select 1 From @tmpDocumentos)
		Begin			
			-- Generamos la consulta xml
			-- y enviamos el resultado de la consulta
			SELECT (Select 'EXPORTAR' As [@permisoUsuario], (
				Select	@lcNumeroFactura As 'titulo', (
						Select	cat1.dscrpcn_agrpdr_atncn As [titulo], (
								Select	cat2.dscrpcn_tpo_imgn  As [titulo], (
										Select	cat3.cnsctvo_cdgo_imgn [id],
												'Imagen ' +  Ltrim(Rtrim(Str(cat3.cnsctvo_cdgo_imgn)))  As [titulo],
												@lcServidorImagenes + Ltrim(Rtrim(cat3.rta_imgn))	As [ruta]
										From	@tmpDocumentos cat3
										Where	cat3.dscrpcn_agrpdr_atncn	= cat1.dscrpcn_agrpdr_atncn
										And		cat3.dscrpcn_tpo_imgn		= cat2.dscrpcn_tpo_imgn
										Order by cat3.cnsctvo_cdgo_imgn
										For XML Path ('imagen'), Type)
								From		@tmpDocumentos cat2
								Where		cat2.dscrpcn_agrpdr_atncn = cat1.dscrpcn_agrpdr_atncn
								Group by	cat2.dscrpcn_tpo_imgn, cat2.ordn_agrpdr_tpo_imgn
								Order by	cat2.ordn_agrpdr_tpo_imgn
								For XML Path ('categoria'), Type)
						From	@tmpDocumentos cat1
						Group by cat1.atncn, cat1.dscrpcn_agrpdr_atncn
						Order by cat1.atncn
						For XML Path ('categoria'),  Type)
				For XML Path ('visosImagenes'), Type),(
				Select 'Radicacion' As nombre, 	@lcNumeroRadicacion	As valor 
				For xml path ('propiedad'), root('visosPropiedades'),Type)
			For XML Path ('visosModelo'), Type)
			As	[xmlarchivo];
	End
Else
	Begin
		-- No existen imagenes asociadas a la radicación
		Set @lcError = '1';
	End
End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorCuentasMedicas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorCuentasMedicas] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorCuentasMedicas] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorCuentasMedicas] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorCuentasMedicas] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorCuentasMedicas] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorCuentasMedicas] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorCuentasMedicas] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorCuentasMedicas] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarDocumentosVisorCuentasMedicas] TO [Auditor Interno de Cuentas Medicas]
    AS [dbo];

