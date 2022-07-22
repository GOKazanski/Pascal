{
7. Leer un vector de N elementos. Emitir el valor mínimo y la cantidad de veces que se repitió ese valor
}
program TP_007_Vec_007;
uses crt;

const N=10; 															// Constante para la cantidad de vectores

type
t_vector = array [1..n] of integer; 									// limita el conjunto del 1 a la constante
t_dato = integer;

var
v:t_vector;
men:t_dato;
cant:t_dato;

procedure inicializar(var vect:t_vector); 								// procedimiento para inicializar los vectores
var j:t_dato;
begin
     for j:=1 to n do
     vect[j]:=0;
end;

procedure cargar(var vect:t_vector;var menor,cantidad:t_dato); 			// procedimiento para ir cargando los vectores
var 
j:t_dato;
aux :t_dato;
begin
	writeln('ingrese el numero ');
    readln(aux);
    menor:=aux;
    for j:=2 to n do
		begin
          writeln('ingrese un numero');
          readln(aux);
			if aux<menor then
				begin
					menor:=aux;
					cantidad:=1
				end
			else 
				if aux=menor then
					cantidad:=cantidad+1
		end;
end;

begin
inicializar(v); 														// llama al procedimiento inicializar
cargar(v,men,cant); 													// llama al procedimiento cargar
writeln('el numero menor es: ', men);
writeln ('las veces que se cargo: ',cant);
readkey;
end.
