{
6. Leer un vector de N elementos y emitir la posición que ocupa el mayor de ellos. 
}
program TP_007_Vec_006;
uses crt;

const N=10; 															// Constante para la cantidad de vectores

type
t_vector = array [1..n] of integer; 									// limita el conjunto del 1 a la constante
t_dato = integer;

var
v:t_vector;
lim, may, pos:t_dato;

procedure inicializar(var vect:t_vector; var limite:t_dato); 			// procedimiento para inicializar los vectores
var j:t_dato;
begin
    for j:=1 to n do
    begin 
		vect[j]:=0;
    end;
    lim:=0;
end;

{procedure cargar(var vect:t_vector;var posicion:t_dato); 				// procedimiento para ir cargando los vectores
var 
j:t_dato;
aux :t_dato;
mayor:t_dato;
begin
	writeln('ingrese el numero ');
    readln(aux);
    mayor:=aux;
    posicion:=1;
     for j:=2 to n do
     begin
          writeln('ingrese un numero');
          readln(aux);
          if aux>mayor then
          begin
          mayor:=aux;
          posicion:=j
          end;
     end;
end;
}
procedure cargar (var vect:t_vector; var limite:t_dato); 
var aux:t_dato;
begin
	writeln('ingrese un numero ');
	readln(aux);
	while (aux<>0) and (limite<n) do
		begin
			inc(limite);
			vect [limite]:=aux;
			writeln('ingrese otro numero');
			readln(aux);
		end;
end;

procedure mayor (var vect:t_vector;limite:t_dato;var Posicion:t_dato;var mayor:t_dato);
var j:t_dato;
begin
	mayor:=vect[1];
	posicion:=1;
	for j:=2 to limite do
		begin 
			if (vect[j])> mayor then
				begin
					mayor:= vect[j];
					posicion:=j
				end
		end;
end;

begin
may:=0;
inicializar(v,lim); 														// llama al procedimiento inicializar
cargar(v,lim);
mayor (v,lim,pos,may); 													// llama al procedimiento cargar
writeln('la posicion del mayor es: ', pos, ' y es al: ', may);
readkey;
end.
