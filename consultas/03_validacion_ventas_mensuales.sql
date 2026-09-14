
-- Tendencia (página 2)

-- Valida el gráfico "VENTAS TOTALES" (mensual, todos los años) de la página Resumen

SELECT
    d.`Año` AS Anio,
    d.`Mes Num` AS Mes,
    d.`Mes Nombre` AS Nombre_Mes,
    ROUND(SUM(f.Cantidad * f.Precio_Venta_Unitario), 2) AS Ventas_Mensuales
FROM fact_ventas AS f
INNER JOIN Dim_Tiempo AS d ON f.Fecha = d.Fecha
GROUP BY d.`Año`, d.`Mes Num`, d.`Mes Nombre`
ORDER BY Anio, Mes;
