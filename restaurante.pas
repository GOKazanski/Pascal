{
Se desea almacenar la facturación ($) de los clientes de un restaurant de la ciudad.
Se pide:
" Realice un subprograma que cargue los datos en una estructura vector
" Además, se cuenta con un vector que contiene almacenado las notas de crédito. Se pide recorrer la estructura para ir actualizando en el vector original los montos de facturación.
" Calcule total vendido por el restaurant.
" Cantidad de ventas superiores a $200.000, verificar el porcentaje que representan sobre el total
   
}


program restaurante;
uses crt;

const
m=6;

type
t_vector=array [1..m] of real;
subrango=0..m;
pesos=real;

var
	facturas, notas:t_vector;
	limite:subrango;
	
procedure inicializar (var fact, nota:t_vector; var lim:subrango);
var J:subrango;
begin
    for j:=1 to m do
    begin 
		fact[j]:=0;
		nota[j]:=0;
    end;
    lim:=0;
end;

procedure cargar_facturas (var fact:t_vector; var lim:subrango);
var 
	aux:pesos;
begin
	writeln ('Ingrese la primera factura');
	readln (aux);
	while ((aux <>-1) and (lim<m))do
	begin
		inc(lim);
		fact[lim]:=aux;
		if lim < m then
		begin
			writeln ('Ingrese el monto');
			readln (aux);
		end;
	end;
end;

procedure cargar_notas (var nota:t_vector; var lim:subrango);
var 
	j:subrango;
begin
	
	for j:=1 to lim do
		begin
			writeln ('Ingrese la nota para el mes: ',j);
			readln (nota[j]);
		end;
end;

procedure descuento (var fact, nota:t_vector;  limite:subrango);
var J:subrango;
begin
	for j:=1 to m do
		begin 
			fact[j]:=fact[j]- nota[j];
		end;
end;

procedure listar (var fact:t_vector; limite:subrango);
var J:subrango;
begin
	for j:=1 to m do
		begin 
			writeln ('la factura final del mes: ',J, ' el importe es: ',fact[J]:2:2);
		end;
end;

BEGIN
inicializar(facturas,limite);
inicializar(notas,limite);
cargar_facturas (facturas,limite);
cargar_notas (notas,limite);
descuento(facturas,notas,limite);
listar (facturas,limite);
	
END.

