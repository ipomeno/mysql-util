DROP FUNCTION IF EXISTS dbleitura.LIMPAR_NUMEROS;

DELIMITER $$
$$
CREATE FUNCTION dbleitura.LIMPAR_NUMEROS(numero varchar(50))
RETURNS varchar(50)
DETERMINISTIC
BEGIN
	declare num varchar(30);
	
	set num = replace(trim(numero), '/', '');
	set num = replace(num, '-', '');
	set num = replace(num, '.', '');
	set num = replace(num, ' ', '');

	if (num = '') then
		return null;
	end if;

	return num;

END$$
DELIMITER ;