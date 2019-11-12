/*---------------------------------------------------------------------------------
* Metodo o PRG 	         :  spGDGrabarAsociacionMultiTiffxDocumento
* Desarrollado por		 :  <\A		Ing. Cesar García				A\>
* Descripcion			 :  <\D										D\>
* Parametros			 :  <\P		@cnsctvo_prcso_crga Int			P\>
* Variables				 :  <\V										V\>
* Fecha Creacion		 :  <\FC	2011/03/29						FC\>
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		 : <\AM   AM\>
* Descripcion			 : <\DM   DM\>
* Nuevos Parametros	 	 : <\PM   PM\>
* Nuevas Variables		 : <\VM   VM\>
* Fecha Modificacion	 : <\FM   FM\>
*---------------------------------------------------------------------------------*/
Create Procedure spGDGrabarAsociacionMultiTiffxDocumento
@cnsctvo_prcso_crga		Int,
@estdo					Int Output

As
Set NoCount On

Create Table	#tmp1
(
cnsctvo_cdgo_dcmnto		Int,
rta_imgn				Varchar(250)
)

Insert Into			#tmp1
Select Distinct		a.cnsctvo_cdgo_dcmnto,	a.rta_imgn
From				tbimagenesxdocumentosdigitalizados	a
Inner Join			tbdocumentosdigitalizados			b	On	b.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto
Where				b.cnsctvo_prcso_crga = @cnsctvo_prcso_crga
And					CharIndex('_',Reverse(Left(Reverse(rta_imgn),CharIndex('\',Reverse(rta_imgn)) -1)),1) > 0

Update				#tmp1
Set					rta_imgn	=	Replace(rta_imgn,Reverse(Left(Reverse(rta_imgn),Charindex('\',Reverse(rta_imgn)) -1)), Substring(Reverse(Left(Reverse(rta_imgn), Charindex('\', Reverse(rta_imgn)) -1)) , 1 , CharIndex ('_',Reverse(Left(Reverse(rta_imgn), CharIndex('\', Reverse(rta_imgn)) -1)),1)-1)+'.tif')

Begin Tran
	Insert Into			tbMultiImagenesxDocumentosDigitalizados
	Select Distinct		cnsctvo_cdgo_dcmnto,	rta_imgn
	From				#tmp1

	If	@@error != 0
		Begin
			Set	@estdo	=	1
			Rollback Tran
		End
	Else
		Begin
			Set	@estdo	=	0
			Commit Tran
		End


Drop Table #tmp1


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionMultiTiffxDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionMultiTiffxDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarAsociacionMultiTiffxDocumento] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

