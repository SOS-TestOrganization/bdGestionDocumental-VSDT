CREATE TYPE [dbo].[udtConsecutivo]
    FROM INT NULL;


GO
GRANT EXECUTE
    ON TYPE::[dbo].[udtConsecutivo] TO [Liquidador Recobros];


GO
GRANT EXECUTE
    ON TYPE::[dbo].[udtConsecutivo] TO [Coordinador Parametros Recobro];


GO
GRANT EXECUTE
    ON TYPE::[dbo].[udtConsecutivo] TO [Administrador Digitalizadores Gestion Documental ];

