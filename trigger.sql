--тригер, який при додаванні нового рядка в таблицю, 
--записує значення імен героїв з такою ж роллю у нижньому регістрі 

CREATE OR REPLACE FUNCTION lower_case() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
          UPDATE heroes 
          SET hero_name = lower(hero_name) WHERE heroes.role_id = NEW.role_id; 
		  RETURN NULL; 
     END;
$$;

CREATE TRIGGER lowercase
AFTER INSERT ON heroes
FOR EACH ROW EXECUTE FUNCTION lower_case()
