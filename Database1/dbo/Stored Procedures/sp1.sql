CREATE procedure sp1
@id int
as 
select DISTINCT 0 as sel from tbParametrosGenerales 
where cnsctvo_cdgo_prmtro_gnrl = @id
