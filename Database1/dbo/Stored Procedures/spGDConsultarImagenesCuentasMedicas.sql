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
exec spGDConsultarImagenesCuentasMedicas '24511694','129211',null,null,null
exec spGDConsultarImagenesCuentasMedicas '1001729564','1'
exec spGDConsultarImagenesCuentasMedicas '1001729564','1','1122239',null,null,'732150'
*/
CREATE Procedure [dbo].[spGDConsultarImagenesCuentasMedicas]
/*1*/  @lcNumeroRadicacion		Varchar(23),
/*2*/  @lnIndiceAtencion		Varchar(10)=null,
/*3*/  @lnNumeroNotificacion    varchar(10)=null,
/*3*/  @lnNumeroSede			varchar(10)=null,
/*3*/  @lnNumeroOficina			varchar(10)=null,
/*4*/  @lnNumeroActa			varchar(10)=null			


As
Set NoCount On
Begin

	Declare	@lcServidorImagenes		VarChar(30),
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
			ordn_agrpdr_tpo_imgn	udtConsecutivo,
			cnsctvo_cdgo_tpo_dcmnto udtConsecutivo);



    
	Declare @tbDocumentosNotificacion table (cnsctvo_cdgo_dcmnto int)

	Declare @tbDocumentosActas table (cnsctvo_cdgo_dcmnto int)

	if @lnNumeroNotificacion is not null
	begin
		insert @tbDocumentosNotificacion(cnsctvo_cdgo_dcmnto)
		Select distinct cnsctvo_cdgo_dcmnto
		from BDGestionDocumental.dbo.tbindicesxDocumentosDigitalizados  With(NoLock)
		where cnsctvo_cdgo_tpo_indce=5 
		and vlr=@lnNumeroNotificacion
	end

	if @lnNumeroActa is not null
	begin
		Insert @tbDocumentosActas(cnsctvo_cdgo_dcmnto)
		Select distinct d1.cnsctvo_cdgo_dcmnto
		from  BDGestionDocumental.dbo.tbindicesxDocumentosDigitalizados d1 With(NoLock) inner join @tbDocumentosNotificacion d2
		on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
		where d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto
		and d1.cnsctvo_cdgo_tpo_indce=8
		and d1.vlr=@lnNumeroActa
	end


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
						b.cnsctvo_cdgo_tpo_imgn,				4 As ordn_agrpdr_tpo_imgn,					0 as cnsctvo_cdgo_tpo_dcmnto
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
						i.cnsctvo_cdgo_tpo_imgn,				4 As ordn_agrpdr_tpo_imgn,					0 as cnsctvo_cdgo_tpo_dcmnto
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


	/*adicionar imagenes de actas*/
	Insert 	Into		@tmpDocumentos
	Select		1 As atncn,				Space(150) As dscrpcn_agrpdr_atncn,			i.dscrpcn_tpo_imgn,						
				b.cnsctvo_cdgo_imgn,					a.cnsctvo_cdgo_dcmnto,						b.rta_imgn,								
				b.cnsctvo_cdgo_tpo_imgn,				4 As ordn_agrpdr_tpo_imgn,		0 as cnsctvo_cdgo_tpo_dcmnto
	From		@tbDocumentosActas a
	Inner Join	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados b With(NoLock)	On	a.cnsctvo_cdgo_dcmnto		= b.cnsctvo_cdgo_dcmnto
	Inner Join	bdGestionDocumental.dbo.tbTiposImagenes i					 With(NoLock)	On	b.cnsctvo_cdgo_tpo_imgn		= i.cnsctvo_cdgo_tpo_imgn
	Order by	b.cnsctvo_cdgo_imgn;
			
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
	update @tmpDocumentos
	set cnsctvo_cdgo_tpo_dcmnto= d1.cnsctvo_cdgo_tpo_dcmntl
	from bdGestionDocumental.dbo.tbDocumentosDigitalizados d1  With(NoLock) inner join @tmpDocumentos d2
	on d1.cnsctvo_cdgo_dcmnto=d2.cnsctvo_cdgo_dcmnto


	Select	--ROW_NUMBER() OVER (ORDER BY dscrpcn_tpo_imgn,slccndo) AS ordn,
			dscrpcn_tpo_imgn,
			rta_imgn,
			dscrpcn_agrpdr_atncn,			
			cnsctvo_cdgo_imgn,
			cnsctvo_cdgo_dcmnto,			
			cnsctvo_cdgo_tpo_imgn,
			ordn_agrpdr_tpo_imgn,
			atncn,
			cnsctvo_cdgo_tpo_dcmnto
	from @tmpDocumentos 
	order  by dscrpcn_tpo_imgn
	
	
End

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesCuentasMedicas] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesCuentasMedicas] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesCuentasMedicas] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesCuentasMedicas] TO [Consultor de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesCuentasMedicas] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarImagenesCuentasMedicas] TO [Radicador de Cuentas Medicas]
    AS [dbo];

