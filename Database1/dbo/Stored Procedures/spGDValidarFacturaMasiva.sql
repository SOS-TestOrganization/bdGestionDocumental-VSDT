

CREATE Procedure [dbo].[spGDValidarFacturaMasiva]
@nmro_rdccn				Varchar(15),
@nmro_rcbro				Varchar(15),
@estdo_vldcn			Int	Output

As
Set NoCount On

Declare			@cnsctvo_rdccn_rcbro		Int

Select			@cnsctvo_rdccn_rcbro	=	cnsctvo_rdccn_rcbro
From			bdSiSalud.dbo.tbcrRadicacionEventoRecobrable
Where			nmro_rdccn				=	@nmro_rdccn
And				cnsctvo_rdccn_rcbro		=	@nmro_rcbro

If	@cnsctvo_rdccn_rcbro Is Null	Or	@cnsctvo_rdccn_rcbro = ''
	Begin
		Set		@estdo_vldcn	=	1
	End
Else
	Begin
		Set		@estdo_vldcn	=	0
	End




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFacturaMasiva] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFacturaMasiva] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFacturaMasiva] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFacturaMasiva] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFacturaMasiva] TO [Consultor Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFacturaMasiva] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDValidarFacturaMasiva] TO [visosservice_role]
    AS [dbo];

