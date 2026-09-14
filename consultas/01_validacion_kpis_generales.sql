
-- Valida las 4 KPI cards de la página Resumen (año más reciente con datos)

SELECT
    CONCAT('S/ ', FORMAT(SUM(Cantidad * Precio_Venta_Unitario), 2)) AS Ventas_Totales,
    CONCAT('S/ ', FORMAT(SUM(Cantidad * (Precio_Venta_Unitario - Costo_Unitario_Venta)), 2)) AS Ganancia_Total,
    CONCAT(ROUND(SUM(Cantidad * (Precio_Venta_Unitario - Costo_Unitario_Venta))
        / SUM(Cantidad * Precio_Venta_Unitario) * 100, 2), ' %') AS Margen_Porcentual,
    SUM(Cantidad) AS Unidades_Vendidas
FROM fact_ventas
WHERE YEAR(Fecha) = (SELECT YEAR(MAX(Fecha)) FROM fact_ventas);
