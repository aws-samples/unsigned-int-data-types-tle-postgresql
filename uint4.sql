SELECT pgtle.install_extension
(
 'pg_uint4',
 '0.1',
  'PostgreSQL unsigned int4',
$_pg_tle_$
SELECT pgtle.create_shell_type('public', 'pg_uint4');
CREATE FUNCTION public.pg_uint4_in(input text) RETURNS bytea AS
$$
DECLARE
  result bytea;
BEGIN
  result := input;
  IF input::INT <= -1 OR input::INT >= 4294967296 THEN 
  RAISE EXCEPTION 'Input value does not fit into this unsigned int4 datatype';
  END IF;
  RETURN result;
END
;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;
CREATE FUNCTION public.pg_uint4_out(input bytea) RETURNS text AS
$$
DECLARE
  decoded TEXT;
BEGIN
  decoded := encode(input, 'escape');
  return decoded;
END
;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;
SELECT pgtle.create_base_type('public', 'pg_uint4', 'pg_uint4_in(text)'::regprocedure, 'pg_uint4_out(bytea)'::regprocedure, -1);
$_pg_tle_$
);
