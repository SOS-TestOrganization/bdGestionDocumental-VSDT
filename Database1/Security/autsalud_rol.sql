CREATE ROLE [autsalud_rol]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [autsalud_rol] ADD MEMBER [autsalud_webusr];

