# 📊 Análisis de Ventas Comerciales

Proyecto de análisis de ventas end-to-end: modelado de datos con **MySQL**, consultas SQL para exploración y validación, y un **dashboard interactivo en Power BI** para el seguimiento de KPIs comerciales.

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
