
CREATE PROCEDURE GetImmediateManager
   @employeeID INT,
   @managerID INT OUTPUT
AS
BEGIN
   SELECT @managerID = ManagerID 
   FROM HumanResources.Employee 
   WHERE EmployeeID = @employeeID
END