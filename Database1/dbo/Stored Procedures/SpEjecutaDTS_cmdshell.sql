

/*---------------------------------------------------------------------------------
* Metodo o PRG 			: dbo.SpEjecutaDTS_cmdshell
* Desarrollado por		: <\A Ing. Julian Fernando Bonilla A. A\>
* Descripcion			: <\D ejecuta DTS \>
* Observaciones			: <\O O\>
* Variables				: <\V V\>
* Fecha Creacion		: <\FC 2008/03/05 FC\>
* exec SpEjecutaDTS_cmdshell null, '"\\sis08sal\Asignacion_Empresas\DTS_AsigancionEmpresa.dtsx',null,null, 1,'',null,null,null,null,'cdgo_sde','01',null,null
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------
* Modificado Por		: <\AM sisogb01 AM\>
* Descripcion			: <\DM Se reemplaza el ultimo IF por un CASE al inicio, que sigue evaluando si debe utilizar un archivo .dtsx o cargar un DTS instalado en el motor. DM\>
* Nuevos Parametros		: <\PM  PM\>
* Nuevas Variables		: <\VM  VM\>
* Fecha Modificacion	: <\FM 2009/04/13 FM\>
*-------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[SpEjecutaDTS_cmdshell]
--Declare
	@Server varchar(255)				= Null,
	@PkgName varchar(255), 	
	@ServerUser varchar(255)			= Null,		
	@ServerPWD varchar(255)				= Null,		
	@IntSecurity bit = 1 ,			-- 0 = SQL Server Security, 1 = Integrated Security
	@PkgPWD varchar(255)				= '',		
	@G_Connection_name_1 varchar(511)	= Null,
	@G_Connection_value_1 varchar(511)	= Null,
	@G_Connection_name_2 varchar(511)	= Null,
	@G_Connection_value_2 varchar(511)	= Null,
	@GlobalVariableName1 varchar(511)	= Null,
	@GlobalVariableValue1 varchar(511)	= Null,
	@GlobalVariableName2 varchar(511)	= Null,
	@GlobalVariableValue2 varchar(511)	= Null
As
Set Nocount On

If (@PkgName is not null)
	Begin
		Declare @cmd	varchar(5000)

		Select	@cmd	=	Case	When @Server Is Null 
									Then 'dtexec /f "' + @PkgName + '"' 
									Else 'dtexec /sql "' + @PkgName + '" /SERVER "' + @Server + '"' 
							End
		--Set		@cmd	= @cmd+@PkgName
		--Set		@cmd	= @cmd+'" /SERVER "'
		--Set		@cmd	= @cmd+@Server +'"'
		
		
		if ((@ServerUser is not null) and (@ServerPWD is not null ))
			begin
			set @cmd = @cmd + ' /U "' + @ServerUser + '"' + ' /P "' + @ServerPWD + '"'
		end
		--select @cmd
		if (@G_Connection_name_1 is not null and @G_Connection_value_1 is not null)
			begin
			set @cmd = @cmd + ' /CONNECTION "' + @G_Connection_name_1 + '";"'+ @G_Connection_value_1 + '"'
		end	
		if (@G_Connection_name_2 is not null and @G_Connection_value_2 is not null)
			begin
			set @cmd = @cmd + ' /CONNECTION "' + @G_Connection_name_2 + '";"'+ @G_Connection_value_2 + '"'
		end	
		if(@GlobalVariableName1 is not null and @GlobalVariableValue1 is not null)
			begin
			set @cmd = @cmd +' /set \Package.Variables['+@GlobalVariableName1+'].Value;'+@GlobalVariableValue1
		end
		if(@GlobalVariableName2 is not null and @GlobalVariableValue2 is not null)
			begin
			set @cmd = @cmd +' /set \Package.Variables['+@GlobalVariableName2+'].Value;'+@GlobalVariableValue2
		end
		
		Set @cmd = @cmd + ' /MAXCONCURRENT " -1 " /CHECKPOINTING OFF  /REPORTING V'
		Print @cmd
		Execute xp_cmdshell @cmd
	
		If	@@error = 0
			Return --0
	End
Return -1
	/*If (@Server Is Null and @PkgName is not null)
		Begin
			Declare		@cmd1	Varchar(5000)
			Set			@cmd1	=	'dtexec /f "'
			Set			@cmd1	=	@cmd1+@PkgName+'"'

			if(@GlobalVariableName1 is not null and @GlobalVariableValue1 is not null)
				begin
					set @cmd1 = @cmd1 +' /set \Package.Variables['+@GlobalVariableName1+'].Value;'+@GlobalVariableValue1
				end

			Set			@cmd1	=	@cmd1 + ' /MAXCONCURRENT " -1 " /CHECKPOINTING OFF  /REPORTING V'
			Print @cmd1
			Execute xp_cmdshell @cmd1
		
			If	@@error <>0
				Return -1
		End
	Else
		Begin
			Return -1
		End*/





GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SpEjecutaDTS_cmdshell] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SpEjecutaDTS_cmdshell] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SpEjecutaDTS_cmdshell] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];

