CREATE TYPE [dbo].[udtLogico]
    FROM CHAR (1) NULL;


GO
GRANT EXECUTE
    ON TYPE::[dbo].[udtLogico] TO [Liquidador Recobros];


GO
GRANT EXECUTE
    ON TYPE::[dbo].[udtLogico] TO [Coordinador Parametros Recobro];


GO
GRANT EXECUTE
    ON TYPE::[dbo].[udtLogico] TO [Administrador Digitalizadores Gestion Documental ];

