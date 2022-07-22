{ 
1. Leer un vector de 100 Números reales, un componente por vez. Emitir la sumatoria de sus componentes
}
program TP_007_Vec_001;
uses crt;

const N=5; 																// N=100; Constante para la cantidad de vectores

type
t_vector = array [1..n] of integer; 									// limita el conjunto del 1 a la constante
t_dato=integer;

var
v:t_vector;
res:t_dato;

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

procedure sumatoria(var vect:t_vector; var resultado:t_dato); 			// procedimiento para operar los vectores
var j:t_dato;
begin
     for j:=1 to n do
     resultado:=resultado+v[j];
end;

begin
inicializar(v); 														// llama al procedimiento inicializar
cargar(v); 																// llama al procedimiento cargar
sumatoria(v,res); 														// llama al procedimiento de operaciones
writeln('la sumatoria del vector es: ', res);
readkey;
end.
