{
5. Se tiene una matriz de 150 filas y 12 columnas de celdas reales. 
Las filas representan 150 clientes y las columnas los 12 meses del año. 
Cada celda contiene el monto total facturado a cada cliente c/mes. 
Se pide: 
a- Mostrar el monto facturado al cliente 142 en el mes de Agosto.
b- Mostrar el Nº de cliente que registró el mayor monto de facturación mensual. 
c- Mostrar en que mes se registró la menor facturación mensual para un cliente

Tp en grupo

Burgos Gabriela
González Claudio
Kazanski Gabriel
Moran Joaquin
}
unit matrices_005;
interface         { Parte "pública", que se exporta }
uses crt;

Const
N=15; //N=150 numero de filas
M=12; //M=12 numero de columnas

Type
matriz = array [1..N, 1..M] of real;

Procedure Inicializar_matriz(Var Mat:matriz);
Procedure Cargar_matriz(Var Mat:matriz);
Procedure Mostrar(Mat:matriz);
Procedure MostrarClienteMes(Mat:matriz);
Procedure MayorVentaCliente(var Mat:matriz);
Procedure MenorVentaCliente(var Mat:matriz);
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
			aux:= random (100)+1;
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
			write(Mat[f,c]:2:2,'  ');
			writeln ();
	end;
END;

// Punto A
Procedure MostrarClienteMes(Mat:matriz);
Var
cliente,mes:integer;
Begin
repeat
	writeln ('Ingrese el numero de cliente');
	readln (cliente);
	if cliente<=N then
	begin
		writeln ('Ingrese el numero del mes');
		readln (mes);
		if mes<=M then
			writeln (Mat[cliente,mes]:2:2)
		else
			writeln ('Ingreso mal el mes');
	end
	else
		writeln ('Ingreso mal el numero de cliente');
until (cliente<=N) and (mes<=M);
END;

// Punto B
Procedure MayorVentaCliente (var Mat:matriz);
var 
f:1..N;
c:1..M;
v_mayor: real;
fila,columna:integer;
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
writeln ('El Cliente ',fila,' registro el mayor valor: $',v_mayor:2:2, ' en el mes ',columna);
end;

// Punto C
Procedure MenorVentaCliente(var Mat:matriz);
var 
f:1..N;
c:1..M;
v_menor:real;
fila,columna:integer;
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
writeln ('Se registro la menor venta en el mes ',columna,' fue de $ ',v_menor:2:2, ' y corresponde al cliente ',fila);
end;

Begin
randomize;
End.
