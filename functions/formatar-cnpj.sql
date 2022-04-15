DROP FUNCTION IF EXISTS FORMATAR_CNPJ;

DELIMITER $$
$$
CREATE FUNCTION FORMATAR_CNPJ(numero varchar(30))
RETURNS varchar(30) 
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

	if (length(num) < 14) then
		return numero;
	end if;

	set num = insert(num, 3, 0, '.');
	set num = insert(num, 7, 0, '.');
	set num = insert(num, 11, 0, '/');
	set num = insert(num, 16, 0, '-');
	
	return num;

END$$
DELIMITER ;
