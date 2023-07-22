
create or replace function get_shpm_count(gwkg_from numeric, gwkg_to numeric)
returns int
language plpgsql
as
$$
declare
   shpm_count integer;
begin
   select count(*) 
   into shpm_count
   from shipment
   where gw_kg between gwkg_from and gwkg_to;
   
   return shpm_count;
end;
$$;

select get_shpm_count(19000,20000);

   
  