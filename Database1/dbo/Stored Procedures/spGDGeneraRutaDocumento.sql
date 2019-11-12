
CREATE Procedure	[dbo].[spGDGeneraRutaDocumento]
@ms_crpta		varchar(6),
@Dir_General	varchar(150),
@prmtro_cntdd	Int,
@rta_fnl		varchar(150)	Output

As
Set Nocount On

--Set			@ms_crpta		=	'200807'
--Set			@Dir_General	=	'\\sis08sal\compartido\responde\'

Declare		@nmro_crpta_1	varchar(3),
			@nmro_crpta_2	varchar(3),
			@nmro_crpta_3	varchar(3),
			@nvl_1			varchar(150),
			@nvl_2			varchar(150),
			@nvl_3			varchar(150),
			@nvl_4			varchar(150),
			@sbcdna			varchar(150),
			@lncntdd_archvs	int
			
Declare		@drctro_1	Table (crpta_fcha Varchar(150))
Declare		@drctro_2	Table (crpta_fcha Varchar(150))
Declare		@drctro_3	Table (crpta_fcha Varchar(150))
Declare		@drctro_4	Table (crpta_fcha Varchar(150))
Declare		@DirArchvo	Table (nmbre_archvo Varchar(150))
Declare		@DirTree	Table (subdirectory Varchar(150), depth Int)

Insert Into @drctro_1(crpta_fcha)
Exec master.dbo.xp_subdirs @Dir_General

If	Not Exists	(		Select	1	
						From	@drctro_1
						Where	crpta_fcha	=	@ms_crpta
				)
	Begin
		Set			@nvl_1		=	@Dir_General+@ms_crpta+'\'
		--Crear el directorio del nuevo mes
		Exec master.dbo.xp_create_subdir @nvl_1
		
		-- Crea el directorio de primer nivel de almacenamiento
		Set			@nmro_crpta_1		=	'000'
		Set			@nvl_2			=	@nvl_1+@nmro_crpta_1+'\'
		Exec		master.dbo.xp_create_subdir @nvl_2

		-- Crea el directorio de segundo nivel de almacenamiento	
		Set			@nmro_crpta_2		=	'000'
		Set			@nvl_3			=	@nvl_2+@nmro_crpta_2+'\'
		Exec		master.dbo.xp_create_subdir @nvl_3
		Set			@rta_fnl	=	@nvl_3
		--Set			@rta_fnl	=	@ms_crpta+'\'+@nmro_crpta_1+'\'+@nmro_crpta_2+'\'
		Select		@rta_fnl
	End
Else
	Begin
		Set	@nvl_1		=	@Dir_General+@ms_crpta+'\'
		Insert Into @drctro_2(crpta_fcha)
		Exec master.dbo.xp_subdirs	@nvl_1
	
		Declare		@lncntdd_sbdrctrs_nvl1	Int
		Set			@lncntdd_sbdrctrs_nvl1	=	(	Select	Count(*)
													From	@drctro_2
												)
		--Crear el directorio del nuevo consecutivo cuando no existe ningún directorio creado bajo la carpeta de la fecha
		If	@lncntdd_sbdrctrs_nvl1	<> 0
			-- Validar el directorio actual y mirar si todavía se puede almacenar sobre este archivos
			Begin

					Declare		@lccntdd_sbdrctrs_nvl2		Varchar(150)
					Set			@lccntdd_sbdrctrs_nvl2	=	(	Select	Replicate('0',3-Len(Ltrim(Rtrim(Convert(Char(3),@lncntdd_sbdrctrs_nvl1-1)))))+Ltrim(Rtrim(Convert(Char(3),@lncntdd_sbdrctrs_nvl1-1)))
															)
					Set	@nvl_2	=	@nvl_1+@lccntdd_sbdrctrs_nvl2+'\'
								
					Insert Into @drctro_3(crpta_fcha)
					Exec master.dbo.xp_subdirs	@nvl_2
					
					Declare	@lncntdd_sbdrctrs_nvl2	Int
					Set		@lncntdd_sbdrctrs_nvl2	=	(Select Count(*) From @drctro_3)

					
					If	@lncntdd_sbdrctrs_nvl2	<>	0
						Begin
							Declare		@lccntdd_sbdrctrs_nvl3		Varchar(150)
							Set			@lccntdd_sbdrctrs_nvl3	=	(	Select	Replicate('0',3-Len(Ltrim(Rtrim(Convert(Char(3),@lncntdd_sbdrctrs_nvl2-1)))))+Ltrim(Rtrim(Convert(Char(3),@lncntdd_sbdrctrs_nvl2-1))))
							Set			@nvl_3					=	@nvl_2+@lccntdd_sbdrctrs_nvl3+'\'
							Set			@sbcdna			=	'dir /b '+@nvl_3

							Insert Into	@DirArchvo (nmbre_archvo)
							Exec master.dbo.xp_cmdshell @sbcdna
							-- Borramos registros null
							Delete	
							From		@DirArchvo	
							Where		nmbre_archvo Is Null
							
							-- Calculamos la Cantidad de Documentos
							Set			@lncntdd_archvs	=	(	Select		Count(*)
																From		@DirArchvo
															)
							--Print		@lncntdd_archvs
							If	@lncntdd_archvs	< @prmtro_cntdd
								Begin
									Set		@rta_fnl	=	@nvl_3
									--Set		@rta_fnl	=	@ms_crpta+'\'+@lccntdd_sbdrctrs_nvl2+'\'+@lccntdd_sbdrctrs_nvl3+'\'
									Select	@rta_fnl
								End
							Else
								Begin
									If @lncntdd_sbdrctrs_nvl2	< @prmtro_cntdd
										Begin
											print		@lncntdd_sbdrctrs_nvl2
											Set			@lncntdd_sbdrctrs_nvl2	=	@lncntdd_sbdrctrs_nvl2 + 1
											Set			@lccntdd_sbdrctrs_nvl3	=	(	Select	Replicate('0',3-Len(Ltrim(Rtrim(Convert(Char(3),@lncntdd_sbdrctrs_nvl2-1)))))+Ltrim(Rtrim(Convert(Char(3),@lncntdd_sbdrctrs_nvl2-1))))	
											Set			@nvl_3			=	@nvl_2+@lccntdd_sbdrctrs_nvl3+'\'
											Exec		master.dbo.xp_create_subdir @nvl_3
											Set			@rta_fnl	=	@nvl_3
											--Set			@rta_fnl	=	@ms_crpta+'\'+@lccntdd_sbdrctrs_nvl2+'\'+@lccntdd_sbdrctrs_nvl3+'\'
											Select		@rta_fnl
										End
									Else
										Begin
											Declare		@lccntdd_sbdrctrs_nvl1		Varchar(150)
											Set			@lncntdd_sbdrctrs_nvl1	=	@lncntdd_sbdrctrs_nvl1 + 1
											Set			@lccntdd_sbdrctrs_nvl1	=	(	Select	Replicate('0',3-Len(Ltrim(Rtrim(Convert(Char(3),@lncntdd_sbdrctrs_nvl1-1)))))+Ltrim(Rtrim(Convert(Char(3),@lncntdd_sbdrctrs_nvl1-1))))	
											Set			@nvl_2			=	@nvl_1+@lccntdd_sbdrctrs_nvl1+'\'
											Exec		master.dbo.xp_create_subdir @nvl_2
											Set			@nvl_3			=	@nvl_2+'000'+'\'	
											Exec		master.dbo.xp_create_subdir @nvl_3
											Set			@rta_fnl	=	@nvl_3
											--Set			@rta_fnl	=	@ms_crpta+'\'+@lccntdd_sbdrctrs_nvl1+'\'+'000'+'\'
											Select		@rta_fnl
										End
								End
						End
			End
	End	







GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGeneraRutaDocumento] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGeneraRutaDocumento] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGeneraRutaDocumento] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGeneraRutaDocumento] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGeneraRutaDocumento] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGeneraRutaDocumento] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGeneraRutaDocumento] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDGeneraRutaDocumento] TO [visosservice_role]
    AS [dbo];

