
USE DB_COMERCIAL
------------------ CREACIÓN e IMPORTACIÓN DE TABLA fact_ventas ---------------------

CREATE TABLE fact_ventas (
    TransaccionID VARCHAR(100) NOT NULL,
    Fecha DATETIME,
    ProductoID VARCHAR(100),
    RegionID VARCHAR(100),
    Cantidad INT,
    Precio_Venta_Unitario FLOAT,
    Costo_Unitario_Venta FLOAT,
    PRIMARY KEY (TransaccionID)
);

TRUNCATE TABLE fact_ventas;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fact_ventas.csv'
INTO TABLE fact_ventas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(TransaccionID, @fecha, ProductoID, RegionID, Cantidad, @precio, @costo)
SET
  Fecha = @fecha,
  Precio_Venta_Unitario = REPLACE(@precio, ',', '.'),
  Costo_Unitario_Venta = REPLACE(@costo, ',', '.');

------------------ CREACIÓN e IMPORTACIÓN DE TABLA Dim_Tiempo ---------------------

CREATE TABLE Dim_Tiempo (
    Fecha DATETIME NOT NULL,
    `Año` INT,
    `Mes Num` INT,
    `Mes Nombre` VARCHAR(50),
    Trimestre VARCHAR(50),
    `Dia Semana Num` INT,
    `Dia Nombre` VARCHAR(50),
    PRIMARY KEY (Fecha)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Dim_Tiempo.csv'
INTO TABLE Dim_Tiempo
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS

------------------ CREACIÓN e IMPORTACIÓN DE TABLA Dim_Productos ---------------------

CREATE TABLE Dim_Productos (
    ProductoID VARCHAR(100) NOT NULL,
    Producto VARCHAR(100),
    Categoria VARCHAR(100),
    Costo_Unitario FLOAT,
    Precio_Unitario_Sugerido FLOAT,
    PRIMARY KEY (ProductoID)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Dim_Productos.csv'
INTO TABLE Dim_Productos
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS


------------------ CREACIÓN e IMPORTACIÓN DE TABLA Dim_Geografia ---------------------

CREATE TABLE Dim_Geografia (
    RegionID VARCHAR(100) NOT NULL,
    Region VARCHAR(100),
    Departamento_Sede VARCHAR(100),
    Zona VARCHAR(100),
    PRIMARY KEY (RegionID)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Dim_Geografia.csv'
INTO TABLE Dim_Geografia
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
