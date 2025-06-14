/*
Escribe una consulta SQL para encontrar el segundo salario más alto en una tabla empleados.

Asumir que existe la tabla empleados, con los campos salario, id y nombre.
*/

SELECT MAX(salario) as segundo_salario
FROM empleados
WHERE salario < {
  SELECT MAX(salario) FROM empleados
}

