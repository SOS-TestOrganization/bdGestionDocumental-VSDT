CREATE Procedure [dbo].[spCARecuperarCamposArchivoIndice]
@rta_tpo_dcmnto				Varchar(100),
@cnsctvo_cdgo_tpo_dcmnto	UdtConsecutivo Output
  
As
Set Nocount On
  
/*  
Declare  
@rta_tpo_dcmnto    Varchar(100),  
@cnsctvo_cdgo_tpo_dcmnto UdtConsecutivo,  
@crpta_tpo_dcmnto   Varchar(100)  
  
Set @rta_tpo_dcmnto    = 'FORMULARIOS AFILIACION'  
Set @cnsctvo_cdgo_tpo_dcmnto = 0  
Set @crpta_tpo_dcmnto   = '\'+@rta_tpo_dcmnto+'\'  
*/  
  
Declare @tbCamposIndice As Table
(
cnsctvo_cdgo_tpo_indce  Int,
nmbre					Varchar(50),
ordn_indce				Int,
tpo_dto					Char(1),
tmno					Int,
pscn					Int
)
  
Declare		@crpta_tpo_dcmnto	Varchar(100)
Set			@crpta_tpo_dcmnto  = @rta_tpo_dcmnto
  
Select		@cnsctvo_cdgo_tpo_dcmnto = cnsctvo_cdgo_tpo_dcmnto
From		bdGestionDocumental.dbo.tbTiposDocumento_Vigencias
Where		Upper(rta_tpo_dcmnto)  = Upper(@crpta_tpo_dcmnto)
  
Insert Into @tbCamposIndice
Select		cnsctvo_cdgo_tpo_indce,		nmbre,		ordn_indce,		'',		Null,
			pscn
From		bdGestionDocumental.dbo.tbTiposIndicesxTiposDocumentos
Where		cnsctvo_cdgo_tpo_dcmnto = @cnsctvo_cdgo_tpo_dcmnto
Order By	ordn_indce
  
Update		@tbCamposIndice
Set			tpo_dto  =  a.tpo_dato,		tmno  =  a.tmno
From		bdGestionDocumental.dbo.tbTiposIndices  a
Inner Join	@tbCamposIndice		b On b.cnsctvo_cdgo_tpo_indce = a.cnsctvo_cdgo_tpo_indce
  
Select		*
From		@tbCamposIndice
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarCamposArchivoIndice] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarCamposArchivoIndice] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spCARecuperarCamposArchivoIndice] TO [visosservice_role]
    AS [dbo];

