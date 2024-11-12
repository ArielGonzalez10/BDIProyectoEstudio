Vistas:
Una vista es una consulta guardada en la base de datos que se puede tratar como una tabla virtual. Las vistas permiten 
abstraer y simplificar las consultas complejas, proporcionando una interfaz lógica para acceder a los datos. Se utilizan 
comúnmente para mostrar datos de múltiples tablas, ocultar la complejidad de las operaciones de base de datos, y garantizar 
la seguridad al limitar el acceso a ciertas columnas o filas de una tabla.

Vistas Indexadas:
Las vistas indexadas son vistas a las que se les ha creado un índice físico, lo que permite mejorar el rendimiento de las 
consultas que acceden frecuentemente a ellas. A diferencia de las vistas normales, las vistas indexadas almacenan datos 
en disco, lo que las convierte en una forma de materialización de consultas, optimizando la ejecución de consultas 
complejas al reducir el tiempo de respuesta.

Impacto en el Rendimiento:
Las vistas indexadas pueden mejorar significativamente el rendimiento de las consultas, especialmente cuando se accede a 
grandes volúmenes de datos o cuando las consultas involucran operaciones complejas, como agregaciones o uniones de múltiples 
tablas. Al tener los resultados precalculados y almacenados en el índice, SQL Server puede acceder a los datos de manera más 
eficiente. Sin embargo, el mantenimiento de los índices requiere recursos adicionales, ya que cada vez que los datos subyacentes 
cambian, el índice debe ser actualizado.

Consideraciones sobre el Uso de Vistas y Vistas Indexadas:

Vistas: Son útiles cuando se desea ofrecer una vista simplificada de los datos a los usuarios o aplicaciones, sin necesidad de 
reescribir consultas complejas constantemente. No almacenan datos y se recalculan cada vez que se consultan.

Vistas Indexadas: Son apropiadas cuando la consulta sobre la vista es frecuente y los datos subyacentes no cambian con alta 
frecuencia. Aportan mejoras en el rendimiento, pero el costo de mantenimiento del índice debe ser evaluado en función de la carga 
de trabajo y el patrón de actualización de los datos.