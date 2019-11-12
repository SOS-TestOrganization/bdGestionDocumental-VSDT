CREATE TABLE [dbo].[tbtemporal] (
    [Notificacion]                 NVARCHAR (255) NULL,
    [Fecha Notificacion]           NVARCHAR (255) NULL,
    [Evento]                       NVARCHAR (255) NULL,
    [Tpo Identificación]           NVARCHAR (255) NULL,
    [Nmro Identificación]          FLOAT (53)     NULL,
    [Primer Nombre]                NVARCHAR (255) NULL,
    [Segundo Nombre]               NVARCHAR (255) NULL,
    [Primer Apellido]              NVARCHAR (255) NULL,
    [Sedundo Apellido]             NVARCHAR (255) NULL,
    [Cod_DX]                       NVARCHAR (255) NULL,
    [Diagnostico]                  NVARCHAR (255) NULL,
    [Sede IPS Primaria]            NVARCHAR (255) NULL,
    [Sede Notifica]                NVARCHAR (255) NULL,
    [Numero Radicacion Tutela]     NVARCHAR (255) NULL,
    [Número Sentencia]             NVARCHAR (255) NULL,
    [Fecha Recepción Tutela]       NVARCHAR (255) NULL,
    [Juzgado]                      NVARCHAR (255) NULL,
    [Ciudad Juzgado]               NVARCHAR (255) NULL,
    [Dpto Fallo]                   NVARCHAR (255) NULL,
    [Num Id Accionante]            NVARCHAR (255) NULL,
    [Primer Ap Accionante]         NVARCHAR (255) NULL,
    [Segundo Ap Accionante]        NVARCHAR (255) NULL,
    [Primer Nom Accionante]        NVARCHAR (255) NULL,
    [Segundo Nom Accionante]       NVARCHAR (255) NULL,
    [Instancia]                    NVARCHAR (255) NULL,
    [Fecha Fallo]                  NVARCHAR (255) NULL,
    [Descripcion Estado Instancia] NVARCHAR (255) NULL,
    [Fecha Confirmación fallo]     NVARCHAR (255) NULL,
    [Resultado Fallo]              NVARCHAR (255) NULL,
    [Recobro Fosyga]               NVARCHAR (255) NULL,
    [Motivo de Accion]             NVARCHAR (255) NULL,
    [Causa negacion]               NVARCHAR (255) NULL,
    [Tipo Prestacion]              NVARCHAR (255) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbtemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbtemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbtemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbtemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbtemporal] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbtemporal] TO [Unibase]
    AS [dbo];

