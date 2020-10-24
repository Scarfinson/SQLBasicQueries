USER HR;
CLEAR SCREEN;

/*Escribir una consulta que despliegue la fecha del sistema (SYSDATE), etiquetar la columna con el nombre “Date”.*/
SELECT (SYSDATE) AS "DATE" FROM DUAL;
 
/*Escribir una consulta que despliegue el nombre del departamento en minúsculas, de la tabla DEPARTMENTS.*/
SELECT LOWER(DEPARTMENT_NAME) AS "DEPARTAMENTOS" FROM DEPARTMENTS;

/*Escribir una consulta que despliegue solo la primera letra de cada palabra en mayúsculas, del campo nombre del país (COUNTRY_NAME) de la tabla COUNTRIES.*/
SELECT UPPER (SUBSTR (COUNTRY_NAME, 1, 1)) AS "PRIMERA LETRA", (UPPER(COUNTRY_NAME)) AS "NOMBRE COMPLETO" FROM COUNTRIES;
 
/*Dada la función MONTHS_BETWEEN, obtener su edad.*/
SELECT ROUND (MONTHS_BETWEEN (SYSDATE, TO_DATE('27-03-2000','DD-MM-YYYY'))/12) AS "EDAD" FROM DUAL;

/*A partir de la tabla EMPLOYEES, obtener la fecha de alta formateada, de manera que aparezca, el nombre del mes con todas sus letras (MONTH), el número del día del mes (DD) y el año (YYYY).*/
SELECT CONCAT (CONCAT (FIRST_NAME, ' '), LAST_NAME) AS "NOMBRE COMPLETO", TO_CHAR (HIRE_DATE, 'FMMONTH DD, YYYY') AS "FECHA DE CONTRATO" FROM EMPLOYEES;
 
/*Encontrar el salario más alto, más bajo, la suma de los salarios y el salario promedio de todos los empleados. Etiqueta las columnas como “Máximo” “Mínimo” “Suma” “Promedio”. Se deben redondear los resultados.*/
SELECT MAX(SALARY) AS "MAXIMO", MIN(SALARY) AS "MINIMO", SUM(SALARY) AS "SUMA", ROUND(AVG(SALARY)) AS "PROMEDIO" FROM EMPLOYEES;
 
/*El departamento RH necesita el siguiente reporte: Conocer el número de empleados con el mismo nombre.*/
SELECT FIRST_NAME AS "NOMBRE", COUNT (*) AS "VECES QUE SE REPITE" FROM EMPLOYEES GROUP BY FIRST_NAME;
 
/*Muestra el identificador del gerente y el salario del empleado más bajo pagado por ese gerente. Excluir cualquier registro donde el gerente no se conoce, excluir grupo en el que el salario mínimo sea menor de $6,000. Ordenar la salida con el salario descendente.*/
SELECT MANAGER_ID AS "NUMERO DEL GERENTE", MIN(SALARY) AS "SALARIO MAS BAJO PAGADO" FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL AND SALARY > 6000 GROUP BY MANAGER_ID ORDER BY 2 DESC;
 
/*Observar la estructura de la tabla DEPARTMENTS y seleccionar todos los datos de la tabla.*/
SELECT * FROM DEPARTMENTS;

/*Crear una consulta para mostrar LAST_NAME, JOB_ID, HIRE_DATE y EMPLOYEE_ID para cada empleado, con el número del empleado que aparezca primero.*/
SELECT EMPLOYEE_ID AS "IDENTIFICADOR", LAST_NAME AS "APELLIDO", JOB_ID AS "IDENTIFICADOR DE TRABAJO", HIRE_DATE AS "FECHA DE CONTRATO" FROM EMPLOYEES;
 
/*Crear una consulta para mostrar los únicos JOB_ID de la tabla EMPLOYEES.*/
SELECT DISTINCT(JOB_ID) AS "UNICOS IDENTIFICADORES" FROM EMPLOYEES;
 
/*Mostrar el LAST_NAME concatenado con JOB_ID, separado por una coma y un espacio, y nombrar la columna como “EMPLOYEE Y TITLE”.*/
SELECT CONCAT (CONCAT(LAST_NAME,', '), JOB_ID) AS "EMPLOYEE AND TITLE" FROM EMPLOYEES;
 
/*The HR department wants a query to display the LAST_NAME, JOB_ID, HIRE_DATE, and EMPLOYEE_ID for each employee, with employee number appearing first. Provide an alias STARTDATE for the HIRE_DATE column.*/
SELECT EMPLOYEE_ID AS "EMPLOYEE ID", LAST_NAME AS "LAST NAME", JOB_ID AS "JOB ID", HIRE_DATE AS "START DATE" FROM EMPLOYEES;
 
/*Crear una consulta para mostrar el apellido y el salario de los empleados que ganan más de $ 12.000.*/
SELECT LAST_NAME AS "APELLIDO", SALARY AS "SALARIO MAYOR A 12000" FROM EMPLOYEES WHERE SALARY > 12000;
 
/*Crear una consulta para mostrar el apellido del empleado y número de departamento para el empleado con número 176.*/
SELECT LAST_NAME AS "APELLIDO", DEPARTMENT_ID AS "IDENTIFICADOR DEL DEPARTAMENTO" FROM EMPLOYEES WHERE EMPLOYEE_ID = 176;
 
/*Mostrar el apellido y el salario de todos los empleados cuyo salario no está en el rango de $ 5.000 y $ 12.000.*/
SELECT LAST_NAME AS "APELLIDO", SALARY AS "SALARIO FUERA DEL RANGO" FROM EMPLOYEES WHERE SALARY < 5000 OR SALARY > 12000;
 
/*Mostrar el apellido del empleado, JOB_ID, y HIRE_DATE de los empleados contratados entre el 20 de febrero de 2001, y el 1 de mayo de 2005.*/
SELECT LAST_NAME AS "APELLIDO", JOB_ID AS "IDENTIFICADOR DE TRABAJO", TO_CHAR(HIRE_DATE, 'FMMONTH DD, YYYY' ) AS "FECHA DE CONTRATO" FROM EMPLOYEES WHERE HIRE_DATE >= TO_DATE('20-02-01','DD-MM-YY') AND HIRE_DATE <= TO_DATE('01-05-05','DD-MM-YY');
 
/*Crear un informe para mostrar el apellido del empleado y cargo de todos los empleados que no tienen un gerente.*/
SELECT EMPLOYEES.LAST_NAME AS "APELLIDO", JOBS.JOB_TITLE AS "CARGO" FROM EMPLOYEES INNER JOIN JOBS ON EMPLOYEES.JOB_ID = JOBS.JOB_ID WHERE EMPLOYEES.MANAGER_ID IS NULL;
 

