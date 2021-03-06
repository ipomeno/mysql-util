DROP FUNCTION IF EXISTS LIMPAR_NUMEROS;

DELIMITER $$
$$
CREATE FUNCTION LIMPAR_NUMEROS(numero varchar(50))
RETURNS varchar(50)
DETERMINISTIC
BEGIN
	return REGEXP_REPLACE(numero, '[^0-9]+', '');
END$$
DELIMITER ;
