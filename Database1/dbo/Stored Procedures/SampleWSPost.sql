CREATE PROCEDURE [dbo].[SampleWSPost]
@weburl NVARCHAR (4000) NULL, @returnval NVARCHAR (2000) NULL OUTPUT
AS EXTERNAL NAME [SPAssembly].[StoredProcedures].[InvokeWSPost]

