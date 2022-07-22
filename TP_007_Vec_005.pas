{
5. Leer un arreglo de 20 elementos de tipo carácter. Generar y emitir otro vector B tal que B[i] = A[i]
}
program TP_007_Vec_005;
uses crt;

const N=5; 																// Constante para la cantidad de vectores
	
type
	t_letra=char;
	t_vector=array [1..N] of t_letra;									// limita el conjunto del 1 a la constante
	subrango=0..N;

var
	vector,Auxcopia:t_vector;
	limite,ubicacion:subrango;
	letrabuscada:t_letra;
	
procedure inicializar(var vect:t_vector;var lim:subrango); 								// procedimiento para inicializar los vectores
var j:subrango;
begin
    lim:=0;
    for j:=1 to N do
    begin 
		vect[j]:=' ';
    end;
    
end;

procedure cargar (var vect:t_vector;var lim:subrango); 
var aux:t_letra;
begin
    writeln('ingrese una letra');
    readln(aux);
    while ((aux<>'') and (lim<N)) do
        begin
			inc(lim);
			vect[lim]:=aux;
			writeln('ingrese una letra');
			readln(aux);
		end;
end;

Procedure copiar(Var Vect, Aux:T_vector);							//Copia el Vector V en Aux (PARA ESTO LOS VECTORES DEBEN ESTAR DEFINIDOS EXACTAMENTE DEL MISMO TIPO)
var j:subrango;
Begin
For j:= 1 to N do
     AUX:=Vect;
End;

procedure listar1 (vect:t_vector);
var j:subrango;
begin
    for j:=1 to n do
    begin 
		writeln ('contenido del vector en la posicion es: ',j, ' es: ',vect[j]);
	end;
end;

procedure listar2 (Aux:t_vector);
var j:subrango;
begin
    for j:=1 to n do
    begin 
		write (aux[j]);
	end;
end;

procedure buscar (Var vect:T_vector; lim:subrango; buscado:t_vector; Var posc:subrango);
var j:subrango;
begin
	for j:=1 to lim do
		begin
			if vect[j]=buscado then
				posc:=j
		end;	
end;

BEGIN
ubicacion:=0;
inicializar(vector,limite); 	
cargar (vector,limite);
copiar (vector,auxcopia);
listar1 (vector);
listar2	(auxcopia);
readkey;
writeln ('ingrese una letra a buscar');
readln (letrabuscada);
buscar (vector, limite,letrabuscada,ubicacion);
writeln ('la letra a buscada: ',letrabuscada,' esta en la posicion: ',ubicacion);
readkey;
END.

