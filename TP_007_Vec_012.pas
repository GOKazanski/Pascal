{
12. Escribir un programa que invierta el contenido de un arreglo de n Nº enteros tal que el primero
se vuelve el último, el segundo el penúltimo, y así sucesivamente
}
program TP_007_Vec_012;
uses crt;

const
cant=5;

type
	t_vector=array [1..cant] of integer;
	t_datos=integer;
	
var
	vector, vector_copia: t_vector;
	limite:t_datos;

procedure inicializar (var vect:t_vector; var lim:t_datos);
var
	j:t_datos;
begin
	lim:=0;
	for j:=1 to cant do
		begin
		vect[j]:=0
		end;
end;	
	
procedure cargar (var vect:t_vector; var lim:t_datos);
var 
	aux:t_datos;
begin
	writeln ('Ingrese el primer numero');
	readln (aux);
	while ((aux <>0) and (lim<cant))do
	begin
		inc(lim);
		vect[lim]:=aux;
		if lim < cant then
		begin
			writeln ('Ingrese el siguiente numero');
			readln (aux);
		end;
	end;
end;	

procedure listar (var vect:t_vector; lim:t_datos);
var 
	j:t_datos;
begin
    for j:=1 to lim do
    begin 
		writeln ('la posicion ',j,' tiene el numero: ',vect[j]);
	end;
end;

procedure invertir (Var Vect, vect_copy:t_vector; lim:t_datos);							
var 
	j, lim2:t_datos;
Begin
lim2:=lim;

For j:= 1 to lim do
     begin
		vect_copy[j]:=Vect[lim2];
		dec (lim2);
     end;
End;

procedure listar2 (var vect_copy:t_vector; lim:t_datos);
var 
	j:t_datos;
begin
    for j:=1 to lim do
    begin 
		writeln ('la posicion ',j,' tiene el numero: ',vect_copy[j]);
	end;
end;

BEGIN
inicializar (vector, limite);	
cargar (vector, limite);
listar (vector, limite);
readkey;
invertir (vector, vector_copia, limite);
listar2 (vector_copia,limite);
readkey	;
END.

