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

- **Laptops lidera en ventas, pero no en margen**: es el producto con mayores ingresos (S/ 142.89 mil), aunque su margen (25.85%) está por debajo del promedio general (37.19%).
- **Accesorios es la categoría más rentable**: con solo S/ 131.23 mil en ventas (la más baja de las tres categorías), genera el margen más alto (54.48%) — el Mouse y el Teclado superan el 56% y 54% de margen respectivamente.
- **Tecnología concentra el mayor volumen de ventas** (S/ 324.08 mil), pero su margen (29.15%) es el más bajo entre las tres categorías, arrastrado por productos de alto precio como Laptop y Laptop Gamer.
- **Oportunidad**: los productos con mejor margen (Mouse, Teclado, Webcam HD) tienen relativamente pocas unidades vendidas comparado con su rentabilidad — podría valer la pena evaluar estrategias para impulsar su volumen.

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
