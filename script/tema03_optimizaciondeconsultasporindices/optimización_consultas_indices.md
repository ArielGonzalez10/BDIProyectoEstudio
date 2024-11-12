Optimización de consultas a traves indices :
El ejercicio de optimización de búsqueda mediante la creación y uso de índices en la tabla Huesped1 nos permitió observar y comparar
 el impacto de los índices en los tiempos de respuesta y en los planes de ejecución utilizados por el motor de la base de datos.

Carga Masiva de Datos: La carga masiva de un millón de registros en la tabla Huesped1 sin índices fue exitosa, 
y proporcionó una base de datos significativa para realizar las pruebas de optimización.

Consulta Sin Índices: La primera consulta de búsqueda por el rango de fechas 2002-01-01 a 2004-12-01 se ejecutó 
sin la presencia de índices. 
El plan de ejecución y los tiempos de respuesta registrados mostraron un rendimiento básico sin optimización.

Índice Agrupado: La creación de un índice agrupado (clustered index) sobre la columna fecha_nacimiento permitió mejorar 
significativamente el rendimiento de la consulta. 
Los tiempos de respuesta fueron más rápidos y el plan de ejecución mostró un uso eficiente del índice agrupado para acceder a los datos.

Índice No Agrupado con Columnas Incluidas: La definición de un índice no agrupado (non-clustered index) sobre 
la columna fecha_nacimiento con las columnas dni y nombre incluidas, permitió una optimización adicional. 
El plan de ejecución y los tiempos de respuesta indicaron que el uso de columnas incluidas puede ayudar a reducir 
la cantidad de acceso a datos necesarios para satisfacer la consulta.

En conclusión, el uso de índices, tanto agrupados como no agrupados con columnas incluidas, demostró ser una estrategia 
efectiva para mejorar el rendimiento de las consultas en la base de datos. 
Este ejercicio destaca la importancia de seleccionar y definir adecuadamente los índices para optimizar las operaciones de
búsqueda y acceso a los datos.