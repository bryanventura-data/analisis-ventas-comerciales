
-- Valida la tabla "Detalle por Categoría y Producto" de la página Detalle Ventas (año más reciente con datos)

SELECT
    p.Categoria,
    p.Producto,
    ROUND(SUM(f.Cantidad * f.Precio_Venta_Unitario), 2) AS Ventas,
    ROUND(SUM(f.Cantidad * (f.Precio_Venta_Unitario - f.Costo_Unitario_Venta)), 2) AS Ganancia,
    ROUND(SUM(f.Cantidad * (f.Precio_Venta_Unitario - f.Costo_Unitario_Venta))
        / SUM(f.Cantidad * f.Precio_Venta_Unitario) * 100, 2) AS Margen_Porcentual,
    SUM(f.Cantidad) AS Unidades_Vendidas
FROM fact_ventas AS f
INNER JOIN dim_productos AS p ON f.ProductoID = p.ProductoID
WHERE YEAR(f.Fecha) = (SELECT YEAR(MAX(Fecha)) FROM fact_ventas)
GROUP BY p.Categoria, p.Producto
ORDER BY p.Categoria, Ventas DESC;
