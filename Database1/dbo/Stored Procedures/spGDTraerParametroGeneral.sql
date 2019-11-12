

CREATE  PROCEDURE [dbo].[spGDTraerParametroGeneral] 
@lcConsecutivoParametro		Int,
@ldFechaReferencia		Datetime	=	Null,
@lcTipoParametro		Char(1)		=	Null		Output,
@LnValorParametroNumerico	int		=	Null		Output,
@lcValorParametroCaracter	Varchar(100)	=	Null		Output,
@ldValorParametroFecha	Datetime	=	Null		Output,
@vsble_usro			Char(1)	=	Null

AS

Set Nocount On

If @vsble_usro is null
	set @vsble_usro='S'

--2 líneas nuevas de código.
If @ldFechaReferencia is Null
	Set @ldFechaReferencia = GetDate()

--Selecciona el tipo de parametro que se encuentra en la tabla  tbparametrosgenerales y que cumpla
--con las Condiciones de Validacion
Select	@lcTipoParametro	 =	 tpo_dto_prmtro
--Línea antigua de código. Las fechas de vigencia se encuentran en la tabla de vigencias.
/*from	tbparametrosgenerales*/
--Nueva línea de código
From	tbparametrosgenerales_Vigencias
Where	(@ldFechaReferencia    Between   Inco_Vgnca    And    Fn_Vgnca )   			
And	(vsble_usro		= 	@vsble_usro or @vsble_usro='T')
And	@lcConsecutivoParametro	=  	cnsctvo_cdgo_prmtro_gnrl

--Select @lcTipoParametro

--Se valida si es diferente de Null , se verifica si el tipo de parametro es caracter , numerico, o de tipo fecha
--If  @lcTipoParametro != Null   
If  @lcTipoParametro Is Not Null
Begin
		
		If	@lcTipoParametro = 'N'
			--Se asigna a la variable el valor del parametro cuando es numerico
			Select     @lnValorParametroNumerico =  vlr_prmtro_nmrco
			--Línea antigua de código. Las fechas de vigencia se encuentran en la tabla de vigencias.
			/*from	tbparametrosgenerales*/
			--Nueva línea de código
			From 	 tbParametrosGenerales_Vigencias                      
			Where	  (@ldFechaReferencia    Between   Inco_Vgnca    And    Fn_Vgnca )   			
			And	  (vsble_usro		= 	@vsble_usro or @vsble_usro='T')
			And	  @lcConsecutivoParametro	 =	cnsctvo_cdgo_prmtro_gnrl
		Else
			Begin
			--Se asigna a la variable el valor del parametro cuando es caracter
				If	@lcTipoParametro = 'C'
					 Begin
						Select     @lcValorParametroCaracter  =  vlr_prmtro_crctr
						--Línea antigua de código. Las fechas de vigencia se encuentran en la tabla de vigencias.
						/*from	tbparametrosgenerales*/
						--Nueva línea de código
						From	  tbParametrosGenerales_Vigencias                      
						Where	 (@ldFechaReferencia    Between   Inco_Vgnca    And    Fn_Vgnca )   			
						And	  (vsble_usro		= 	@vsble_usro or @vsble_usro='T')
						And	  @lcConsecutivoParametro	=	cnsctvo_cdgo_prmtro_gnrl
						--Select  'parametro caracter', @lcValorParametroCaracter
					End

				Else
						--Se asigna a la variable el valor del parametro cuando es fecha
						Select     @ldValorParametroFecha  =  vlr_prmtro_fcha
						--Línea antigua de código. Las fechas de vigencia se encuentran en la tabla de vigencias.
						/*from	tbparametrosgenerales*/
						--Nueva línea de código
						From	  tbParametrosGenerales_Vigencias
						Where	  (@ldFechaReferencia    Between   Inco_Vgnca    And    Fn_Vgnca )   			
						And	  (vsble_usro		= 	@vsble_usro or @vsble_usro='T')
						And	  @lcConsecutivoParametro	=	cnsctvo_cdgo_prmtro_gnrl
			End
End

Else
	Return (-1)








GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Consultor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Auditor Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Autorizadora Notificacion]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Auditoria Interna Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Auxiliar Prestaciones Medicas y Validacion de Derechos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Auditoria Interna]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Administrador Notificaciones Atep SOA]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Coordinador Parametros Vision Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [380005 Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Coordinador Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Auxiliar Parametros Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Aprendiz Red de Servicios Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [380004 Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Consultor Cuentas Medicas Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [380006 Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Consultor Auxiliar Sedes Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [380003 Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Auditor Interno Red Salud]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Coordinador Juridico Notificaciones]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Liquidador Facturas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraerParametroGeneral] TO [visosservice_role]
    AS [dbo];

