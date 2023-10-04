SELECT pgtle.install_extension
(
 'pg_int',
 '0.1',
  'PostgreSQL signed int',
$_pg_tle_$
SELECT pgtle.create_shell_type('public', 'pg_int');
CREATE FUNCTION public.pg_int_in(input text) RETURNS bytea AS
$$
DECLARE
  result bytea;
BEGIN
  result := input;
  IF input::INT <= -129 OR input::INT >= 128 THEN 
  RAISE EXCEPTION 'Input value does not fit into this signed int datatype';
  END IF;
  RETURN result;
END
;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;
CREATE FUNCTION public.pg_int_out(input bytea) RETURNS text AS
$$
DECLARE
  decoded TEXT;
BEGIN
  decoded := encode(input, 'escape');
  return decoded;
END
;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;
SELECT pgtle.create_base_type('public', 'pg_int', 'pg_int_in(text)'::regprocedure, 'pg_int_out(bytea)'::regprocedure, -129);
$_pg_tle_$
);
