{
 3. Leer un vector de N elementos, de a uno por vez. Generar y emitir la sumatoria de sus componentes de posición par.
}
program TP_007_Vec_003;
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

procedure sumar_pares(var vect:t_vector; limite:t_dato; var resultado:t_dato);// procedimiento para operar los vectores
var j:t_dato;
begin
     resultado:=0;
     for j:=1 to limite do
     begin
          if (j mod 2)=0 then
          resultado:=resultado+vect[j];
     end;
end;

begin
inicializar(v,lim);  													// llama al procedimiento inicializar
cargar(v,lim);															// llama al procedimiento cargar
sumar_pares(v,lim,res);													// llama al procedimiento de operaciones
writeln('la suma de los numeros de posicion par es: ', res);
readkey;
end.
