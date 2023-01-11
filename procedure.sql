--процедура, яка виводить роль вибраного персонажа

DROP PROCEDURE IF EXISTS get_role(varchar);

CREATE OR REPLACE PROCEDURE get_role(hero_arg varchar(250))
LANGUAGE 'plpgsql'
AS $$
DECLARE nname heroes.hero_name%TYPE;
DECLARE rrole  roles.hero_role%TYPE;

BEGIN
    SELECT heroes.hero_name, roles.hero_role INTO nname, rrole FROM roles
		JOIN heroes ON heroes.role_id = roles.role_id
		WHERE heroes.hero_name = hero_arg;
    RAISE INFO 'Hero name: %,  Role: %', nname, rrole;
END;
$$;

