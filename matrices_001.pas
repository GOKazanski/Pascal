{
Calcular el promedio de notas de una lista de veinticinco alumnos de la carrera Licenciatura en
Sistemas de Información con notas en ocho materias.
}
unit matrices_001;
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
