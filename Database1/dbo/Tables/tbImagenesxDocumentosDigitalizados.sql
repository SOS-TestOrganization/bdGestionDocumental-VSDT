CREATE TABLE [dbo].[tbImagenesxDocumentosDigitalizados] (
    [cnsctvo_cdgo_imgn]     INT           NOT NULL,
    [cnsctvo_cdgo_dcmnto]   INT           NOT NULL,
    [cnsctvo_cdgo_tpo_imgn] INT           NOT NULL,
    [rta_imgn]              VARCHAR (250) NOT NULL,
    [prncpl]                CHAR (1)      NOT NULL,
    [estdo]                 CHAR (1)      CONSTRAINT [DF_tbImagenesxDocumentosDigitalizados_estdo_2] DEFAULT ('A') NULL,
    [usro_crcn]             CHAR (30)     NULL,
    [fcha_crcn]             DATETIME      CONSTRAINT [DF_fcha_crcn_nueva] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_tbImagenesxDocumentosDigitalizados_old] PRIMARY KEY CLUSTERED ([cnsctvo_cdgo_imgn] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_dba_tbImagenesxDocumentosDigitalizados_02]
    ON [dbo].[tbImagenesxDocumentosDigitalizados]([cnsctvo_cdgo_dcmnto] ASC, [estdo] ASC)
    INCLUDE([cnsctvo_cdgo_imgn], [cnsctvo_cdgo_tpo_imgn], [rta_imgn])
    ON [FG_INDEXES];


GO
/*---------------------------------------------------------------------------------
* Nombre            : TrIncidencias_tbImagenesxDocumentosDigitalizados
* Desarrollado por	: <\A Luis Fernando Benavides							A\>
* Descripcion		: <\D   D\>
* Observaciones     : <\O   O\>
* Parametros		: <\P   P\>
* Variables			: <\V   V\>
* Fecha Creacion	: <\FC 2014/03/19										FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION
*---------------------------------------------------------------------------------
* Modificado Por		: <\AM  AM\>
* Descripcion			: <\DM  DM\>
* Nuevos Parametros		: <\PM  PM\>
* Nuevas Variables		: <\VM  VM\>
* Fecha Modificacion	: <\FM  FM\>
-----------------------------------------------------------------------------------*/

--ALTER TRIGGER [dbo].[TrIncidencias_tbImagenesxDocumentosDigitalizados]
CREATE TRIGGER [dbo].[TrIncidencias_tbImagenesxDocumentosDigitalizados]
On [dbo].[tbImagenesxDocumentosDigitalizados]
For Update As

Declare @lcFechaIncidencia		VarChar(30),		-->Fecha de Incidencia
	@lcIdColumna			Int, 			-->Identificador de Columna
	@lcCampo			udtNombreObjeto,	-->Nombre de Columna
	@lcUsuario			VarChar(30),		-->Usuario que realiza la incidencia
	@lcInsertString			nVarChar(2000),	-->Cadena ejecutable con la inserción del registro de la incidencia
	@lnmaxConsecutivo		Int,
	@lcmaxConsecutivo		char(7),
	@cnsctvo_cdgo_atrzcn		int,
	@lcdeletestring			nvarchar(2000),
	@lcMaquinaIncidencia		varchar(30),
	@cnsctvo_cdgo_imgn			int
	

Set NoCount On
Begin
 	-->Obtener Fecha y Usuario de la incidencia
  	set @lcFechaIncidencia = GetDate()--convert(VarChar(30),GetDate(),120)
	set @lcUsuario = Ltrim(Rtrim(System_User))
	set @lcMaquinaIncidencia = HOST_NAME ( ) 

	-->Obtener la imagen de los registros Borrados (Deleted) e Insertados (Inserted)
	select * into #tbValoresAnteriores From Deleted
	select * into #tbValoresNuevos From Inserted

	declare crValoresAnteriores cursor for
	select	cnsctvo_cdgo_imgn
	from	Inserted

	open	crValoresAnteriores
	FETCH NEXT FROM crValoresAnteriores
	INTO @cnsctvo_cdgo_imgn

	WHILE @@FETCH_STATUS = 0
  	BEGIN

		-->Obtener los campos pertenacientes
		DECLARE crCampos CURSOR FOR 
		Select cdgo_cmpo,id_clmna 
		From tbCampos
		Where bse_dts ='bdGestionDocumental'
		And tbla = 'tbImagenesxDocumentosDigitalizados'
		And aplca_incdnca = 'S'
		Order by id_clmna

		OPEN crCampos
		FETCH NEXT FROM crCampos
		INTO @lcCampo, @lcIdColumna
	
		-->Recorrer el cursor de los campos del formulario para determinar las columnas 
		-->actualizadas e Insertar el Registro correspondiente en tbIncidenciasTablas
		WHILE @@FETCH_STATUS = 0
	  	BEGIN
			Select	@lnmaxConsecutivo = Isnull(Max(cnsctvo_incdnca),0)
			From tbIncidenciasTablas
	
			Select @lcmaxConsecutivo = Ltrim(Rtrim(convert(char(7),Isnull(Max(@lnmaxConsecutivo),0)+1)))
	
	  	  	--Armar la cadena de Inserción del registro de la incidencia
	
			select @lcInsertString = 'Insert into tbIncidenciasTablas
				(cnsctvo_incdnca, cmpo_llve, cmpo_llve_vlr, nmbre_tbla, nmbre_cmpo, vlr_antrr, vlr_nvo, usro_incdnca, fcha_incdnca, mqna_incdnca)
				Select '''+@lcmaxConsecutivo+''', ''cnsctvo_cdgo_imgn'', cast(d.cnsctvo_cdgo_imgn as varchar), ''tbImagenesxDocumentosDigitalizados'', '''+@lcCampo+ ''',
					d.'+@lcCampo+',
					n.'+@lcCampo+', '''+@lcUsuario+''', '''+convert(char(30),@lcFechaIncidencia,120)+''',
					'''+@lcMaquinaIncidencia+'''
							From #tbValoresAnteriores d, #tbValoresNuevos n
							Where d.cnsctvo_cdgo_imgn = n.cnsctvo_cdgo_imgn 
								And ((d.'+@lcCampo+' <> n.'+@lcCampo+') 
									Or (d.'+@lcCampo+' Is Null And n.'+@lcCampo+' Is Not Null) 
									Or (n.'+@lcCampo+' Is Null And d.'+@lcCampo+' is Not null))
								and n.cnsctvo_cdgo_imgn = ' + cast(@cnsctvo_cdgo_imgn as varchar)
	
		     	--Ejecutar Cadena de Inserción
			EXEC sp_ExecuteSql @lcInsertString
			FETCH NEXT FROM crCampos
	       		INTO @lcCampo, @lcIdColumna
		END--Fin del Ciclo
	 
		CLOSE crCampos
		DEALLOCATE crCampos

		FETCH NEXT FROM crValoresAnteriores
		INTO @cnsctvo_cdgo_imgn

	end
	CLOSE crValoresAnteriores
	DEALLOCATE crValoresAnteriores

	Drop Table #tbValoresAnteriores
	Drop Table #tbValoresNuevos

End--Fin_si

GO
DISABLE TRIGGER [dbo].[TrIncidencias_tbImagenesxDocumentosDigitalizados]
    ON [dbo].[tbImagenesxDocumentosDigitalizados];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [GestionDocumental]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Administrador Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Jefaturas Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor General Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Web Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Kiosko Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Atencion al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Administrador Digitalizadores Gestion Documental ]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310009 Autorizadora Notificacion]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310009 Autorizadora Notificacion]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310009 Autorizadora Notificacion]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Unibase]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310007 Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310004 Consultor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310004 Consultor Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310004 Consultor Salud]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310008 Auditor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310010 Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310010 Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310010 Auxiliar Sipres Analista Notificaciones]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310001 Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310001 Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310001 Auxiliar de Prestaciones Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310002 Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310002 Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310002 Coordinador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310003 Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310003 Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310003 Validador de Prestaciones Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310011 Auditoria Interna Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310011 Auditoria Interna Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310011 Auditoria Interna Salud]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Analista Seguros Asistenciales]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Auditor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Auditor Salud]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [Consultor Novedades Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310014 Auxiliar Prestaciones Medicas y Validacion de Derechos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310014 Auxiliar Prestaciones Medicas y Validacion de Derechos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310014 Auxiliar Prestaciones Medicas y Validacion de Derechos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [900009 Consultor Salud Privilegiado]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [900009 Consultor Salud Privilegiado]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [900009 Consultor Salud Privilegiado]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [900002 Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [900002 Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [900002 Consultor Servicio al Cliente]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [900008 Consultor Salud]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [900008 Consultor Salud]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [900008 Consultor Salud]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [rcbrs_usr]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [330007 Liquidador Facturas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [330001 Coordinador Cuentas Medicas]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [330004 Radicador de Cuentas Medicas]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [310018 Auditor Salud Central]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [330008 Auditor Interno de Cuentas Medicas]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [SOS\310015 Auxiliar de Prestaciones Centelsa]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [SOS\310015 Auxiliar de Prestaciones Centelsa]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [SOS\310015 Auxiliar de Prestaciones Centelsa]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [websos]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tbImagenesxDocumentosDigitalizados] TO [visosservice_role]
    AS [dbo];

