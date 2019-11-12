CREATE TABLE [dbo].[tbUsuarios] (
    [prmr_nmbre_usro]        CHAR (15)     NOT NULL,
    [sgndo_nmbre_usro]       CHAR (15)     NULL,
    [prmr_aplldo_usro]       CHAR (50)     NOT NULL,
    [sgndo_aplldo_usro]      CHAR (50)     NULL,
    [lgn_usro]               CHAR (30)     NOT NULL,
    [psswrd_usro]            CHAR (10)     NOT NULL,
    [dscrpcn_usro]           VARCHAR (150) NOT NULL,
    [cnsctvo_cdgo_crgo_usro] INT           NOT NULL,
    [cnsctvo_cdgo_ara_usro]  INT           NOT NULL,
    [cdgo_grpo]              CHAR (5)      NOT NULL,
    [cnsctvo_cdgo_ofcna]     INT           NOT NULL,
    [dmno_usro]              CHAR (20)     NULL,
    [cnsctvo_cdgo_dgtdr]     INT           NULL,
    [eml]                    CHAR (1)      NULL,
    [tme_stmp]               ROWVERSION    NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbUsuarios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbUsuarios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbUsuarios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbUsuarios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbUsuarios] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbUsuarios] TO [Unibase]
    AS [dbo];

