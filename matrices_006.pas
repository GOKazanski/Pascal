{
6. Se tiene un listado con los siguientes datos: 
Número de alumno (1 a n ) , número de materia (1a m ), nota ( 0 a 10 ).
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
unit matrices_006;
interface         { Parte "pública", que se exporta }
uses crt;

Const
N=5; //N=25 numero de filas
M=4; //M=8 numero de columnas

Type
matriz = array [1..N, 1..M] of integer;

Procedure Inicializar_matriz (Var Mat:matriz);
Procedure Cargar_matriz (Var Mat:matriz);
Procedure Mostrar(Mat:matriz);
procedure MostrarPromedio (var Mat:matriz );

IMPLEMENTATION

Procedure Inicializar_matriz(Var Mat:matriz);
Var
f:1..N;
c:1..M;
Begin
	for f:=1 to N do
		for c:=1 to M do
			Mat[f,c]:=0;
End;

Procedure Cargar_matriz (Var Mat:matriz);
Var
f:1..N;
c:1..M;
aux:integer;
 
Begin
for f:=1 to N do
	for c:=1 to M do
		begin
			aux:= random (10)+1;
			//writeln('ingrese un valor para fila ',f,' y la coluna ',c );
			Mat[f,c]:=aux;
		end;
End;

Procedure Mostrar(Mat:matriz);
Var
f:1..N;
c:1..M;
Begin
	for f:=1 to N do
	begin
		for c:=1 to M do
			write(Mat[f,c],' ');
			writeln ();
	end;
END;

procedure MostrarPromedio (var Mat:matriz);
var
f:1..N;
c:1..M;
acu:integer;
begin
	for f:=1 to N do
		begin
			acu:=0;
			for c:=1 to M do
				begin
					acu:=acu+Mat[f,c];
				end;
			writeln ('El promedio de la fila ',f,' es ',acu/c:2:2);	
		end;
end;

Begin
randomize;
End.
