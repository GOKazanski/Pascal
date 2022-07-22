{
3. Se desea registrar las edades de los socios de un club en un vector. Se solicita:
a- Cargar el vector hasta que la edad sea igual a 0
b- Mostrar listado ordenado de forma ascendente de las edades.
c- Calcule el promedio de edades.
d- Muestre el socio de mayor edad. 
   
   
}
program TP_009_Vec_003;
uses crt;
const
cant=100;

type
	t_vector=array [1..cant] of integer;
	t_datos=integer;
	
var
	vect_edad: t_vector;
	limite, promedio_edad:t_datos;
	

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

procedure ordenar(var vect:t_vector; lim:t_datos);
var orden:boolean;
j,aux:integer;
begin
     orden:=false;  // suponemos que la primera vez no esta ordenada
     while orden<>true do
     begin
          orden:=true;
          for j:=1 to lim-1 do    // recorre vector ordenado
          begin
               if vect[j]>vect[j+1] then     //compara elementos
               begin
                    orden:=false;            // como hay intercambio la variable orden pasa a false,
                    aux:=vect[j];            //  porque esta desordenado el vector
                    vect[j]:=vect[j+1];
                    vect[j+1]:=aux;
               end;
          end;
     end;
end;

procedure listar (vect:t_vector; lim:t_datos);
var j:integer;
begin
    for j:=1 to lim do
    begin 
		writeln (j, ' es: ',vect[j]);
	end;
end;

procedure promedio (vect:t_vector; lim:t_datos; Var prom_edad:t_datos);
var j, aux_edad:integer;

begin
aux_edad:=0;

    for j:=1 to lim do
    begin 
		aux_edad:=aux_edad + vect [j];
	end;
	prom_edad:= aux_edad;
	
end;

procedure mayor (vect:t_vector; lim:t_datos);

begin
     writeln ('el mayor es: ',vect[lim]);
	
end;

	
BEGIN
inicializar (vect_edad, limite);	
cargar (vect_edad,limite);
ordenar (vect_edad, limite);
listar (vect_edad, limite);
Promedio (vect_edad, limite,promedio_edad);
writeln ('el promedio de edad es: ',promedio_edad/limite:2:0);
mayor (vect_edad, limite);
readkey;
END.

