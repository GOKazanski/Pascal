{
2. Sea un lote de Números enteros positivos que finaliza con un cero que no debe ser procesado.
Generar un vector con dichos valores y calcular la productoria de sus componentes
}
program TP_007_Vec_002;
uses crt;

const n=10; 															// Constante para la cantidad de vectores

type
t_vector=array [1..n] of integer;										// limita el conjunto del 1 a la constante
t_dato=integer;

var
v:t_vector;
lim, res:t_dato;

procedure inicializar(var vect:t_vector; var limite:t_dato);			// procedimiento para inicializar los vectores
var j:t_dato;
begin
    for j:=1 to n do
    vect[j]:=0;
    limite:=0;
end;

procedure cargar (var vect:t_vector; var limite:t_dato);				// procedimiento para ir cargando los vectores
var aux:t_dato;
begin
    writeln('ingrese un numero');
    readln(aux);
    while (aux<>0) and (limite<n) do									// frena el procedimiento y guarda hasta el limite
	begin
		inc(limite);
		vect[limite]:=aux;
		writeln('ingrese un numero');
		readln(aux);
	end;
end;

procedure productos(var vect:t_vector; limite:t_dato; var resultado:t_dato);// procedimiento para operar los vectores
var j:t_dato;
begin
    resultado:=1;
    for j:=1 to limite do
    begin
		resultado:=resultado*vect[j];
    end;
end;

BEGIN
inicializar(v,lim);  													// llama al procedimiento inicializar
cargar(v,lim);															// llama al procedimiento cargar	
productos(v,lim,res);													// llama al procedimiento de operaciones
writeln('El producto de los numeros es: ', res);
readkey;	
END.

