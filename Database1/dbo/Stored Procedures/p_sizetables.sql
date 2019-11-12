CREATE procedure [dbo].[p_sizetables]
as
Begin transaction
/**************Procedimiento creado por KM para ver el tamaño de las tablas de una base de datos*/
SET NOCOUNT ON
declare @nombre_tabla varchar(100)
declare @propietario varchar(40)
declare @uid int
declare @nombre_completo varchar(150)
declare @nombre_db varchar(256)

--drop table #resultados
create table #resultados
(nombre varchar(50),
 filas decimal(12,0),
 reservado_kb varchar(40),
 data_kb varchar(40),
 tamaño_indice_kb varchar(20),
 no_usado_kb varchar(20))

declare tablas cursor
for select a.uid , propietario = left( b.name,40), tabla =  a.name from sysobjects a, sysusers b 
where type = 'U' and a.uid = b.uid  order by tabla

select @nombre_db = db_name()

OPEN tablas
FETCH NEXT FROM tablas into @uid, @propietario, @nombre_tabla
WHILE @@FETCH_STATUS = 0
BEGIN
    if @uid = 1
    begin
          insert #resultados    
          exec sp_spaceused @nombre_tabla 
    end
    else
        begin
         SET @nombre_completo = rtrim(ltrim(@nombre_db))+'.' + ltrim(rtrim(@propietario)) +'.'+ @nombre_tabla 
          insert #resultados    
          exec sp_spaceused @nombre_completo
       end
    FETCH NEXT FROM tablas INTO @uid, @propietario, @nombre_tabla
END

CLOSE tablas
DEALLOCATE tablas

update #resultados set reservado_kb = replace(reservado_kb,'KB','')
update #resultados set data_kb = replace(data_kb,'KB','')
update #resultados set tamaño_indice_kb = replace(tamaño_indice_kb,'KB','')
update #resultados set no_usado_kb = replace(no_usado_kb,'KB','')

select * from #resultados
order by filas desc

Commit Transaction
