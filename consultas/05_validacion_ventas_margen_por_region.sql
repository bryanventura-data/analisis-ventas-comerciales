
-- Regiones (página 3)

-- Valida ventas, ganancia y margen % por región de la página Regiones (sin comparación YoY)

SELECT
    g.Region,
    COUNT(f.TransaccionID) AS Transacciones,
    ROUND(SUM(f.Cantidad * f.Precio_Venta_Unitario), 2) AS Ventas,
    ROUND(SUM(f.Cantidad * (f.Precio_Venta_Unitario - f.Costo_Unitario_Venta)), 2) AS Ganancia,
    ROUND(SUM(f.Cantidad * (f.Precio_Venta_Unitario - f.Costo_Unitario_Venta))
        / SUM(f.Cantidad * f.Precio_Venta_Unitario) * 100, 2) AS Margen_Porcentual
FROM fact_ventas AS f
INNER JOIN dim_geografia AS g ON f.RegionID = g.RegionID
WHERE YEAR(f.Fecha) = (SELECT YEAR(MAX(Fecha)) FROM fact_ventas)
GROUP BY g.Region
ORDER BY Ventas DESC;
