
-- Transacciones con ganancia mayor al promedio general (subconsulta escalar)

SELECT
    f.TransaccionID,
    p.Producto,
    ROUND(f.Cantidad * (f.Precio_Venta_Unitario - f.Costo_Unitario_Venta), 2) AS Ganancia
FROM fact_ventas AS f
INNER JOIN dim_productos AS p ON f.ProductoID = p.ProductoID
WHERE (f.Cantidad * (f.Precio_Venta_Unitario - f.Costo_Unitario_Venta)) > (
    SELECT AVG(Cantidad * (Precio_Venta_Unitario - Costo_Unitario_Venta))
    FROM fact_ventas
)
ORDER BY Ganancia DESC;
