            Procedimientos almacenados (Stored Procedures):
Son conjuntos de instrucciones T-SQL predefinidos que se almacenan y ejecutan en el servidor de base de datos. Están diseñados para realizar una serie de operaciones de base de datos, como consultas, modificaciones o manipulaciones de datos, sin necesidad de que el cliente envíe varias consultas de manera explícita.

    Creación y Gestión de Procedimientos Almacenados
Crear Procedimiento: (CREATE PROCEDURE) Los procedimientos pueden aceptar parámetros de entrada y salida.
Modificar Procedimiento: (ALTER PROCEDURE) se utiliza para modificar un procedimiento existente.
Eliminar Procedimiento: (DROP PROCEDURE) se puede eliminar un procedimiento almacenado.

    Características Clave de los Procedimientos Almacenados
Operaciones CRUD: Los procedimientos almacenados pueden ejecutar instrucciones de INSERT, UPDATE, DELETE y SELECT sobre las tablas.
Manejo de Transacciones: Los procedimientos almacenados pueden incluir transacciones mediante BEGIN TRANSACTION, COMMIT y ROLLBACK, lo que permite controlar la consistencia de las operaciones de múltiples tablas.
Llamadas a Otros Procedimientos: Es posible invocar otros procedimientos dentro de un procedimiento almacenado, lo que mejora la modularidad y reutilización del código.
Valor de Estado: Los procedimientos pueden devolver un código de estado o un mensaje de error para indicar si la operación fue exitosa o si hubo fallos.

    Tipos de Procedimientos Almacenados:
Definidos por el Usuario: Creación personalizada por los usuarios. Pueden ser locales o globales.
Temporales: Existentes solo durante la sesión. Se almacenan en tempdb y pueden ser locales o globales.
Procedimientos del Sistema: Procedimientos predefinidos en SQL Server para tareas administrativas, como mantenimiento o programación de trabajos.

    Ventajas de Usar Procedimientos Almacenados
Reducción del Tráfico de Red: Al ejecutar las instrucciones directamente en el servidor, se reduce el número de rondas de comunicación entre el cliente-servidor.
Seguridad Mejorada: Los procedimientos almacenados permiten controlar el acceso a los datos, limitando las operaciones que un usuario puede realizar, y evitando que los usuarios ejecuten directamente consultas.
Mejor Rendimiento: Mejoran el rendimiento porque las consultas complejas se procesan en el servidor, evitando la sobrecarga de red.


            Funciones almacenadas (Stored Functions):
Son bloques de código que devuelven un valor único o un conjunto de valores. Son útiles para realizar cálculos o evaluaciones dentro de consultas SQL.

    Características Clave de las Funciones Almacenadas
Valor de Retorno: Las funciones siempre devuelven un valor, que puede ser un valor escalar o una tabla.
No Modifican Datos: Las funciones no pueden modificar los datos directamente. No pueden realizar operaciones INSERT, UPDATE ni DELETE.
Uso en Consultas: Las funciones se utilizan dentro de las consultas para realizar cálculos o para evaluar condiciones lógicas.

    Tipos de Funciones Almacenadas:
Funciones Escalares: Devuelven un solo valor.
Funciones de Tabla: Devuelven una tabla que puede ser usada dentro de la consulta SQL como una tabla derivada.