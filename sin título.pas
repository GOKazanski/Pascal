program ej;
uses crt;
const n=5;
type
t_vector=array [1..n] of string;
t_dato=integer;
t_dato1=string;
var
vector:t_vector;
limite:t_dato;
posicion:t_dato;
nombre:t_dato1;

procedure inicializar(var v:t_vector; var lim:t_dato);
var i:t_dato;
begin
lim:=0;
for i:=1 to n do
v[i]:='';
end;

procedure cargar(var v:t_vector; var lim:t_dato);
var aux:t_dato1;
begin
writeln('ingrese nombre');
readln(aux);
while (aux<>'') and (lim<n) do
   begin
		inc(lim);
		v[lim]:=aux;
		writeln('ingrese siguiente nombre');
		readln(aux);
   end;
end;
procedure buscar(var v:t_vector; lim:t_dato; nom:t_dato1; var pos:t_dato);
var i:t_dato;
begin
for i:= 1 to  do
if v[i]=nom then
pos:=i;
end;
begin
inicializar (vector,limite);
cargar (vector,limite);
  writeln('ingrese nombre a buscar ');
  readln(nombre);
  posicion:=0;
  buscar(vector,limite,nombre,posicion);
 if posicion=0 then
  writeln('el nombre buscado no esta en el vector')
 else
 writeln('el nombre buscado esta en el vector y se encuentra en la posicion ' , posicion); 
readkey;
end.
