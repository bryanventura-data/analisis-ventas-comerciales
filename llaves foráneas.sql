
ALTER TABLE fact_ventas
ADD CONSTRAINT fk_region
FOREIGN KEY (RegionID) REFERENCES dim_geografia(RegionID);

ALTER TABLE fact_ventas
ADD CONSTRAINT fk_productos
FOREIGN KEY (ProductoID) REFERENCES dim_productos(ProductoID);

ALTER TABLE fact_ventas
ADD CONSTRAINT fk_region
FOREIGN KEY (RegionID) REFERENCES dim_geografia(RegionID);

ALTER TABLE fact_ventas
ADD CONSTRAINT fk_fecha
FOREIGN KEY (Fecha) REFERENCES dim_tiempo(Fecha);


