CREATE ROLE [visosservice_role]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [visosservice_role] ADD MEMBER [visosservice_webusr];

