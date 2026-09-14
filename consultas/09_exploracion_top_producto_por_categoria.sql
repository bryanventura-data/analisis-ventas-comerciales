
-- Producto top en ventas dentro de cada categoría, usando RANK() con PARTITION BY

WITH Ventas_Producto_Categoria AS (
    SELECT
        p.Categoria,
        p.Producto,
        SUM(f.Cantidad * f.Precio_Venta_Unitario) AS Ventas
    FROM fact_ventas AS f
    INNER JOIN dim_productos AS p ON f.ProductoID = p.ProductoID
    GROUP BY p.Categoria, p.Producto
),
Ranking_Categoria AS (
    SELECT
        Categoria,
        Producto,
        ROUND(Ventas, 2) AS Ventas,
        RANK() OVER (PARTITION BY Categoria ORDER BY Ventas DESC) AS Ranking
    FROM Ventas_Producto_Categoria
)
SELECT Categoria, Producto, Ventas
FROM Ranking_Categoria
WHERE Ranking = 1
ORDER BY Ventas DESC;
