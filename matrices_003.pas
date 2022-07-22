{
3. Dada una matriz de 5 filas y 10 columnas: 
A- Escribir el algoritmo necesario para cargar la matriz con valores. 
B- Determinar la sumatoria de c/u de las columnas.
C- Mostrar el mayor valor de c/u de sus columnas. 
D- Mostrar la posición (F,C) del menor valor de la matriz
}
unit matrices_003;
interface         { Parte "pública", que se exporta }
uses crt;

Const
N=3; //N=5 numero de filas
M=4; //M=10 numero de columnas

Type
matriz = array [1..N, 1..M] of integer;

Procedure Inicializar_matriz (Var Mat:matriz);
Procedure Cargar_matriz (Var Mat:matriz);
Procedure Mostrar(Mat:matriz);
Procedure TotalColumna (var Mat:matriz);
procedure Mayor_columna(var Mat:matriz);
procedure Menor(var Mat:matriz);

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

//Punto A
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
			//readln (aux);
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

// Punto B
procedure TotalColumna (var Mat:matriz);
var
f:1..N;
c:1..M;
acu:real;
begin
	for c:=1 to M do
		begin
			acu:=0;
			for f:=1 to N do
				begin
					acu:=acu+Mat[f,c];
				end;
			writeln ('El total de la Columna ',c,' es de ',acu:2:2);	
		end;
end;

// Punto C
procedure Mayor_columna(var Mat:matriz);
var 
f:1..N;
c:1..M;
max:integer;
begin
max:=0;
	for c:=1 to M do
		begin
			max:=0;
			for f:=1 to N do
				begin
					if Mat[f,c]>max then
					max:=Mat[f,c];
				end;
			writeln('El mayor de la columna ',c,' es: ',max);  
		end;    
end;

//Punto D
procedure Menor(var Mat:matriz);
var 
f:1..N;
c:1..M;
v_menor,fila,columna:integer;
begin
v_menor:=Mat[1,1];
	for f:=1 to N do
		for c:=1 to M do
			begin
				if Mat[f,c] < v_menor then 
					begin
						v_menor:=Mat[f,c];
						fila:=f;
						columna:=c;
					end;
			end; 
writeln ('El menor valor es ',v_menor, ' y esta el la fila ',fila,' y en la columna ',columna);
end;

Begin
randomize;
End.
