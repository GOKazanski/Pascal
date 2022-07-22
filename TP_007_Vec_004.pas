{
4. Generar y emitir el vector A = (1,0,1,0,1,0) de N elementos
}
program TP_007_Vec_004;
uses crt;

Const
n=10;

type
t_vector=array [1..n] of integer;										// limita el conjunto del 1 a la constante
t_dato=integer;

var
v:t_vector;
limite:t_dato;

procedure inicializar(var vect:t_vector; var lim:t_dato);			// procedimiento para inicializar los vectores
var j:t_dato;
begin
    for j:=1 to n do
    begin 
		vect[j]:=0;
    end;
    lim:=0;
end;

procedure generar (var vect:t_vector);
var j:t_dato;
begin
    for j:=1 to n do
    begin 
		if (j mod 2)=0 then
			vect [j]:=0
		else
			vect [j]:=1;
    end;
end;
procedure listar (vect:t_vector);
var j:t_dato;
begin
    for j:=1 to n do
    begin 
		writeln ('contenido del vector en la posición es: ',j, ' es: ',vect[j]);
		
	end;
end;

BEGIN
inicializar (v,limite);
generar (v);
listar (v);
readkey;	
END.

