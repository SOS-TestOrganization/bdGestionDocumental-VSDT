CREATE TYPE [dbo].[udtDescripcion]
    FROM VARCHAR (150) NULL;


GO
GRANT EXECUTE
    ON TYPE::[dbo].[udtDescripcion] TO [Liquidador Recobros];


GO
GRANT EXECUTE
    ON TYPE::[dbo].[udtDescripcion] TO [Administrador Digitalizadores Gestion Documental ];

