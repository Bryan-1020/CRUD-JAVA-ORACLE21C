++ Este nos permite ver la ruta de los datafiles de la sesion iniciada+++++++++++++++++++++++

select TABLESPACE_NAME, FILE_NAME, BYTES/1024/1024 TAMANOMB
       FROM DBA_data_FILES D
       where TABLESPACE_NAME='SYSTEM';
       
  +++ Primero creamos un tablespace de 20G y se extiende a 35 G si se sobrepasa ese limite++++++++++++++++     
CREATE TABLESPACE desarrollos
DATAFILE 'C:\APP\AMAYA\ORADATA\PRODUCCION\DESARROLLOS.DBF' SIZE 20G
AUTOEXTEND ON NEXT 35G;
++++++++++Creamos el usuario y le asignamos el tablespace creado++++++++++++++
CREATE USER desarrollo
IDENTIFIED BY Passw0rd
DEFAULT TABLESPACE desarrollos
TEMPORARY TABLESPACE TEMP;
++++++Le asignamos un limite al usuario++++++++++++++++++++++++++++++++
ALTER USER desarrollo QUOTA UNLIMITED ON desarrollos;
++++++++++++++Lea asignamos el privilegio de crear Tablas+++++++++++++++++++++++++
GRANT CREATE TABLE TO desarrollo;
++++++++++++Lee damos el privilegio de conexion y permisos al usuario+++++++++++++
GRANT CONNECT, RESOURCE TO desarrollo;

++++++ Este escript lo debes correr si no te deja crear tu usuario++++++++++++++++++
alter session set "_ORACLE_SCRIPT"=true;

++++++++++++++++++++++++++Insertamos datos ala tablaa como prueba++++++++++++
insert into prod values (1,'Bryan');
insert into prod values (2,'Sarai');

+++++++++++++++++++hacemos un commit para confitmar las transacciones realizadas en la base++++++++++
commit;

+++++++++++++++++++++++++++++verificamos que nuestros registros este ya almacenados+++++++++++++++++
select * from prod;

++++++++++++++++++++++++++++++++++++++Si te jala el python con la data hiciste todo bien y si no llora jaja +++++++++++++++++++
Fiiiiiiiiiiiiiiiinnnnnnnnnnnnnnnnnnnnnn
