
/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDConsultaDocumentosAfiliacion
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
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[spGDConsultaDocumentosTutelas]
@lcNumeroFallo			Varchar(15),
@lcNumeroIdentificacion   Varchar(15)

As
Set NoCount On

/*
Declare		@lcNumeroFallo				Varchar(15),
			@lcNumeroIdentificacion		Varchar(15)

Set			@lcNumeroFallo				=	'531133'
Set			@lcNumeroIdentificacion		=	'31163511'
*/


Declare @tmpDocumentos Table(
		cnsctvo_cdgo_dcmnto		udtConsecutivo
		)

Declare @tmpImagenesDocumentos Table(
		cnsctvo_cdgo_dcmnto		udtConsecutivo,
		rta_imgn				Varchar(150)
		)


Insert Into	@tmpDocumentos
Select		c.cnsctvo_cdgo_dcmnto
From		tbindicesxdocumentosdigitalizados	a
Inner Join	(	Select		b.cnsctvo_cdgo_dcmnto
				From		tbindicesxdocumentosdigitalizados	b
				Where		b.cnsctvo_cdgo_tpo_indce		=	5
				And			b.vlr							=	@lcNumeroFallo
				And			b.cnsctvo_cdgo_tpo_dcmntl		=	3
			)	As	c	On	c.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto
Where		a.cnsctvo_cdgo_tpo_indce		=	1
And			a.vlr							=	@lcNumeroIdentificacion
And			a.cnsctvo_cdgo_tpo_dcmntl		=	3


Insert Into	@tmpImagenesDocumentos
Select		b.cnsctvo_cdgo_dcmnto,		b.rta_imgn
From		@tmpDocumentos							a
Inner Join	tbImagenesxDocumentosdigitalizados		b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_cdgo_dcmnto

Select		*
From		@tmpImagenesDocumentos
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosTutelas] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosTutelas] TO [Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosTutelas] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultaDocumentosTutelas] TO [310018 Auditor Salud Central]
    AS [dbo];

