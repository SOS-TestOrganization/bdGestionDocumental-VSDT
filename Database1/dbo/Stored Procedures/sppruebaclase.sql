
CREATE procedure [dbo].[sppruebaclase]
As
Set Nocount On

Select		'NO SELECCIONADO' As accn,				rta_imgn,			'PRUEBAS_DOCUMENTO' As tpo_dcmnto,
			'2009/07/24' As fcha_dgtlzcn
From		tbImagenesxDocumentosDigitalizados
Where		cnsctvo_cdgo_imgn	In (57795114)--(5000094,5000098,17688288)



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sppruebaclase] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sppruebaclase] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sppruebaclase] TO [websos]
    AS [dbo];

