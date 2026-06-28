CONSULTA 1
-----------------------------------------------------------
- Mostrar los productos diferentes registrados en las ventas
-----------------------------------------------------------
SELECT DISTINCT producto
FROM ventas;


CONSULTA 2
-----------------------------------------------------------
- Mostrar las ventas realizadas entre el 1 de enero y el 31 de marzo de 2024
-----------------------------------------------------------
SELECT *
FROM ventas
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31';


CONSULTA 3
-----------------------------------------------------------
- Calcular el total vendido por región y mostrar únicamente aquellas regiones con ventas superiores a 5000
-----------------------------------------------------------
SELECT
    region,
    SUM(cantidad * precio_unitario) AS total_vendido
FROM ventas
GROUP BY region
HAVING SUM(cantidad * precio_unitario) > 5000;


CONSULTA 4
-----------------------------------------------------------
- Mostrar estadísticas por categoría:número de ventas, unidades vendidas y precio promedio
-----------------------------------------------------------
SELECT
    categoria,
    COUNT(*) AS numero_ventas,
    SUM(cantidad) AS total_unidades,
    AVG(precio_unitario) AS precio_promedio
FROM ventas
GROUP BY categoria;


CONSULTA 5
-----------------------------------------------------------
- Relacionar la tabla ventas con la tabla vendedores para consultar la zona y la meta mensual
-----------------------------------------------------------
SELECT
    v.order_id,
    v.vendedor,
    ven.zona,
    ven.meta_mensual
FROM ventas AS v
INNER JOIN vendedores AS ven
ON v.vendedor = ven.vendedor;


CONSULTA 6
-----------------------------------------------------------
- Mostrar los productos cuyo precio unitario es superior al precio promedio del catálogo
-----------------------------------------------------------
SELECT
    producto,
    precio_unitario
FROM ventas
WHERE precio_unitario >
(
    SELECT AVG(precio_unitario)
    FROM ventas
);