


/*---------------------------------------------------------------------------------
* Metodo o PRG 	               :  spGDTraeParametrosProgramacionxTiposIndices
* Desarrollado por		  : <\A Ing. Cesar García 															A\>
* Descripcion			  : <\D Recupera todos los parametros de programación de acuerdo a ltipo de indice	D\>
* Observaciones		      : <\O																				O\>
* Parametros			  : <\P  Tipo de índice																P\>
* Variables				  : <\V 																			V\>
* Fecha Creacion	      : <\FC 2009/03/17																	FC\>
*
*---------------------------------------------------------------------------------
* DATOS DE MODIFICACION 
*---------------------------------------------------------------------------------
* Modificado Por		             : <\AM  AM\>
* Descripcion			: <\DM  DM\>
* Nuevos Parametros		: <\PM  PM\>
* Nuevas Variables		: <\VM  VM\>
* Fecha Modificacion		: <\FM  FM\>
*---------------------------------------------------------------------------------*/
CREATE Procedure [dbo].[spGDTraeParametrosProgramacionxTiposIndices]
--Declare
@cnsctvo_cdgo_tpo_dcmnto	udtConsecutivo

As
Set Nocount On

--Set	@cnsctvo_cdgo_tpo_dcmnto	=	3

Declare	@tbtiposindicesxtiposdocumentos As Table
(
dscrpcn_tpo_indce			Varchar(150),
vlr							Varchar(150),
cdgo_indce					Char(4),
cnsctvo_cdgo_tpo_indce		Int,
tpo_dato					Char(1),
tmno						Int,
clse_lgca					Varchar(150),
tpo_dto						Char(1),
lngtd_cmpo					Int,
sp_cnslta_prmtro			Varchar(150),
cmpo_cnsctvo_prmtro			Varchar(150),	
cmpo_dscrpcn_prmtro			Varchar(150),
cnsctvo_cdgo_prmtro			Varchar(50),
vlr_dgtdo					Varchar(150),
sp_rcpra_vlr_mstr			Varchar(150),
vlr_mstrdo					Varchar(150)
)

Insert Into		@tbtiposindicesxtiposdocumentos
Select			t.dscrpcn_tpo_indce,		'',						t.cdgo_indce,				t.cnsctvo_cdgo_tpo_indce,
				t.tpo_dato,					t.tmno,					p.clse_lgca,				p.tpo_dto,
				p.lngtd_cmpo,				p.sp_cnslta_prmtro,		p.cmpo_cnsctvo_prmtro,		p.cmpo_dscrpcn_prmtro,
				p.cnsctvo_cdgo_prmtro,		'',						p.sp_rcpra_vlr_mstr,		''
From			dbo.tbTiposIndices							t
Inner Join		dbo.tbTiposIndicesxTiposDocumentos			o	On	o.cnsctvo_cdgo_tpo_indce	=	t.cnsctvo_cdgo_tpo_indce
Inner Join		dbo.tbParametrosProgramacionxTiposIndices	p	On	p.cnsctvo_cdgo_tpo_indce	=	o.cnsctvo_cdgo_tpo_indce
Where			o.cnsctvo_cdgo_tpo_dcmnto	=	@cnsctvo_cdgo_tpo_dcmnto

-- Campo que almacenará la carátula de la indexación
Insert Into		@tbtiposindicesxtiposdocumentos
Values	(		'Carátula',					'',						'00',  						90,
				'C',						1,						'clCajaTextoCaracter',		'C',
				1,							NULL,					NULL,						NULL,
				NULL,						'',						NULL,						''
		)

-- Campo que almacenará la ruta de la imagen
Insert Into		@tbtiposindicesxtiposdocumentos
Values	(		'Imagen',					'',						'99',  						91,
				'C',						1,						'clCajaTextoCaracter',		'C',
				250,						NULL,					NULL,						NULL,
				NULL,						'',						NULL,						''
		)

Select			*
From			@tbtiposindicesxtiposdocumentos
Order By		cnsctvo_cdgo_tpo_indce

	




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraeParametrosProgramacionxTiposIndices] TO [GestionDocumental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraeParametrosProgramacionxTiposIndices] TO [Administrador Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraeParametrosProgramacionxTiposIndices] TO [Consultor Gestion Documental]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraeParametrosProgramacionxTiposIndices] TO [Gestion Documental Web]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraeParametrosProgramacionxTiposIndices] TO [Liquidador Recobros]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraeParametrosProgramacionxTiposIndices] TO [Coordinador Parametros Recobro]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraeParametrosProgramacionxTiposIndices] TO [websos]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGDTraeParametrosProgramacionxTiposIndices] TO [visosservice_role]
    AS [dbo];

