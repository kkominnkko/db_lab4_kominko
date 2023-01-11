--функція, яка виводить усі дані про персонажа, сила якого більше вказаної

DROP FUNCTION IF EXISTS hero_data(int);

CREATE OR REPLACE FUNCTION hero_data(hero_arg int)
    RETURNS TABLE (hero varchar, strength int, agility int, intelligence int, role varchar, category varchar)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT hero_name::varchar, hero_strength::int, hero_agility::int, hero_intelligence::int, hero_role::varchar, hero_category::varchar
		FROM heroes JOIN roles ON heroes.role_id = roles.role_id 
		JOIN category ON category.category_id = heroes.category_id 
		WHERE hero_strength > hero_arg;
END;
$$;




