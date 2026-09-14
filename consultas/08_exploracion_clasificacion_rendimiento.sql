
-- Clasifica productos por rendimiento de ventas usando CTE + CASE

WITH Ventas_Producto AS (
    SELECT
        p.Producto,
        ROUND(SUM(f.Cantidad * f.Precio_Venta_Unitario), 2) AS Venta_Total
    FROM fact_ventas AS f
    INNER JOIN dim_productos AS p ON f.ProductoID = p.ProductoID
    GROUP BY p.Producto
)
SELECT
    Producto,
    Venta_Total,
    CASE
        WHEN Venta_Total > 100000 THEN 'ALTO'
        WHEN Venta_Total > 30000 THEN 'MEDIO'
        ELSE 'BAJO'
    END AS Rendimiento
FROM Ventas_Producto
ORDER BY Venta_Total DESC;
