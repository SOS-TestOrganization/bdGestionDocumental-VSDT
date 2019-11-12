

/*---------------------------------------------------------------------------------
* Metodo o PRG 			: spASConsultarListaTiposIndices
* Desarrollado por		: <\A Carlos Vela - Qvision										A\>
* Descripcion			: <\D Consulta los valores de tipos de indices dependiendo de un parametro D\>
*						: <\D  															D\>
* Observaciones			: <\O  															O\>
* Parametros			: <\P														 	P\>
* Variables				: <\V  															V\>
* Fecha Creacion		: <\FC 2019/11/08											   FC\>
*
*---------------------------------------------------------------------------------
*/

CREATE PROCEDURE [dbo].[spASConsultarListaTiposIndices]
--Declare 	
	@agrupadorTipoIndice	int 
AS
BEGIN
Set NoCount On
	Declare		@licnsctvo_cdgo_tpo_indce_tpo_mrca  udtConsecutivo,
			    @licnsctvo_cdgo_tpo_indce_dgnstco udtConsecutivo,
				@liUno	smallint,
				@lvJSON as NVARCHAR(MAX)
	
	Declare @tmpListaTiposIndices Table
	(
			cnsctvo_cdgo_tpo_indce udtConsecutivo
	)

	Set	@licnsctvo_cdgo_tpo_indce_tpo_mrca=90 
	Set	@licnsctvo_cdgo_tpo_indce_dgnstco =91
	Set @liUno=1
	Set @lvJSON=''

	If @agrupadorTipoIndice=@liUno 
		Begin
			Insert into @tmpListaTiposIndices values (@licnsctvo_cdgo_tpo_indce_tpo_mrca);
			Insert into @tmpListaTiposIndices values (@licnsctvo_cdgo_tpo_indce_dgnstco);  

		End;
	
	SET @lvJSON = (
			Select 
				a.cnsctvo_cdgo_tpo_indce as id, 
				a.dscrpcn_tpo_indce as descripcion
			 From dbo.tbTiposIndices a With(NoLock)
				Inner Join @tmpListaTiposIndices b
				On a.cnsctvo_cdgo_tpo_indce=b.cnsctvo_cdgo_tpo_indce 
		FOR JSON AUTO);
	
	SELECT @lvJSON as json

END

