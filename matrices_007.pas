{
7. Sumar los elementos que están por encima de la diagonal principal de una matriz dada
}
unit matrices_007;
 interface         { Parte "pública", que se exporta }
 uses crt;

Const
N=5;
M=5;

Type
matriz=array[1..N,1..M]of integer;
t_vector= array [1..N] of integer;

Procedure Inicializar_matriz (Var Mat:matriz);
Procedure Cargar_matriz (Var Mat:matriz);
Procedure Mostrar(Mat:matriz);
procedure suma (var Mat:matriz; var notas:integer );
//procedure promedio (var Mat:matriz);
//Procedure Mostrar2(Mat:matriz);
var 
notas:integer;

IMPLEMENTATION

Procedure Inicializar_matriz(Var Mat:matriz);
Var
f:1..N;
c:1..M;
Begin
	for f:=1 to N do
	for C:=1 to M do
		Mat[f,c]:=0;
end;

Procedure Cargar_matriz (Var Mat:matriz);
Var
f:1..N;
c:1..M;
aux:integer;

Begin
for f:=1 to N do
for C:=1 to M do
	begin
		aux:= random (10)+1;
		//writeln('ingrese un valor para fila: ',f );
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
		for C:=1 to M do
			write(Mat[f,c],' ');
			writeln(**);
	end;
end;

Procedure Mostrar2(Mat:matriz);
Var
f:1..N;
c:1..M;
Begin
	for f:=1 to N do
		begin
			for C:=1 to M do
				if f=c then
				writeln(Mat[f,c],' ');
 end;
 END;

procedure suma (var Mat:matriz; var notas:integer );
var
f:1..N;
c:1..M;
aux:integer;

begin 

for f:=1 to N do
aux:=0;
	begin
		for c:=1 to M do
			begin
				if f<c
				aux:=(aux+ mat[f,c]);
				Writeln ( aux);
				readkey;
			end;
	end;
end;

Begin
randomize;
End.
