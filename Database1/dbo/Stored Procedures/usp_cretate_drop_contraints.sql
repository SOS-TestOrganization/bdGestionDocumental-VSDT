

create procedure [dbo].[usp_cretate_drop_contraints]  (@objename varchar(256),@action char(6))
as

DECLARE @schema_name SYSNAME; 
DECLARE @table_name SYSNAME; 
DECLARE @constraint_name SYSNAME; 
DECLARE @constraint_object_id INT; 
DECLARE @referenced_object_name SYSNAME; 
DECLARE @is_disabled BIT; 
DECLARE @is_not_for_replication BIT; 
DECLARE @is_not_trusted BIT; 
DECLARE @delete_referential_action TINYINT; 
DECLARE @update_referential_action TINYINT; 
DECLARE @tsql NVARCHAR(4000); 
DECLARE @tsql2 NVARCHAR(4000); 
DECLARE @fkCol SYSNAME; 
DECLARE @pkCol SYSNAME; 
DECLARE @col1 BIT; 
--DECLARE @action CHAR(6); 
--DECLARE @action2 CHAR(6); 
DECLARE @referenced_schema_name SYSNAME; 
declare @id int;

--SET @action = 'DROP'; 
--SET @action2 = 'CREATE'; 



select @id=object_id(@objename)

DECLARE fkcursor CURSOR FOR 
  SELECT Object_schema_name(parent_object_id), 
         Object_name(parent_object_id), 
         name, 
         Object_name(referenced_object_id), 
         object_id, 
         is_disabled, 
         is_not_for_replication, 
         is_not_trusted, 
         delete_referential_action, 
         update_referential_action, 
         Object_schema_name(referenced_object_id) 
  FROM   sys.foreign_keys 
  WHERE referenced_object_id=@id
  ORDER  BY 1, 
            2; 

OPEN fkcursor; 

FETCH next FROM fkcursor INTO @schema_name, @table_name, @constraint_name, 
@referenced_object_name, @constraint_object_id, @is_disabled, 
@is_not_for_replication, @is_not_trusted, @delete_referential_action, 
@update_referential_action, @referenced_schema_name; 

WHILE @@FETCH_STATUS = 0 
  BEGIN 
      IF @action <> 'CREATE' 
        SET @tsql = 'ALTER TABLE ' + Quotename(@schema_name) + '.' 
                    + Quotename(@table_name) 
                    + ' DROP CONSTRAINT ' 
                    + Quotename(@constraint_name) + ';'; 
      ELSE 
        BEGIN 
            SET @tsql = 'ALTER TABLE ' + Quotename(@schema_name) + '.' 
                        + Quotename(@table_name) + CASE @is_not_trusted WHEN 0 
                        THEN 
                        ' WITH CHECK ' ELSE ' WITH NOCHECK ' END 
                        + ' ADD CONSTRAINT ' 
                        + Quotename(@constraint_name) 
                        + ' FOREIGN KEY ('; 
            SET @tsql2 = ''; 

            DECLARE columncursor CURSOR FOR 
              SELECT Col_name(fk.parent_object_id, fkc.parent_column_id), 
                     Col_name(fk.referenced_object_id, fkc.referenced_column_id) 
              FROM   sys.foreign_keys fk 
                     INNER JOIN sys.foreign_key_columns fkc 
                             ON fk.object_id = fkc.constraint_object_id 
              WHERE  fkc.constraint_object_id = @constraint_object_id 
              ORDER  BY fkc.constraint_column_id; 

            OPEN columncursor; 

            SET @col1 = 1; 

            FETCH next FROM columncursor INTO @fkCol, @pkCol; 

            WHILE @@FETCH_STATUS = 0 
              BEGIN 
                  IF ( @col1 = 1 ) 
                    SET @col1 = 0; 
                  ELSE 
                    BEGIN 
                        SET @tsql = @tsql + ','; 
                        SET @tsql2 = @tsql2 + ','; 
                    END; 

                  SET @tsql = @tsql + Quotename(@fkCol); 
                  SET @tsql2 = @tsql2 + Quotename(@pkCol); 

                  FETCH next FROM columncursor INTO @fkCol, @pkCol; 
              END; 

            CLOSE columncursor; 

            DEALLOCATE columncursor; 

            SET @tsql = @tsql + ' ) REFERENCES ' 
                        + Quotename(@referenced_schema_name) + '.' 
                        + Quotename(@referenced_object_name) + ' (' 
                        + @tsql2 + ')'; 
            SET @tsql = @tsql + ' ON UPDATE ' + CASE @update_referential_action 
                        WHEN 0 
                        THEN 'NO ACTION ' 
                        WHEN 1 THEN 'CASCADE ' WHEN 2 THEN 'SET NULL ' ELSE 
                        'SET DEFAULT ' 
                        END + ' ON DELETE ' + CASE @delete_referential_action 
                        WHEN 
                        0 
                        THEN 
                        'NO ACTION ' WHEN 1 THEN 'CASCADE ' WHEN 2 THEN 
                        'SET NULL ' 
                        ELSE 
                        'SET DEFAULT ' END + CASE @is_not_for_replication WHEN 1 
                        THEN 
                        ' NOT FOR REPLICATION ' ELSE '' END 
                        + ';'; 
        END; 

      PRINT @tsql; 

      IF @action = 'CREATE' 
        BEGIN 
            SET @tsql = 'ALTER TABLE ' + Quotename(@schema_name) + '.' 
                        + Quotename(@table_name) + CASE @is_disabled WHEN 0 THEN 
                        ' CHECK ' 
                        ELSE ' NOCHECK ' END + 'CONSTRAINT ' 
                        + Quotename(@constraint_name) + ';'; 

            PRINT @tsql;; 
        END; 

      FETCH next FROM fkcursor INTO @schema_name, @table_name, @constraint_name, 
      @referenced_object_name, @constraint_object_id, @is_disabled, 
      @is_not_for_replication, @is_not_trusted, @delete_referential_action, 
      @update_referential_action, @referenced_schema_name; 
  END; 

CLOSE fkcursor; 

DEALLOCATE fkcursor;
