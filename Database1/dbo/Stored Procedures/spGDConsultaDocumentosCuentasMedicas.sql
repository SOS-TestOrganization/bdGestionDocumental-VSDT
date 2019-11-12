/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentosCuentasMedicas
* Desarrollado por		 :  <\A   Ing. Samuel Muñoz		A\>
* Descripcion			 :  <\D  						D\>
* Observaciones		     :  <\O							O\>
* Parametros			 :  <\P   						P\>
* Variables				 :  <\V							V\>
* Fecha Creacion		 :  <\FC 20090318     			FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Luis Fernando Benavides  AM\>
* Descripcion			 : <\DM Amplia campo nmro_fctra de Char(15) a Char(30)  DM\>
*						   <\DM de la tabla temporal @tmpDocumentos				DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  2014/12/19 FM\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Luis Fernando Benavides  AM\>
* Descripcion			 : <\DM Ajuste consulta x atencion  DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  2015/01/16 FM\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Luis Fernando Benavides  AM\>
* Descripcion			 : <\DM Corrige registro repetidos ajuste consulta x atencion  DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  2015/02/03 FM\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM Luis Fernando Benavides  AM\>
* Descripcion			 : <\DM Campo de ordenamiento: fcha_dgtlzcn era igual para las radicaciones individuales,			DM\>
*						   <\DM se remplazo por el campo cnsctvo_cdgo_imgn de la tabla tbImagenesxDocumentosDigitalizados	DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM  2015/04/24 FM\>
*---------------------------------------------------------------------------------*/

/*
exec spGDConsultaDocumentosCuentasMedicas null,null,1000194383,null,null,null,null,null,null,null,'G'
*/

CREATE Procedure [dbo].[spGDConsultaDocumentosCuentasMedicas]
/*1*/	@lcNumeroIdentificacion			Varchar(23)		= Null,
/*2*/	@lcNumeroFactura				Varchar(23)		= Null,
/*3*/	@lcNumeroRadicacion				Varchar(23)		= Null,
/*4*/	@lcNumeroRecobro				Varchar(23)		= Null,
/*5*/	@lnConsecutivoTipoDocumental	Int				= Null,
/*6*/	@lcNumeroBolsa					Varchar(23)		= Null,
/*7*/	@ldFechaInicioDigitalizacion	Datetime		= Null,
/*8*/	@ldFechaFinDigitalizacion		Datetime		= Null,
/*9*/	@lcError						Varchar(2)		Output,
/*10*/  @lnIndiceAtencion				Varchar(4)		= Null,
/*11*/	@lcTipoFactura					Varchar(1)		= Null
As
Set NoCount On

Declare @lnConsecutivoAgrupadorDocumentos	tinyint

Set @lnConsecutivoAgrupadorDocumentos = 4 -- Cuentas Medicas

Set @lcError = '0' -- Ok

/* 2015-01-30 sislbr01 */
/* Valida si la factura es global o individual */
/*
If rtrim(ltrim(@lcTipoFactura)) in ('I','')
	Set	@lnIndiceAtencion = Null
*/

If @ldFechaInicioDigitalizacion	Is Null 
	Set @ldFechaInicioDigitalizacion = '1995-01-01'

If @ldFechaFinDigitalizacion	Is Null 
	Set @ldFechaFinDigitalizacion = '9999-12-31'

Declare @tmpDocumentos Table(
		cnsctvo_cdgo_dcmnto		udtConsecutivo, 
		dscrpcn_dgtlzdr			udtDescripcion,	
		dscrpcn_tpo_dcmnto		udtDescripcion, 
		fcha_dgtlzcn			Datetime, 
		blsa					udtDescripcion,	
		nmro_idntfccn			udtNumeroIdentificacion, 
		nmro_fctra				Char(30),
		nmro_rdccn				udtNumeroFormulario, 
		nmro_rcbro				udtNumeroFormulario, 
		tpo_idntfccn			Char(2))

Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)

If @lcNumeroRecobro	Is Not Null
	Begin
		Insert Into	@tmpConsecutivosDocumentos
		Select	cnsctvo_cdgo_dcmnto
		From	tbIndicesxDocumentosDigitalizados a
		Where	a.cnsctvo_cdgo_tpo_indce	=	9	-- Numero de Recobro
		And		a.vlr						=	@lcNumeroRecobro
		And		Exists (Select 1 
							From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)
		
		If @@Error != 0
			Set @lcError = '1'
	End

If @lcNumeroFactura	Is Not Null
	Begin
		Insert Into	@tmpConsecutivosDocumentos
		Select	cnsctvo_cdgo_dcmnto
		From	tbIndicesxDocumentosDigitalizados a
		Where	a.cnsctvo_cdgo_tpo_indce	=	3 -- Numero de Factura
		And		a.vlr						=	@lcNumeroFactura
		And		Exists (Select 1 
							From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

		If @@Error != 0
			Set @lcError = '1'
	End
Else
	If @lcNumeroRadicacion Is Not Null
		Begin
			Insert Into	@tmpConsecutivosDocumentos
			Select	cnsctvo_cdgo_dcmnto
			From	tbIndicesxDocumentosDigitalizados a
			Where	a.cnsctvo_cdgo_tpo_indce	=	2 -- Numero de Radicación
			And		a.vlr						=	@lcNumeroRadicacion
			And		Exists (Select 1 
							From	tbTiposDocumento b 
							Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
							And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

			If @@Error != 0
				Set @lcError = '1'
		End
	Else
		If @lcNumeroIdentificacion Is Not Null
			Begin
				Insert Into	@tmpConsecutivosDocumentos
				Select	cnsctvo_cdgo_dcmnto
				From	tbIndicesxDocumentosDigitalizados a
				Where	a.cnsctvo_cdgo_tpo_indce	=	1
				And		a.vlr						=	@lcNumeroIdentificacion
				And		Exists (Select 1 
								From	tbTiposDocumento b 
								Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
								And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

				If @@Error != 0
					Set @lcError = '1'
			End
		Else
			If @lcNumeroBolsa Is Not Null
				Begin
					Insert Into	@tmpConsecutivosDocumentos
					Select	cnsctvo_cdgo_dcmnto
					From	tbIndicesxDocumentosDigitalizados a
					Where	a.cnsctvo_cdgo_tpo_indce	=	14
					And		a.vlr						=	@lcNumeroBolsa
					And		Exists (Select 1 
								From	tbTiposDocumento b 
								Where	a.cnsctvo_cdgo_tpo_dcmntl	= b.cnsctvo_cdgo_tpo_dcmnto
								And		b.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos)	

					If @@Error != 0
						Set @lcError = '1'
				End

If @lcNumeroFactura Is Null And  @lcNumeroBolsa Is Null And @lcNumeroIdentificacion Is Null And @lcNumeroRecobro Is Null And @lcNumeroRadicacion Is Null
	Begin
		Insert Into	@tmpDocumentos
		Select	a. cnsctvo_cdgo_dcmnto,			b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn,					space(30) as blsa,			space(23) as nmro_idntfccn,
				space(23)	as nmro_fctra,		space(15) as nmro_rdccn,	space(2) as tpo_idntfccn,
				space(23)	as nmro_rcbro
		From		dbo.tbDocumentosDigitalizados a
			Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
			Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
		Where		fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
		And			(a.cnsctvo_cdgo_tpo_dcmntl	= @lnConsecutivoTipoDocumental Or @lnConsecutivoTipoDocumental Is Null)
		And			d.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos

		If @@Error != 0
			Set @lcError = '1'
	End
Else
	Begin
		Insert Into		@tmpDocumentos
		Select	a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,		d.dscrpcn_tpo_dcmnto, 
				a.fcha_dgtlzcn,				space(30) as blsa,		space(23) as nmro_idntfccn,
				space(23)	as nmro_fctra,		space(15) as nmro_rdccn,	space(2) as tpo_idntfccn,
				space(23)	as nmro_rcbro
		From		dbo.tbDocumentosDigitalizados a
			Inner Join	dbo.tbDigitalizadores b On (a.cnsctvo_cdgo_dgtlzdr		= b.cnsctvo_cdgo_dgtlzdr)
			Inner Join	dbo.tbTiposDocumento d	On (a.cnsctvo_cdgo_tpo_dcmntl	= d.cnsctvo_cdgo_tpo_dcmnto)
		Where		fcha_dgtlzcn Between @ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
		And			(a.cnsctvo_cdgo_tpo_dcmntl = @lnConsecutivoTipoDocumental Or @lnConsecutivoTipoDocumental Is Null)
		And			Exists (Select 1 
							From @tmpConsecutivosDocumentos e 
							Where a.cnsctvo_cdgo_dcmnto = e.cnsctvo_cdgo_dcmnto)
		And			d.cnsctvo_agrpdr_tpo_dcmntl	= @lnConsecutivoAgrupadorDocumentos
		
		If @@Error != 0
			Set @lcError = '1'
	End

Update	@tmpDocumentos
Set	blsa =(Select	ltrim(rtrim(vlr))
		From	tbIndicesxDocumentosDigitalizados b
		Where	b.cnsctvo_cdgo_tpo_indce	= 14
		And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	nmro_fctra =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 3
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'


Update	@tmpDocumentos
Set	nmro_rdccn =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 2
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	nmro_rcbro =(Select	ltrim(rtrim(vlr))
				From	tbIndicesxDocumentosDigitalizados b
				Where	b.cnsctvo_cdgo_tpo_indce	= 9
				And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	nmro_idntfccn =(Select	ltrim(rtrim(vlr))
					From	tbIndicesxDocumentosDigitalizados b
					Where	b.cnsctvo_cdgo_tpo_indce	= 1
					And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

Update	@tmpDocumentos
Set	tpo_idntfccn =(Select	ltrim(rtrim(vlr))
					From	tbIndicesxDocumentosDigitalizados b
					Where	b.cnsctvo_cdgo_tpo_indce	= 7 -- Tipo Identificación
					And		b.cnsctvo_cdgo_dcmnto		= a.cnsctvo_cdgo_dcmnto)
From	@tmpDocumentos a

If @@Error != 0
	Set @lcError = '1'

/* 2015-02-03 sislbr01 */
/* Corrige registro repetidos ajuste consulta x atencion */
If rtrim(ltrim(@lcTipoFactura)) in ('I')
Begin
	/* Consulta x radicacion */
	Select	top 2000 a.*, i.dscrpcn_tpo_imgn, b.rta_imgn, b.prncpl,	b.cnsctvo_cdgo_imgn,	'NO SELECCIONADO' as accn
	From		@tmpDocumentos a
	Inner Join	tbImagenesxDocumentosDigitalizados b	On a.cnsctvo_cdgo_dcmnto	= b.cnsctvo_cdgo_dcmnto
	Inner Join	tbTiposImagenes i						On b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
	Order by	a.fcha_dgtlzcn Desc, b.cnsctvo_cdgo_imgn /*2015-04-24 sislbr01*/
	/*
	--ANTES
	--Order by a.fcha_dgtlzcn Desc
	*/
End 
Else 
Begin
	If @lnIndiceAtencion is not null
	Begin 
		/* Consulta x atencion */
		Select	top 2000 a.*, i.dscrpcn_tpo_imgn, b.rta_imgn, b.prncpl,	b.cnsctvo_cdgo_imgn,	'NO SELECCIONADO' as accn
		From		@tmpDocumentos a
		Inner Join	tbImagenesxDocumentosDigitalizados b	On a.cnsctvo_cdgo_dcmnto	= b.cnsctvo_cdgo_dcmnto
		Inner Join	tbTiposImagenes i						On b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
		Inner Join	tbIndicesxImagenesDigitalizadas c		On b.cnsctvo_cdgo_dcmnto	= c.cnsctvo_cdgo_dcmnto
		And			b.cnsctvo_cdgo_imgn	= c.cnsctvo_cdgo_imgn
		And			c.cnsctvo_cdgo_tpo_indce = 71	-- Consecutivo tipo indice 
		Where		c.vlr = @lnIndiceAtencion		-- Indice atencion 
		Order by	a.fcha_dgtlzcn Desc, b.cnsctvo_cdgo_imgn /*2015-04-24 sislbr01*/
		/*
		--ANTES
		--Order by	a.fcha_dgtlzcn Desc
		*/
	End 
	Else 
	Begin

	


		/* Consulta x radicacion */
		Select	top 2000 a.*, i.dscrpcn_tpo_imgn, b.rta_imgn, b.prncpl,	b.cnsctvo_cdgo_imgn,	'NO SELECCIONADO' as accn
		From		@tmpDocumentos a
		Inner Join	tbImagenesxDocumentosDigitalizados b	On a.cnsctvo_cdgo_dcmnto	= b.cnsctvo_cdgo_dcmnto
		Inner Join	tbTiposImagenes i						On b.cnsctvo_cdgo_tpo_imgn	= i.cnsctvo_cdgo_tpo_imgn
		Order by	a.fcha_dgtlzcn Desc, b.cnsctvo_cdgo_imgn /*2015-04-24 sislbr01*/
		/*
		--ANTES
		--Order by a.fcha_dgtlzcn Desc
		*/
	End 
End


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosCuentasMedicas] TO [visosservice_role]
    AS [dbo];

