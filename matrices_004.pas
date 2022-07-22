{
4. Dada una matriz rectangular realizar un programa que devuelva el mayor de los elementos
contenidos en ella, considerando solamente aquellos en los cuales la suma de sus subíndices
es par. 
Es decir [1,1], [1,3], [1,5] [2,2], etc.

Tp en grupo

Burgos Gabriela
González Claudio
Kazanski Gabriel
Moran Joaquin
}
unit matrices_004;
interface         { Parte "pública", que se exporta }
uses crt;

Const
N=4; // numero de filas
M=6; // numero de columnas

Type
matriz = array [1..N, 1..M] of integer;

Procedure Inicializar_matriz (Var Mat:matriz);
Procedure Cargar_matriz (Var Mat:matriz);
Procedure Mostrar(Mat:matriz);
procedure Mayor(var Mat:matriz);
procedure Pares (var Mat:matriz);

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

procedure Mayor(var Mat:matriz);
var 
f:1..N;
c:1..M;
v_mayor,fila,columna:integer;
begin
v_mayor:=Mat[1,1];
	for f:=1 to N do
		for c:=1 to M do
			begin
				if Mat[f,c] > v_mayor then 
					begin
						v_mayor:=Mat[f,c];
						fila:=f;
						columna:=c;
					end;
			end; 
writeln ('El mayor valor es ',v_mayor, ' y esta el la fila ',fila,' y en la columna ',columna);
end;

procedure Pares (var Mat:matriz);
var
f:1..N;
c:1..M;
Begin
	for f:=1 to N do
		begin
			for c:=1 to M do
				begin
					if (f+c)mod 2=0 then
						write('[',f,',',c,'] es ',Mat[f,c],' ');
				end;
		end;
END;

Begin
randomize;
End.
