 
/*---------------------------------------------------------------------------------    
* Metodo o PRG    :  spGDConsultarConsolidadoImagenesxTipoDocumental  
* Desarrollado por   :  <\A   Ing. Cesar García  A\>    
* Descripcion    :  <\D        D\>    
* Observaciones       :  <\O    O\>    
* Parametros    :  <\P      P\>    
* Variables     :  <\V      V\>    
* Fecha Creacion   :  <\FC 20090921        FC\>    
*      
*---------------------------------------------------------------------------------    
* DATOS DE MODIFICACION     
*---------------------------------------------------------------------------------      
QUICK				Analista		Descripcion
2011-001-022937     sismpr01		Se adicionan dos nuevos campos de consulta @ldFechaInicioCarga y @ldFechaFinCarga 20121204
*---------------------------------------------------------------------------------*/    
CREATE Procedure [dbo].[spGDConsultarConsolidadoImagenesxTipoDocumental]
--Declare
/*1*/ @lnConsecutivoTipoDocumental  Int,
/*2*/ @lnConsecutivoTipoDocumento	Int,
/*3*/ @ldFechaInicioDigitalizacion  Datetime,
/*4*/ @ldFechaFinDigitalizacion		Datetime,
/*5*/ @lcError						Varchar(2)	Output,
/*6*/ @ldFechaInicioCarga			Datetime = null,
/*7*/ @ldFechaFinCarga				Datetime = null

/*
Set		@lnConsecutivoTipoDocumental	=	2
Set		@lnConsecutivoTipoDocumento		=	1
Set		@ldFechaInicioDigitalizacion	=	'2009/01/01'
Set		@ldFechaFinDigitalizacion		=	'2009/09/21'
*/
  
As
Set NoCount On
  
Declare @lnConsecutivoAgrupadorDocumentos tinyint
Set		@lnConsecutivoAgrupadorDocumentos = 1 --Afiliacion
    
Set @lcError = '0' -- Ok
    
If	@ldFechaInicioDigitalizacion Is Null
	Set @ldFechaInicioDigitalizacion = '1995-01-01'
    
If @ldFechaFinDigitalizacion Is Null
	Set @ldFechaFinDigitalizacion = '9999-12-31'
    
If	@ldFechaInicioCarga Is Null
	Set @ldFechaInicioCarga = '1995-01-01'
    
If @ldFechaFinCarga Is Null
	Set @ldFechaFinCarga = '9999-12-31'

select @ldFechaFinCarga =  @ldFechaFinCarga  + '23:59:59:998'
  
If @lnConsecutivoTipoDocumental = 1
	Begin
		Declare @tmpDocumentosAfiliacion Table
		(  
		cnsctvo_cdgo_dcmnto		udtConsecutivo,
		dscrpcn_dgtlzdr			udtDescripcion,
		dscrpcn_tpo_dcmnto		udtDescripcion,
		fcha_dgtlzcn			Datetime,
		blsa					udtDescripcion,
		nmro_idntfccn			udtNumeroIdentificacion,
		tpo_frmlro				udtDescripcion,
		nmro_frmlro				udtNumeroFormulario,
		nmro_nvdd				udtNumeroFormulario,
		tpo_idntfccn			Char(3),
		nmro_imgns				Int,
		fcha_prcso				Datetime,
		rta_imgn				Varchar(150)
		)    
  
		Declare @tmpConsecutivosDocumentos Table(cnsctvo_cdgo_dcmnto udtConsecutivo)
      
		Insert
		Into		@tmpDocumentosAfiliacion
		Select		a. cnsctvo_cdgo_dcmnto,  b.dscrpcn_dgtlzdr,   d.dscrpcn_tpo_dcmnto,
					p.fcha_crga_prvdr,    space(30) as blsa,   space(23) as nmro_idntfccn,
					space(15) as tpo_frmlro, space(15)  as nmro_frmlro, space(15) as nmro_nvdd,
					space(2) as tpo_idntfccn, a.nmro_imgns,				p.fcha_crcn,	y.rta_imgn
		From		dbo.tbDocumentosDigitalizados				a
		Inner Join  dbo.tbDigitalizadores						b	On (a.cnsctvo_cdgo_dgtlzdr   = b.cnsctvo_cdgo_dgtlzdr)
		Inner Join  dbo.tbTiposDocumento						d	On (a.cnsctvo_cdgo_tpo_dcmntl  = d.cnsctvo_cdgo_tpo_dcmnto)
		Inner Join  dbo.tbProcesosCargaImagenes					p	On (p.cnsctvo_cdgo_prcso_crga_imgn = a.cnsctvo_prcso_crga)
		Inner Join	dbo.tbConfiguracionMigracionArchivosIndices	x	On (x.cnsctvo_cdgo_prcso_crga = p.cnsctvo_cdgo_prcso_crga_imgn)
		Inner Join  dbo.tbImagenesxDocumentosDigitalizados		y	On	y.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
		Where		p.fcha_crga_prvdr   Between @ldFechaInicioDigitalizacion	And @ldFechaFinDigitalizacion
		And			p.fcha_fn_prcso		Between	@ldFechaInicioCarga				And	@ldFechaFinCarga
		And			d.cnsctvo_agrpdr_tpo_dcmntl  =	@lnConsecutivoAgrupadorDocumentos
		And			(a.cnsctvo_cdgo_tpo_dcmntl =   @lnConsecutivoTipoDocumento  Or @lnConsecutivoTipoDocumento Is Null)
		And			x.estdo_mgrcn	=	2
		And			a.estdo_rgstro	=	'S'

		If @@Error != 0
		Set @lcError = '1'
    
  
		Update		@tmpDocumentosAfiliacion
		Set			blsa = (	Select	Max(ltrim(rtrim(vlr)))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce = 14
								And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
							)
		From		@tmpDocumentosAfiliacion a
		  
		If @@Error != 0
		Set @lcError = '1'
      
      
		Update		@tmpDocumentosAfiliacion
		Set			tpo_frmlro = (	Select	max(ltrim(rtrim(vlr)))
									From	tbIndicesxDocumentosDigitalizados b
									Where	b.cnsctvo_cdgo_tpo_indce = 11 -- Tipo Formulario
									And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
								)
		From		@tmpDocumentosAfiliacion a
		  
		If @@Error != 0
		Set @lcError = '1'
		  
		Update		@tmpDocumentosAfiliacion
		Set			nmro_frmlro =	(	Select	max(ltrim(rtrim(vlr)))
										From	tbIndicesxDocumentosDigitalizados b
										Where	b.cnsctvo_cdgo_tpo_indce = 10
										And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
									)
		From		@tmpDocumentosAfiliacion a
		  
		If @@Error != 0
		Set @lcError = '1'
      
      
		Update		@tmpDocumentosAfiliacion
		Set			nmro_nvdd =	(	Select	max(ltrim(rtrim(vlr)))
									From	tbIndicesxDocumentosDigitalizados b
									Where	b.cnsctvo_cdgo_tpo_indce = 13
									And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
								)
		From		@tmpDocumentosAfiliacion a
		  
		If @@Error != 0
		Set @lcError = '1'
		  
		  
		Update		@tmpDocumentosAfiliacion
		Set			nmro_idntfccn =	(	Select	Max(ltrim(rtrim(vlr)))
										From	tbIndicesxDocumentosDigitalizados b
										Where	b.cnsctvo_cdgo_tpo_indce = 1
										And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
									)  
		From		@tmpDocumentosAfiliacion a
		  
		If @@Error != 0
		Set @lcError = '1'
      
		Update		@tmpDocumentosAfiliacion
		Set			tpo_idntfccn = (	Select	max(ltrim(rtrim(vlr)))
										From	tbIndicesxDocumentosDigitalizados b
										Where	b.cnsctvo_cdgo_tpo_indce = 7 -- Tipo Identificación
										And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
									)
		From		@tmpDocumentosAfiliacion a
		  
		If @@Error != 0
		Set @lcError = '1'
		  
		  
		Select		*
		From		@tmpDocumentosAfiliacion
		Order by	fcha_dgtlzcn, cnsctvo_cdgo_dcmnto Desc
	End
  
  
If @lnConsecutivoTipoDocumental = 2
	Begin
		Declare @tmpDocumentosNotificacion Table
		(	cnsctvo_cdgo_dcmnto		Int,
			dscrpcn_dgtlzdr			Varchar(150),
			dscrpcn_tpo_dcmnto		Varchar(150),
			fcha_dgtlzcn			Datetime,
			blsa					Varchar(150),
			nmro_idntfccn			Varchar(20),
			nmro_ntfccn				Varchar(20),
			nmro_acta				Varchar(20),
			nmro_imgns				Int,
			sde						Char(20),
			fcha_prcso				Datetime,
			rta_imgn				Varchar(150)
		)
     
		Insert Into		@tmpDocumentosNotificacion
		Select			a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto,
						p.fcha_crga_prvdr,			space(30) as blsa,			space(23) as nmro_idntfccn,
						space(23) As nmro_ntfccn,	space(23)  as nmro_acta,	a.nmro_imgns,
						space(3) As sde,			p.fcha_crcn,				y.rta_imgn
			
		From			dbo.tbDocumentosDigitalizados				a
		Inner Join		dbo.tbDigitalizadores						b	On (a.cnsctvo_cdgo_dgtlzdr  = b.cnsctvo_cdgo_dgtlzdr)
		Inner Join		dbo.tbTiposDocumento						d	On (a.cnsctvo_cdgo_tpo_dcmntl = d.cnsctvo_cdgo_tpo_dcmnto)
		Inner Join		dbo.tbProcesosCargaImagenes					p	On (p.cnsctvo_cdgo_prcso_crga_imgn = a.cnsctvo_prcso_crga)
		Inner Join		dbo.tbConfiguracionMigracionArchivosIndices	x	On (x.cnsctvo_cdgo_prcso_crga = p.cnsctvo_cdgo_prcso_crga_imgn)
		Inner Join		 dbo.tbImagenesxDocumentosDigitalizados		y	On	y.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
		Where			p.fcha_crga_prvdr   Between		@ldFechaInicioDigitalizacion	And @ldFechaFinDigitalizacion
		And				p.fcha_fn_prcso		Between		@ldFechaInicioCarga				And	@ldFechaFinCarga
		And				(a.cnsctvo_cdgo_tpo_dcmntl  =   @lnConsecutivoTipoDocumento  Or @lnConsecutivoTipoDocumento Is Null)
		And				x.estdo_mgrcn	=	2
		And				a.estdo_rgstro	=	'S'

		If @@Error != 0
		Set @lcError = '1'
     
		Update		@tmpDocumentosNotificacion
		Set			blsa = (	Select	max(ltrim(rtrim(vlr)))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce = 14 --Número de Bolsa
								And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
							)
		From		@tmpDocumentosNotificacion a

		If @@Error != 0
		Set @lcError = '1'
    
		Update		@tmpDocumentosNotificacion
		Set			nmro_ntfccn =	(	Select max(ltrim(rtrim(vlr)))
										From tbIndicesxDocumentosDigitalizados b
										Where b.cnsctvo_cdgo_tpo_indce = 5 --Número de Notificación
										And  b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
									)
		From		@tmpDocumentosNotificacion a

		If @@Error != 0
		Set @lcError = '1'
    
		Update		@tmpDocumentosNotificacion
		Set			nmro_idntfccn =	(	Select	Max(ltrim(rtrim(vlr)))
										From	tbIndicesxDocumentosDigitalizados b
										Where	b.cnsctvo_cdgo_tpo_indce = 1 --Número Identificación
										And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
									)
		From		@tmpDocumentosNotificacion a

		If @@Error != 0
		Set @lcError = '1'
    
		Update		@tmpDocumentosNotificacion
		Set			nmro_acta  =	(	Select	Max(ltrim(rtrim(vlr)))
										From	tbIndicesxDocumentosDigitalizados b
										Where	b.cnsctvo_cdgo_tpo_indce = 8 --Sede Notificación
										And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
									)
		From		@tmpDocumentosNotificacion a

		If @@Error != 0
		Set @lcError = '1'

		Update		@tmpDocumentosNotificacion
		Set			sde  =	(	Select Max(ltrim(rtrim(vlr)))
								From	tbIndicesxDocumentosDigitalizados b
								Where	b.cnsctvo_cdgo_tpo_indce = 19 --Sede Notificación
								And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
							)
		From		@tmpDocumentosNotificacion a

		If @@Error != 0
		Set @lcError = '1'
  
		Select		*
		From		@tmpDocumentosNotificacion
		Order by	fcha_dgtlzcn, cnsctvo_cdgo_dcmnto Desc
	End
    
    
If @lnConsecutivoTipoDocumental = 3
	Begin
		Declare @tmpDocumentosAutoliquidacion Table
		( cnsctvo_cdgo_dcmnto	udtConsecutivo,
		dscrpcn_dgtlzdr			udtDescripcion,
		dscrpcn_tpo_dcmnto		udtDescripcion,
		fcha_dgtlzcn			Datetime,
		blsa					udtDescripcion,
		nmro_idntfccn			udtNumeroIdentificacion,
		nmro_plnlla				udtNumeroFormulario,
		tpo_idntfccn			char(2),
		nmro_imgns				Tinyint,
		fcha_prcso				Datetime,
		rta_imgn				Varchar(150)
		)  
  
		Insert Into		@tmpDocumentosAutoliquidacion
		Select			a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto,
						p.fcha_crga_prvdr,			space(30) as blsa,			space(23) as nmro_idntfccn,
						space(15)  as nmro_plnlla,  space(2) as tpo_idntfccn,	a.nmro_imgns,
						p.fcha_crcn,				y.rta_imgn
		From			dbo.tbDocumentosDigitalizados				a
		Inner Join		dbo.tbDigitalizadores						b	On (a.cnsctvo_cdgo_dgtlzdr  = b.cnsctvo_cdgo_dgtlzdr)
		Inner Join		dbo.tbTiposDocumento						d	On (a.cnsctvo_cdgo_tpo_dcmntl = d.cnsctvo_cdgo_tpo_dcmnto)
		Inner Join		dbo.tbProcesosCargaImagenes					p	On (p.cnsctvo_cdgo_prcso_crga_imgn = a.cnsctvo_prcso_crga)
		Inner Join		dbo.tbConfiguracionMigracionArchivosIndices	x	On (x.cnsctvo_cdgo_prcso_crga = p.cnsctvo_cdgo_prcso_crga_imgn)
		Inner Join		dbo.tbImagenesxDocumentosDigitalizados		y	On	y.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
		Where			p.fcha_crga_prvdr   Between		@ldFechaInicioDigitalizacion And @ldFechaFinDigitalizacion
		And				p.fcha_fn_prcso		Between		@ldFechaInicioCarga				And	@ldFechaFinCarga
		And				(a.cnsctvo_cdgo_tpo_dcmntl	=  @lnConsecutivoTipoDocumento  Or @lnConsecutivoTipoDocumento Is Null)
		And				x.estdo_mgrcn	=	2
		And				a.estdo_rgstro	=	'S'

		If @@Error != 0
		Set @lcError = '1'
    
		Update		@tmpDocumentosAutoliquidacion
		Set			blsa	=	(	Select	Max(ltrim(rtrim(vlr)))
									From	tbIndicesxDocumentosDigitalizados b
									Where	b.cnsctvo_cdgo_tpo_indce = 14 --Bolsa
									And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
								)
		From		@tmpDocumentosAutoliquidacion a
		 
		If @@Error != 0
		Set @lcError = '1'
     
		Update		@tmpDocumentosAutoliquidacion
		Set			nmro_plnlla	=	(	Select	Max(ltrim(rtrim(vlr)))
										From	tbIndicesxDocumentosDigitalizados b
										Where	b.cnsctvo_cdgo_tpo_indce = 12 -- Número Planilla
										And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
									)
		From		@tmpDocumentosAutoliquidacion a
		 
		If @@Error != 0
		Set @lcError = '1'
     
		Update		@tmpDocumentosAutoliquidacion
		Set			nmro_idntfccn	=	(	Select Max(ltrim(rtrim(vlr)))
											From tbIndicesxDocumentosDigitalizados b
											Where b.cnsctvo_cdgo_tpo_indce = 1 -- Númmero Identificación
											And  b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
										)
		From		@tmpDocumentosAutoliquidacion a
		 
		If @@Error != 0
		Set @lcError = '1'
     
		Update		@tmpDocumentosAutoliquidacion    
		Set			tpo_idntfccn	=	(	Select Max(ltrim(rtrim(vlr)))
											From tbIndicesxDocumentosDigitalizados b
											Where b.cnsctvo_cdgo_tpo_indce = 7 -- Tipo Identificación
											 And  b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
										)
		From		@tmpDocumentosAutoliquidacion a
		 
		If @@Error != 0
		Set @lcError = '1'
     
		Select		*
		From		@tmpDocumentosAutoliquidacion
		Order by	fcha_dgtlzcn, cnsctvo_cdgo_dcmnto Desc
	End
  
If @lnConsecutivoTipoDocumental = 4
	Begin
		Declare @tmpDocumentosCuentasMedicas Table
		(	cnsctvo_cdgo_dcmnto		udtConsecutivo,
			dscrpcn_dgtlzdr			udtDescripcion,
			dscrpcn_tpo_dcmnto		udtDescripcion,
			fcha_dgtlzcn			Datetime,
			blsa					udtDescripcion,
			nmro_idntfccn			udtNumeroIdentificacion,
			nmro_fctra				udtNumeroFormulario,
			nmro_rdccn				udtNumeroFormulario,
			nmro_rcbro				udtNumeroFormulario,
			tpo_idntfccn			Char(2),
			nmro_imgns				Int,
			fcha_prcso				Datetime,
			rta_imgn				Varchar(150)
		)
  
		Insert Into		@tmpDocumentosCuentasMedicas
		Select			a. cnsctvo_cdgo_dcmnto,		b.dscrpcn_dgtlzdr,			d.dscrpcn_tpo_dcmnto,
						p.fcha_crga_prvdr,			space(30) as blsa,			space(23) as nmro_idntfccn,
						space(23) as nmro_fctra,	space(15) as nmro_rdccn,	space(23) as nmro_rcbro,
						space(2) as tpo_idntfccn,	a.nmro_imgns,				p.fcha_crcn,
						y.rta_imgn
		From			dbo.tbDocumentosDigitalizados				a
		Inner Join		dbo.tbDigitalizadores						b	On (a.cnsctvo_cdgo_dgtlzdr  = b.cnsctvo_cdgo_dgtlzdr)
		Inner Join		dbo.tbTiposDocumento						d	On (a.cnsctvo_cdgo_tpo_dcmntl = d.cnsctvo_cdgo_tpo_dcmnto)
		Inner Join		dbo.tbProcesosCargaImagenes					p	On (p.cnsctvo_cdgo_prcso_crga_imgn = a.cnsctvo_prcso_crga)
		Inner Join		dbo.tbConfiguracionMigracionArchivosIndices	x	On (x.cnsctvo_cdgo_prcso_crga = p.cnsctvo_cdgo_prcso_crga_imgn)
		Inner Join		dbo.tbImagenesxDocumentosDigitalizados		y	On	y.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
		Where			p.fcha_crga_prvdr   Between		@ldFechaInicioDigitalizacion	And @ldFechaFinDigitalizacion
		And				p.fcha_fn_prcso		Between		@ldFechaInicioCarga				And	@ldFechaFinCarga
		And				(a.cnsctvo_cdgo_tpo_dcmntl =  @lnConsecutivoTipoDocumento  Or @lnConsecutivoTipoDocumento Is Null)
		And				x.estdo_mgrcn	=	2
		And				a.estdo_rgstro	=	'S'

		If @@Error != 0
		Set @lcError = '1'
    
  
		Update		@tmpDocumentosCuentasMedicas
		Set			blsa	=	(	Select	Max(ltrim(rtrim(vlr)))
									From	tbIndicesxDocumentosDigitalizados b
									Where	b.cnsctvo_cdgo_tpo_indce = 14
									And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
								)
		From		@tmpDocumentosCuentasMedicas a
		 
		If @@Error != 0
		Set @lcError = '1'
     
		Update		@tmpDocumentosCuentasMedicas
		Set			nmro_fctra	=	(	Select	Max(ltrim(rtrim(vlr)))
										From	tbIndicesxDocumentosDigitalizados b
										Where	b.cnsctvo_cdgo_tpo_indce = 3
										And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
									)
		From		@tmpDocumentosCuentasMedicas a
		 
		If @@Error != 0
		Set @lcError = '1'
     
		Update		@tmpDocumentosCuentasMedicas
		Set			nmro_rdccn	=	(	Select	Max(ltrim(rtrim(vlr)))
										From	tbIndicesxDocumentosDigitalizados b
										Where	b.cnsctvo_cdgo_tpo_indce = 2
										And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
									)
		From		@tmpDocumentosCuentasMedicas a
		 
		If @@Error != 0
		Set @lcError = '1'
     
		Update		@tmpDocumentosCuentasMedicas
		Set			nmro_rcbro	=	(	Select	Max(ltrim(rtrim(vlr)))
										From	tbIndicesxDocumentosDigitalizados b
										Where	b.cnsctvo_cdgo_tpo_indce = 9
										And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
									)
		From		@tmpDocumentosCuentasMedicas a
		 
		If @@Error != 0
		Set @lcError = '1'
     
		Update		@tmpDocumentosCuentasMedicas
		Set			nmro_idntfccn	=	(	Select	Max(ltrim(rtrim(vlr)))
											From	tbIndicesxDocumentosDigitalizados b
											Where	b.cnsctvo_cdgo_tpo_indce = 1
											And		b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
										)
		From		@tmpDocumentosCuentasMedicas a
		 
		If @@Error != 0
		Set @lcError = '1'
     
		Update		@tmpDocumentosCuentasMedicas
		Set			tpo_idntfccn	=	(	Select	Max(ltrim(rtrim(vlr)))
											From	tbIndicesxDocumentosDigitalizados b
											Where	b.cnsctvo_cdgo_tpo_indce = 7 -- Tipo Identificación
											 And	b.cnsctvo_cdgo_dcmnto  = a.cnsctvo_cdgo_dcmnto
										)
		From		@tmpDocumentosCuentasMedicas a
		 
		If @@Error != 0
		Set @lcError = '1'
     
		Select		*
		From		@tmpDocumentosCuentasMedicas
		Order by	fcha_dgtlzcn, cnsctvo_cdgo_dcmnto Desc
	End
  
  





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarConsolidadoImagenesxTipoDocumental] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarConsolidadoImagenesxTipoDocumental] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarConsolidadoImagenesxTipoDocumental] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarConsolidadoImagenesxTipoDocumental] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarConsolidadoImagenesxTipoDocumental] TO [visosservice_role]
    AS [dbo];

