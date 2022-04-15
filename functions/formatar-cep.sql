DROP FUNCTION IF EXISTS FORMATAR_CEP;

DELIMITER $$
$$
CREATE FUNCTION FORMATAR_CEP(numero varchar(30))
RETURNS varchar(30)
DETERMINISTIC
BEGIN
	declare num varchar(30);
	
	set num = REGEXP_REPLACE(numero, '[^0-9]+', '');
	
	if (num = '') then
		return null;
	end if;
	
	if (length(num) < 8) then
		return numero;
	end if;

	set num = insert(num, 3, 0, '.');
	set num = insert(num, 7, 0, '-');
	
	return num;

END$$
DELIMITER ;