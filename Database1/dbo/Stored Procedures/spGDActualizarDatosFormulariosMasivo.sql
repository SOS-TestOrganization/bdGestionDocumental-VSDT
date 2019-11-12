

CREATE Procedure	[dbo].[spGDActualizarDatosFormulariosMasivo]
@estdo	Int		Output

As
Set Nocount On

/*
Create Table	#tmpDatosValidacion
(	dgtlzdr				Char(4),
	tpo_dcmnto			Char(20),
	tpo_frmlro_lg 		Char(50),
	nmro_frmlro_lg		Char(50),
	nmro_blsa_nvo_lg	Char(20),
	nmro_blsa_antrr_lg	Char(20),
	cnsctvo_dcmnto		Int
)

Insert Into		#tmpDatosValidacion
Values			('SIO',	'FORMULARIOS',	'FIRC001',	'3351777',	'16696',	'16697',	60053423)

Insert Into		#tmpDatosValidacion
Values			('SIO',	'FORMULARIOS',	'FIRC005',	'335292',	'18',		'19',		60053424)

Insert Into		#tmpDatosValidacion
Values			('SIO',	'FORMULARIOS',	'FIRC001',	'3359229',	'16719',	'16720',	60053425)
*/

Begin Transaction
	Update			tbIndicesxDocumentosDigitalizados
	Set				vlr		=	a.nmro_blsa_nvo_lg
	From			#tmpDatosActualizacion				a
	Inner	Join	tbIndicesxDocumentosDigitalizados	b	On	b.cnsctvo_cdgo_dcmnto	=	a.cnsctvo_dcmnto
	Where			b.cnsctvo_cdgo_tpo_indce		=	14
	And				b.vlr							!=	a.nmro_blsa_nvo_lg

	If @@error != 0
		Begin
			Set @estdo = 1
			Rollback Transaction
		End
	Else
		Begin
			Set @estdo = 0
			Commit Transaction
		End

--Drop Table #tmpDatosValidacion

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarDatosFormulariosMasivo] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarDatosFormulariosMasivo] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarDatosFormulariosMasivo] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDActualizarDatosFormulariosMasivo] TO [visosservice_role]
    AS [dbo];

