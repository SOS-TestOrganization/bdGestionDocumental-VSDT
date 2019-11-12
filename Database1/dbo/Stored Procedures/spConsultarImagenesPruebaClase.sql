


CREATE Procedure [dbo].[spConsultarImagenesPruebaClase]
As
Set Nocount On

Select	/*'NO SELECCIONADO' As accn,*/	nmbre_imgn,	cnsctvo_imgn,	rta_fnl_imgn+Convert(Varchar(3),cnsctvo_imgn)+Ltrim(Rtrim(extnsn_imgn)) As rta_imgn
From	tbimagenesindexadas
Where	crtla = 'N' and Not(Not(crtla = 'N'))



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spConsultarImagenesPruebaClase] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spConsultarImagenesPruebaClase] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spConsultarImagenesPruebaClase] TO [visosservice_role]
    AS [dbo];

