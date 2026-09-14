
-- Crecimiento mes a mes (%) usando LAG() — complementa el gráfico "Crecimiento MoM %" de Tendencia

WITH Ventas_Mes AS (
    SELECT
        d.`Año` AS Anio,
        d.`Mes Num` AS Mes,
        d.`Mes Nombre` AS Nombre_Mes,
        SUM(f.Cantidad * f.Precio_Venta_Unitario) AS Ventas
    FROM fact_ventas AS f
    INNER JOIN Dim_Tiempo AS d ON f.Fecha = d.Fecha
    GROUP BY d.`Año`, d.`Mes Num`, d.`Mes Nombre`
)
SELECT
    Anio,
    Mes,
    Nombre_Mes,
    Ventas,
    LAG(Ventas) OVER (ORDER BY Anio, Mes) AS Ventas_Mes_Anterior,
    ROUND(
        (Ventas - LAG(Ventas) OVER (ORDER BY Anio, Mes))
        / LAG(Ventas) OVER (ORDER BY Anio, Mes) * 100, 2
    ) AS Crecimiento_MoM_Porcentual
FROM Ventas_Mes
ORDER BY Anio, Mes;
