# 📊 Análisis de Ventas Comerciales

Este proyecto nació de una pregunta simple: ¿qué tan bien está vendiendo la empresa, y dónde? Partiendo de datos transaccionales crudos, construí un modelo relacional en MySQL, escribí consultas SQL para validar y explorar el negocio, y armé un dashboard interactivo en Power BI que convierte esos números en decisiones.


## 🖥️ Dashboard Interactivo

Haz clic en la imagen para explorar el dashboard en tiempo real:

[![Ver Dashboard en Power BI](Portada.png)](https://app.powerbi.com/groups/me/reports/85e8fa49-6b95-47c2-a410-5106c65ba3b0/ReportSectionf314ab6f1d4de044eb30?experience=power-bi)

## 🎯 Objetivo del proyecto

Analizar el desempeño comercial de una empresa (ventas, ganancia, margen y comportamiento por región/producto) partiendo de datos transaccionales crudos, pasando por un modelo relacional en SQL hasta un dashboard interactivo que permite explorar tendencias y tomar decisiones.

## 🗂️ Modelo de datos

El proyecto sigue un esquema en estrella (star schema):

- **fact_ventas**: tabla de hechos con las transacciones (cantidad, precio, costo)
- **dim_productos**: catálogo de productos y categorías
- **dim_geografia**: regiones y zonas de venta
- **dim_tiempo**: dimensión de calendario

![Modelo relacional](Tablas_Relacionadas.png)

## 🧮 Consultas SQL

Además del modelado, este proyecto incluye consultas SQL con dos propósitos:

- **Validación**: reproducir KPIs clave del dashboard (ventas totales, margen %, top productos) directamente desde la base de datos, para confirmar que la lógica de negocio es consistente entre SQL y DAX.
- **Exploración adicional**: responder preguntas de negocio que el dashboard no cubre, usando CTEs, subconsultas correlacionadas y funciones de fecha/texto.

📌 El set completo de 10 consultas está disponible en la carpeta consultas/, organizadas por página del dashboard.

## 📈 KPIs principales (2026, último año con ventas)

| Métrica              | Valor       |
|-----------------------|-------------|
| Ventas totales         | S/ 557.28 mil |
| Ganancia               | S/ 207.24 mil |
| Margen %                | 37.19%      |
| Unidades vendidas       | 2,995       |

## 🔍 Hallazgos principales

- **Accesorios es la categoría más rentable y de mayor volumen**: con S/ 131.23 mil en ventas, genera el margen más alto (54.48%) y concentra 2,632 de las 2,995 unidades vendidas (~88% del total) — Mouse (56.85%) y Teclado (54.66%) tienen el mejor margen individual de todo el catálogo, y además son los productos más vendidos en unidades.
- **Tecnología genera más ingresos, pero con menor margen**: es la categoría líder en ventas (S/ 324.08 mil), aunque su margen (29.15%) es el más bajo de las tres — arrastrado por Laptop, que es el producto individual con más ventas (S/ 142.89 mil) pero el margen más bajo de todo el catálogo (25.85%).
- **Mobiliario depende de pocos productos de alto valor**: Silla representa el 94% de las ventas de su categoría (S/ 95.51 mil de S/ 101.96 mil) con solo 162 unidades, lo que indica un precio unitario alto frente al resto del catálogo.

## 💡 Recomendaciones

- **Revisar la estructura de costos de Laptop**: es el producto con más ingresos del catálogo (S/ 142.89 mil), pero su margen (25.85%) es el más bajo de todos los productos — está arrastrando el margen general de Tecnología por debajo del promedio. Vale la pena evaluar si hay espacio para renegociar costo unitario o ajustar precio sin perder competitividad.
- **Impulsar Webcam HD y Audífonos Bluetooth mediante cross-selling**: ambos tienen buen margen (50.00% y 47.00%) pero muy bajo volumen (38 y 79 unidades) frente a Mouse y Teclado, que venden más de 1,200 unidades cada uno. Ofrecerlos en combo con estos productos de alta rotación podría aumentar su visibilidad sin gasto adicional en adquisición.

## 🛠️ Tecnologías utilizadas

- **MySQL** — modelado relacional, carga de datos, consultas analíticas
- **Power BI** — modelo semántico (DAX), visualización interactiva
- **MySQL Workbench** — diseño del diagrama entidad-relación

## 🚀 Cómo explorarlo

1. Revisa el modelo relacional en `Tablas_Relacionadas.mwb`
2. Explora el modelado en `creacion_de_tablas.sql` y `llaves_foraneas.sql`, y las consultas de validación/exploración en la carpeta `consultas/`
3. Haz clic en la imagen del dashboard arriba para interactuar con el reporte en vivo

## 👤 Autor

**Bryan Ventura**  
[LinkedIn](https://www.linkedin.com/in/bryanventuravela/) · [GitHub](https://github.com/bryanventura-data)
