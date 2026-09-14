-- Parte A: Margen % por categoría (gráfico de dona de la página Resumen, año más reciente con datos)

SELECT
    p.Categoria,
    ROUND(SUM(f.Cantidad * (f.Precio_Venta_Unitario - f.Costo_Unitario_Venta))
        / SUM(f.Cantidad * f.Precio_Venta_Unitario) * 100, 2) AS Margen_Porcentual
FROM fact_ventas AS f
INNER JOIN dim_productos AS p ON f.ProductoID = p.ProductoID
WHERE YEAR(f.Fecha) = (SELECT YEAR(MAX(Fecha)) FROM fact_ventas)
GROUP BY p.Categoria
ORDER BY Margen_Porcentual DESC;

-- Parte B: Top 5 productos por margen % usando RANK() (barras de la página Resumen, año más reciente con datos)
WITH Margen_Producto AS (
    SELECT
        p.Producto,
        ROUND(SUM(f.Cantidad * (f.Precio_Venta_Unitario - f.Costo_Unitario_Venta))
            / SUM(f.Cantidad * f.Precio_Venta_Unitario) * 100, 2) AS Margen_Porcentual
    FROM fact_ventas AS f
    INNER JOIN dim_productos AS p ON f.ProductoID = p.ProductoID
    WHERE YEAR(f.Fecha) = (SELECT YEAR(MAX(Fecha)) FROM fact_ventas)
    GROUP BY p.Producto
),
Ranking_Margen AS (
    SELECT
        Producto,
        Margen_Porcentual,
        RANK() OVER (ORDER BY Margen_Porcentual DESC) AS Ranking
    FROM Margen_Producto
)
SELECT Producto, Margen_Porcentual, Ranking
FROM Ranking_Margen
WHERE Ranking <= 5;
