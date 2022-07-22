{
1.	Realizar un procedimiento que permita insertar un elemento leído previamente por teclado, 
en una determinada posición X de un vector y realice un corrimiento de elementos hacia la derecha.
   
   
}

program TP_VectoresPlus_01;

uses crt;
var i : byte;
const n=10; 															// Constante para la cantidad de vectores

type
t_vector = array [1..n] of integer; 									// limita el conjunto del 1 a la constante
t_dato = integer;
t_prom = real;

var
v:t_vector;
par:t_prom;
imp:t_prom;

procedure inicializar(var vect:t_vector); 								// procedimiento para inicializar los vectores
var j:t_dato;
begin
     for j:=1 to n do
     vect[j]:=0;
end;

procedure cargar(var vect:t_vector); 									// procedimiento para ir cargando los vectores
var j:t_dato;
begin
     for j:=1 to n do
     begin
          writeln('ingrese un numero');
          readln(vect[j]);
     end;
end;

procedure insertar (var vect:t_vector; posic:t_dato);
var j:t_dato
begin
	for j:=1 to n do
	BEGIN
		writeln ('Ingrese la posición');
		readln (posic);
		if posic <= n then
		
	END
 if posic> n then
		


end



BEGIN
	inicializar(v); 													// llama al procedimiento inicializar
	cargar(v); 															// llama al procedimiento cargar
	insertar (pos)
	
	
	readkey;
	
END.

