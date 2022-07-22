{
9. Leer un vector con la edad de un grupo de x cantidad de personas. Se pide mostrar la cantidad
de menores de edad considerando a una persona joven si su edad es menor a 18 años
}
program TP_007_Vec_009;
uses crt;

const
cant=100;

type
	t_vector=array [1..cant] of integer;
	t_datos=integer;
	
var
	vect_edad: t_vector;
	cant_menor, limite:t_datos;

procedure inicializar (var vec:t_vector; var lim:t_datos);
var
	j:t_datos;
begin
	lim:=0;
	for j:=1 to cant do
		begin
		vec[j]:=0
		end;
end;	
	
procedure cargar (var vect:t_vector; var lim:t_datos);
var 
	aux:t_datos;
begin
	writeln ('Ingrese la edad de la persona');
	readln (aux);
	while ((aux <>0) and (lim<cant))do
	begin
		inc(lim);
		vect[lim]:=aux;
		if lim < cant then
		begin
			writeln ('Ingrese la siguiente edad');
			readln (aux);
		end;
	end;
end;	

procedure cantidad_menores (var vect:t_vector; lim:t_datos; var cm:t_datos);
var
	j:t_datos;
begin
cm:=0;
	for j:=1 to lim do
		begin
			if vect[j]<18 then
				begin
					inc(cm)
				end;	
		end;
end;
	
BEGIN
inicializar (vect_edad, limite);	
cargar (vect_edad,limite);
cantidad_menores (vect_edad,limite,cant_menor);
writeln ('La cantidad de menores es: ', cant_menor);
readkey	;
END.

