
do
$$
declare
	rec record;
	filename text := '';
	sql_text text;
begin
	for rec in SELECT tablename FROM pg_catalog.pg_tables
				WHERE schemaname != 'information_schema' AND
					schemaname != 'pg_catalog' AND tablename !='spatial_ref_sys'
	loop
		filename := 'E:\'||rec.tablename||'_utf8.csv';
		raise notice 'Salvando %', filename;
		
		sql_text:= 'COPY docinfo TO '|| quote_literal(filename) || ' DELIMITER '';'' CSV HEADER;';
		raise notice '%', sql_text;
		EXECUTE sql_text;
		
	end loop;
end;
$$

