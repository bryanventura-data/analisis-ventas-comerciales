
-- Regiones cuya ganancia total supera el promedio entre todas las regiones (CTE)

WITH Ganancia_por_Region AS (
    SELECT
        g.RegionID,
        g.Region,
        SUM(f.Cantidad * (f.Precio_Venta_Unitario - f.Costo_Unitario_Venta)) AS Ganancia_Total
    FROM dim_geografia AS g
    INNER JOIN fact_ventas AS f ON g.RegionID = f.RegionID
    GROUP BY g.RegionID, g.Region
)
SELECT RegionID, Region, Ganancia_Total
FROM Ganancia_por_Region
WHERE Ganancia_Total > (SELECT AVG(Ganancia_Total) FROM Ganancia_por_Region)
ORDER BY Ganancia_Total DESC;
