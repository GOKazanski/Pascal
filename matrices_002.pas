{
2. Una empresa con 20 sucursales que vende distintos tipos de artículos (30). Se desea acumular
cantidad de ventas por sucursal y por artículo.
}
unit matrices_002;
interface         { Parte "pública", que se exporta }
uses crt;

Const
N=5; //N=20 numero de filas
M=4; //M=30 numero de columnas

Type
matriz = array [1..N, 1..M] of real;

Procedure Inicializar_matriz (Var Mat:matriz);
Procedure Cargar_matriz (Var Mat:matriz);
Procedure Mostrar(Mat:matriz);
procedure TotalSucusal (var Mat:matriz);
procedure TotalProdunto (var Mat:matriz);

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
aux:real;
 
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
			write(Mat[f,c]:2:2,' ');
			writeln ();
	end;
END;

procedure TotalSucusal (var Mat:matriz);
var
f:1..N;
c:1..M;
acu:real;
begin
	for f:=1 to N do
		begin
			acu:=0;
			for c:=1 to M do
				begin
					acu:=acu+Mat[f,c];
				end;
			writeln ('La suma de la Sucursal ',f,' es de $ ',acu:2:2);
		end;
end;

procedure TotalProdunto (var Mat:matriz);
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
			writeln ('La suma de los Productos ',c,' es de $ ',acu:2:2);	
		end;
end;

Begin
randomize;
End.
