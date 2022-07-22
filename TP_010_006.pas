{
6. Se tiene un listado con los siguientes datos: 
Número de alumno (1 a n ) , número de materia (1 a m ), nota ( 0 a 10 ).
o El listado no está ordenado, ni necesariamente completo. 
Esto último quiere decir que puede ser que un alumno no haya cursado una o más materias, 
y por lo tanto no existan los datos correspondientes en el listado.
Se pide:
a- Crear una estructura bidimensional que almacene el promedio por materia de cada
alumno e informarla asignándole en la impresión un guión al caso de falta de datos
mencionado.
b- Informar el porcentaje de alumnos que cursó cada materia y el promedio general por
materia considerando los alumnos que la cursaron.
c- Informar la cantidad de materias que cursó cada alumno y el promedio que
obtuvo considerando las materias que cursó.
}
program TP_010_006;

Uses matrices_006,crt;
Var
Ma:matriz;
total:integer;

begin
Inicializar_matriz(Ma);
Cargar_matriz (Ma);
Mostrar(Ma);
suma (Ma,total);
//mostrar2(Ma);
readkey;
end.
