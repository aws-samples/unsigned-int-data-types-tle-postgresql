SELECT pgtle.install_extension
(
 'pg_uint2',
 '0.1',
  'PostgreSQL unsigned int2',
$_pg_tle_$
SELECT pgtle.create_shell_type('public', 'pg_uint2');
CREATE FUNCTION public.pg_uint2_in(input text) RETURNS bytea AS
$$
DECLARE
  result bytea;
BEGIN
  result := input;
  IF input::INT <= -1 OR input::INT >= 65536 THEN 
  RAISE EXCEPTION 'Input value does not fit into this unsigned int2 datatype';
  END IF;
  RETURN result;
END
;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;
CREATE FUNCTION public.pg_uint2_out(input bytea) RETURNS text AS
$$
DECLARE
  decoded TEXT;
BEGIN
  decoded := encode(input, 'escape');
  return decoded;
END
;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;
SELECT pgtle.create_base_type('public', 'pg_uint2', 'pg_uint2_in(text)'::regprocedure, 'pg_uint2_out(bytea)'::regprocedure, -1);
$_pg_tle_$
);
