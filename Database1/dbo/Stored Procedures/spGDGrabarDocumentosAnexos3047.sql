

/*---------------------------------------------------------------------------------------------------------------------------                               
* Procedimiento    :  dbo.spGDGrabarDocumentosAnexos3047                             
* Desarrollado por : <\A Ing. Victor Hugo Gil Ramos   A\>                               
* Descripción      : <\D 
                        Este procedimiento permite registrar los documentos (Anexos) que se envian 
                        a traves de la resolucion 3047 y el proceso NoPos
                     D\>                               
* Observaciones    : <\O      O\>                               
* Parámetros       : <\P 
                       @cnsctvo_cdgo_tpo_clnte	  udtConsecutivo,	-- Tipo de cliente
					   @nmro_idntfccn			  Varchar(12),		-- Número de identificación
					   @asnto					  Varchar(150),		-- Solicitud del cliente
					   @fcha_ingrso_cntcto		  Varchar(30),		-- Fecha ingreso contacto,
					   @cnta_eml				  Varchar(150),		-- Cuenta de email que recibe solicitud
					   @rmtnte_eml				  Varchar(150),		-- Cuentade email a quien se responde
					   @pthnme_nts				  Varchar(150),
					   @usro_rspnsble_cntcto	  udtUsuario,		-- Usuario responsable del contacto
					   @cdgo_intrno				  Char(8),			-- Codigo interno IPS que envia el proceso
					   @cnsctvo_cdgo_tpo_idntfccn udtConsecutivo,    
					   @cnsctvo_cdgo_tpo_prcso	  Int	= 1			-- Tipo de Proceso
                     P\>                                                             
* Fecha Creación : <\FC 2011/03/03 FC\>                               
*----------------------------------------------------------------------------------------------------------------------------*/
--EXEC SpGDGrabarDocumentosAnexos3047 '2011-029-160524','DIAGRAMA FLUJO RES 3047 - SOS.pdf','3/10/2011 4:10:23 PM','DOCENT3047','100419','Mar 10 2011  3:46PM', 2
--EXEC SpGDGrabarDocumentosAnexos3047 '2011-029-160631','ctc_prueba20.pdf','3/16/2011 4:59:51 PM','DOCENTNoPos','100419','Mar 16 2011  4:54PM', 2
--EXEC SpGDGrabarDocumentosAnexos3047 '2011-029-160634','ctc_prueba21.pdf','3/16/2011 5:15:53 PM','DOCENTNoPos','100419','Mar 16 2011  5:15PM', 2
CREATE Procedure [dbo].[spGDGrabarDocumentosAnexos3047]
--Declare
@cdgo_cntcto			Varchar(16),
@nmbre_dcmnto			Varchar(150),
@fcha_rdccn_dcmnto		Varchar(30),
@nmro_rdccn_dcmnto		Varchar(20),
@nmro_unco_idntfccn		Int,
@fcha_ingrso_cntcto		Varchar(20),
@cnsctvo_cdgo_tpo_prcso	Int	= 1

As
Set NoCount On

Declare		@cnsctvo_dcmnto				Int,
			@cnsctvo_cdgo_tpo_dcmntl	Int,
			@cnsctvo_cdgo_dgtlzdr		Int,
			@orgn_dcmnto				Varchar(20),
			@cnsctvo_cdgo_tpo_imgn		Int,
			@prncpl						Char(1),
			@nmro_imgns					Int,
			@fcha_crcn					Datetime,
			@rta_gnrl_dcmnto			Varchar(150),
			@rta_dcmnto					Varchar(250),
			@fcha_crpta					Varchar(11),
			@rta_fnl_archvo				Varchar(250),
			@cnsctvo_cdgo_dcmnto		Int,
			@cnsctvo_opcn_ejccn			Int
			
Set			@cnsctvo_dcmnto			 = 0
Set			@cnsctvo_cdgo_dgtlzdr	 = 5
Set			@cnsctvo_cdgo_tpo_dcmntl = 8
Set			@prncpl					 = 'S'
Set			@nmro_imgns				 = 1
Set			@fcha_crcn				 = GetDate()
Set			@orgn_dcmnto			 = 'ENTRANTE'
Set			@fcha_crpta				 = Convert(VarChar(4),Datepart(Year, GetDate())) + '\' + Replicate('0', 2-Len(Convert(VarChar(2), Datepart(Month,GetDate())))) + Convert(VarChar(2), Datepart(Month, GetDate()))+ '\' +Replicate('0',2-Len(Convert(VarChar(2),Datepart(Day,GetDate())))) + Convert(VarChar(2),Datepart(Day,GetDate())) + '\'
Set			@rta_gnrl_dcmnto		 = (Select Ltrim(Rtrim(a.vlr_prmtro_crctr))
										From   tbParametrosGenerales_Vigencias a
										Inner  Join tbParametrosGeneralesxProceso_vigente b
										On     a.cnsctvo_cdgo_prmtro_gnrl = b.cnsctvo_cdgo_prmtro_gnrl
										And    b.cnsctvo_cdgo_tpo_prcso = @cnsctvo_cdgo_tpo_prcso
                                        And    CONVERT(VARCHAR(10),GETDATE(),111) between convert(VARCHAR(10),a.inco_vgnca,111) and convert(VARCHAR(10), a.fn_vgnca, 111)
										)
Set			@cnsctvo_cdgo_tpo_imgn	 = (Select     b.cdgo_tpo_imgn 
										From       tbTiposParametrosImagenesxProceso_vigente a
										Inner Join tbtiposImagenes b
										On         a.cnsctvo_cdgo_tpo_imgn = b. cnsctvo_cdgo_tpo_imgn
										Where      a.cnsctvo_cdgo_tpo_prcso = @cnsctvo_cdgo_tpo_prcso
										And        CONVERT(VARCHAR(10),GETDATE(),111) between convert(VARCHAR(10),a.inco_vgnca,111) and convert(VARCHAR(10), a.fn_vgnca, 111)
                                        )
Set			@rta_dcmnto				 = Ltrim(Rtrim(replace(@rta_gnrl_dcmnto,'\\atlas','') + @fcha_crpta + @nmbre_dcmnto))
Set			@rta_fnl_archvo			 = @rta_gnrl_dcmnto + @fcha_crpta + @nmbre_dcmnto
Set			@cnsctvo_opcn_ejccn		 =	1

If Not Exists(Select 1
			  From	 bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	a
					 Inner Join	(Select	b.cnsctvo_cdgo_dcmnto
								 From	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	b
								 Where	b.cnsctvo_cdgo_tpo_dcmntl =	@cnsctvo_cdgo_tpo_dcmntl
								 And	b.cnsctvo_cdgo_tpo_indce  =	24
								 And	b.vlr					  =	@cdgo_cntcto
								)As c On c.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto
					Inner Join	(Select	d.cnsctvo_cdgo_dcmnto
								 From	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	d
								 Where	d.cnsctvo_cdgo_tpo_dcmntl =	@cnsctvo_cdgo_tpo_dcmntl
								 And	d.cnsctvo_cdgo_tpo_indce  =	26
								 And	d.vlr					  =	@fcha_ingrso_cntcto
								)As e On e.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto	
					Where		a.cnsctvo_cdgo_tpo_dcmntl	   = @cnsctvo_cdgo_tpo_dcmntl
					And			a.cnsctvo_cdgo_tpo_indce	   = 25
					And			a.vlr						   = @nmro_unco_idntfccn
				)
	Begin
	  Begin Transaction
		Declare	@cnsctvo_cdgo_imgn	Int
		
		/*		  
		Select  @cnsctvo_dcmnto = Max(cnsctvo_cdgo_dcmnto) + 1
		From	bdGestionDocumental.dbo.tbDocumentosDigitalizados

		Select  @cnsctvo_cdgo_imgn = Max(cnsctvo_cdgo_imgn) + 1
		From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
		*/

		-- Ajuste siscgm01 2012-07-18
		exec spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn Output,	@cnsctvo_opcn_ejccn
		-- Ajuste siscgm01 2012-07-18

		Insert 
        Into	bdGestionDocumental.dbo.tbDocumentosDigitalizados
				(cnsctvo_cdgo_dcmnto , cnsctvo_cdgo_tpo_dcmntl, nmro_imgns,     
                 cnsctvo_cdgo_dgtlzdr, fcha_dgtlzcn
				)
        Values	(@cnsctvo_dcmnto      ,	@cnsctvo_cdgo_tpo_dcmntl, @nmro_imgns,    
                 @cnsctvo_cdgo_dgtlzdr, @fcha_crcn
				)		  
		Insert 
        Into	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
                (cnsctvo_cdgo_imgn,	cnsctvo_cdgo_dcmnto, cnsctvo_cdgo_tpo_imgn,		
                 rta_imgn         , prncpl
				)
		Values  (@cnsctvo_cdgo_imgn, @cnsctvo_dcmnto, @cnsctvo_cdgo_tpo_imgn,		
                 @rta_dcmnto       , @prncpl
				)
		  
		 -- Insertar índices x documentos digitalizadas
		Insert 
        Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
				(cnsctvo_cdgo_dcmnto   , cnsctvo_cdgo_tpo_dcmntl,	
                 cnsctvo_cdgo_tpo_indce, vlr	
                )
		Values	(@cnsctvo_dcmnto, @cnsctvo_cdgo_tpo_dcmntl,	
                 22             , @nmbre_dcmnto
			    )
		Insert 
        Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
				(cnsctvo_cdgo_dcmnto   , cnsctvo_cdgo_tpo_dcmntl,	
                 cnsctvo_cdgo_tpo_indce, vlr
              	)
		Values	(@cnsctvo_dcmnto, @cnsctvo_cdgo_tpo_dcmntl,	
                 23             , @fcha_rdccn_dcmnto
				)
		Insert 
        Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
				(cnsctvo_cdgo_dcmnto   , cnsctvo_cdgo_tpo_dcmntl,	
                 cnsctvo_cdgo_tpo_indce, vlr	
                )
		Values  (@cnsctvo_dcmnto, @cnsctvo_cdgo_tpo_dcmntl,	
                 24             , @cdgo_cntcto
				)
		Insert 
        Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
				(cnsctvo_cdgo_dcmnto   , cnsctvo_cdgo_tpo_dcmntl,	
                 cnsctvo_cdgo_tpo_indce, vlr
                )
		Values	(@cnsctvo_dcmnto,@cnsctvo_cdgo_tpo_dcmntl,	
                 25             , @nmro_unco_idntfccn
				)		  
		Insert 
        Into	bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
			    (cnsctvo_cdgo_dcmnto   , cnsctvo_cdgo_tpo_dcmntl,	
                 cnsctvo_cdgo_tpo_indce, vlr
                )
		Values	(@cnsctvo_dcmnto, @cnsctvo_cdgo_tpo_dcmntl,	
                 26             , @fcha_ingrso_cntcto
				)	
		Insert	
        Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
				(cnsctvo_cdgo_dcmnto   , cnsctvo_cdgo_tpo_dcmntl,	
                 cnsctvo_cdgo_tpo_indce, vlr
                 )
		Values	(@cnsctvo_dcmnto, @cnsctvo_cdgo_tpo_dcmntl,	
                 29             , @nmro_rdccn_dcmnto
				)
		Insert	
        Into bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados
				(cnsctvo_cdgo_dcmnto   , cnsctvo_cdgo_tpo_dcmntl,	
                 cnsctvo_cdgo_tpo_indce, vlr
                )
		Values	(@cnsctvo_dcmnto, @cnsctvo_cdgo_tpo_dcmntl,	
                 30             , @orgn_dcmnto
			    )
		 
		If @@error != 0
		  Begin
			Set @cnsctvo_cdgo_dcmnto = 0
			Rollback Transaction
		  End
		Else
		 Begin
		  Set @cnsctvo_cdgo_dcmnto = @cnsctvo_dcmnto
		  Commit Transaction
		 End
	End
Else
  Begin
	Begin Transaction
	  Declare @cnsctvo_cdgo_imgn_2	Int

		/*
	  Select @cnsctvo_cdgo_imgn_2 =	Max(cnsctvo_cdgo_imgn)+1
	  From	bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
		*/

		-- Ajuste Cesar García 2011-10-05
		Set	@cnsctvo_opcn_ejccn = 2
		exec spGDCalcularConsecutivo @cnsctvo_dcmnto Output, @cnsctvo_cdgo_imgn_2 Output,	@cnsctvo_opcn_ejccn	
		
		Set  @prncpl = 'N'

	  Select @cnsctvo_dcmnto = a.cnsctvo_cdgo_dcmnto
	  From	 bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	a
	  Inner Join (Select  b.cnsctvo_cdgo_dcmnto
				  From	  bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	b
				  Where	  b.cnsctvo_cdgo_tpo_dcmntl	= @cnsctvo_cdgo_tpo_dcmntl
				  And	  b.cnsctvo_cdgo_tpo_indce	= 24
				  And	  b.vlr						= @cdgo_cntcto
				  )As c	On c.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto
	  Inner Join (Select  d.cnsctvo_cdgo_dcmnto
				  From	  bdGestionDocumental.dbo.tbIndicesxDocumentosDigitalizados	d
				  Where	  d.cnsctvo_cdgo_tpo_dcmntl	= @cnsctvo_cdgo_tpo_dcmntl
				  And	  d.cnsctvo_cdgo_tpo_indce	= 26
				  And	  d.vlr						= @fcha_ingrso_cntcto
				  )	As e On	e.cnsctvo_cdgo_dcmnto = a.cnsctvo_cdgo_dcmnto	
		Where	  a.cnsctvo_cdgo_tpo_dcmntl	= @cnsctvo_cdgo_tpo_dcmntl
		And		  a.cnsctvo_cdgo_tpo_indce	= 25
		And		  a.vlr						= @nmro_unco_idntfccn

		Insert 
        Into   bdGestionDocumental.dbo.tbImagenesxDocumentosDigitalizados
			   (cnsctvo_cdgo_imgn, cnsctvo_cdgo_dcmnto,	cnsctvo_cdgo_tpo_imgn,
                rta_imgn         , prncpl
			   )
		Values (@cnsctvo_cdgo_imgn_2, @cnsctvo_dcmnto, @cnsctvo_cdgo_tpo_imgn,
                @rta_dcmnto         , @prncpl
			   )

		If @@error != 0
		  Begin
			Set @cnsctvo_cdgo_dcmnto = 0
			Rollback Transaction
		  End
		Else
		  Begin
			Set @cnsctvo_cdgo_dcmnto = @cnsctvo_dcmnto
			Commit Transaction
		  End
  End
  
  Select @cnsctvo_cdgo_dcmnto As cnsctvo_cdgo_dcmnto,	@rta_fnl_archvo As rta_fnl_archvo


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexos3047] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexos3047] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGrabarDocumentosAnexos3047] TO [visosservice_role]
    AS [dbo];

