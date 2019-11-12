





/*-----------------------------------------------------------------------------------
* Metodo o PRG 	        :  spGDConsultarCiudades
* Desarrollado por		:  <\A    Julian Andres Mina Caicedo										A\>
* Descripcion			:  <\D   Trae un cursor con los registros de ciudades los cuales corresponden a los parametros ingresados.	D\>
						   <\D   Este sp es una copia del procedimiento spTraesCiudades que utiliza el aplicativo Genesis			D\>
* Observaciones		    :  <\O																		O\>
* Parametros			:  <\P    Fecha a la cual se valida la vigencia de la sede					P\>
                        :  <\P    Caracteres ingresados por el usuario para realizar la busqueda	P\>
                        :  <\P    Codigo de la ciudad a traer										P\>
* Variables				:  <\V																		V\>
* Fecha Creacion		:  <\FC  2002/06/20															FC\>
*  
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------  
* Modificado Por		: <\AM Ing. Carlos Andrés López Ramírez AM\>
* Descripcion			: <\DM Por cambios en las estructuras de las tablas, se ajusta el sp DM\>
* Nuevos Parametros	 	: <\PM   PM\>
* Nuevas Variables		: <\VM   VM\>
* Fecha Modificacion	: <\FM 2003/03/19 FM\>
*---------------------------------------------------------------------------------*/

--exec spGDConsultarCiudades  null,null,'---',null
CREATE PROCEDURE [dbo].[spGDConsultarCiudades]

@lcCodigoCiudad		udtCiudad	= NULL,
@ldFechaReferencia		datetime	= NULL,
@lcCadenaSeleccion		udtDescripcion	= NULL,
@lcTraerTodosVisibleUsuario	udtLogico	= 'N'

AS

Set Nocount On

If 	@ldFechaReferencia Is Null
	Set @ldFechaReferencia = GetDate()

If @lcCodigoCiudad IS NULL
Begin
	If @lcCadenaSeleccion = '+' or @lcCadenaSeleccion IS NULL
		--Selecciona todos los registros de  la tabla  tbciudades donde [el campo borrado sea 'N' y este] dentro de un rango vigente.
		Select	cdgo_cdd,(dscrpcn_cdd) dscrpcn_cdd,(b.dscrpcn_dprtmnto) dscrpcn_dprtmnto,(cnsctvo_cdgo_cdd) cnsctvo_cdgo_cdd,
			(a.cnsctvo_cdgo_zna)  cnsctvo_cdgo_zna ,(pse_brrs) pse_brrs,
			(a.cnsctvo_cdgo_clsfccn_ggrfca) cnsctvo_cdgo_clsfccn_ggrfca,
			(c.dscrpcn_tpo_clsfccn_ggrfca) dscrpcn_tpo_clsfccn_ggrfca, (d.dscrpcn_zna) dscrpcn_zna,
			(b.cnsctvo_cdgo_dprtmnto) cnsctvo_cdgo_dprtmnto
		From	 bdAfiliacion.dbo.tbCiudades_Vigencias a, bdAfiliacion.dbo.tbDepartamentos b, bdAfiliacion.dbo.tbClasificacionGeografica  c, bdAfiliacion.dbo.tbZonas d
		Where	(@ldFechaReferencia  between a.inco_vgnca   And   a. fn_vgnca)
		And	(a.Vsble_Usro  = 'S' or @lcTraerTodosVisibleUsuario = 'S')
		And	a.cnsctvo_cdgo_dprtmnto		= b.cnsctvo_cdgo_dprtmnto
		And	a.cnsctvo_cdgo_clsfccn_ggrfca	= c.cnsctvo_cdgo_clsfccn_ggrfca
		And	a.cnsctvo_cdgo_zna		= d.cnsctvo_cdgo_zna
	Else
		--Selecciona todos los registros de  la tabla  tbsedes donde el campo borrado sea 'N'  y este
		--dentro de un rango vigente  ademas que   el campo descripcion  contenga el parametro de seleccion.
		Select	cdgo_cdd,	 dscrpcn_cdd,	b.dscrpcn_dprtmnto,  cnsctvo_cdgo_cdd, a.cnsctvo_cdgo_zna , pse_brrs,
			a.cnsctvo_cdgo_clsfccn_ggrfca, c.dscrpcn_tpo_clsfccn_ggrfca, d.dscrpcn_zna, b.cnsctvo_cdgo_dprtmnto
		From	 bdAfiliacion.dbo.tbCiudades_Vigencias a, bdAfiliacion.dbo.tbDepartamentos b, bdAfiliacion.dbo.tbClasificacionGeografica  c, bdAfiliacion.dbo.tbZonas d       
		Where	(@ldFechaReferencia  between a.inco_vgnca        And   a.fn_vgnca) 
		And	dscrpcn_cdd like  '%' + ltrim(rtrim(@lcCadenaSeleccion) + '%' ) 
		And	a.cnsctvo_cdgo_dprtmnto		= b.cnsctvo_cdgo_dprtmnto
		And	(a.Vsble_Usro =	 'S'	or @lcTraerTodosVisibleUsuario ='S')
		And	a.cnsctvo_cdgo_clsfccn_ggrfca	= c.cnsctvo_cdgo_clsfccn_ggrfca
		And	a.cnsctvo_cdgo_zna		= d.cnsctvo_cdgo_zna
End 
Else
	--Selecciona todos los registros de  la tabla  tbsedes donde el campo borrado sea 'N'  y este dentro de un rango vigente  ademas  donde el codigo sea igual al parametro  @lcCodigoSede.
	Select    cdgo_cdd,	 dscrpcn_cdd,   b.dscrpcn_dprtmnto,  cnsctvo_cdgo_cdd, a.cnsctvo_cdgo_zna , pse_brrs,
		a.cnsctvo_cdgo_clsfccn_ggrfca, c.dscrpcn_tpo_clsfccn_ggrfca, d.dscrpcn_zna, b.cnsctvo_cdgo_dprtmnto
	From	bdAfiliacion.dbo.tbCiudades_Vigencias a, bdAfiliacion.dbo.tbDepartamentos b, bdAfiliacion.dbo.tbClasificacionGeografica  c, bdAfiliacion.dbo.tbZonas d    
	Where	(@ldFechaReferencia  between a.inco_vgnca    And    a. fn_vgnca)
	And	cdgo_cdd  =  @lcCodigoCiudad
	And	(a.Vsble_Usro	 =	 'S'	or @lcTraerTodosVisibleUsuario ='S')
	And	 a.cnsctvo_cdgo_dprtmnto	=	b.cnsctvo_cdgo_dprtmnto
	And	a.cnsctvo_cdgo_clsfccn_ggrfca = c.cnsctvo_cdgo_clsfccn_ggrfca
	And	a.cnsctvo_cdgo_zna = d.cnsctvo_cdgo_zna
	order by dscrpcn_cdd





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarCiudades] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarCiudades] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDConsultarCiudades] TO [visosservice_role]
    AS [dbo];

