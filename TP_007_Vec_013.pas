{
13. Dadas las cantidades vendidas de un determinado medicamento por un laboratorio durante un año, 
se pide: Mostrar total vendido en el año y promedio. Por error en el mes 5 se cargó un
dato incorrecto, se lo necesita modificar. Además, generar e informar un vector con los meses
donde no hubo producción de ningún medicamento cargando en el mes correspondiente SIN
PRODUCCIÓN.
}
program TP_007_Vec_013;
uses crt;

const 
mes=12; 																// Constante para la cantidad de vectores

type
	t_vector=array [1..mes] of real;									// limita el conjunto del 1 a la constante
	t_vector2=array [1..mes] of string[20];
	subrango=0..mes;
	pesos=real;

var
	vector, vector_copia:t_vector;
	vector2:t_vector2;
	imp_buscado, imp_promedio, imp_total:pesos;
	pos_buscado, limite:subrango;
	Opcion:integer;

procedure inicializar(var vect:t_vector; var lim:subrango); 			// procedimiento para inicializar los vectores
var 
	j:subrango;
begin
    for j:=1 to mes do
    begin 
		vect[j]:=0;
    end;
    lim:=0;
end;

procedure cargar (var vect:t_vector; var lim:subrango);
var 
	aux:pesos;
begin
	writeln ('Ingrese el primer monto');
	readln (aux);
	while ((aux <>-1) and (lim<Mes))do
	begin
		inc(lim);
		vect[lim]:=aux;
		if lim < Mes then
		begin
			writeln ('Ingrese el monto');
			readln (aux);
		end;
	end;
end;

procedure modificar (var vect:t_vector; lim, pb:subrango);
var
	aux:pesos;
begin
	writeln ('ingrese el monto');
	readln (aux);
	vect[pb]:=aux;
end;

procedure mostrar (var vect:t_vector; lim:subrango; var ib:pesos; pb:subrango);
Begin
     ib:= vect[pb];
end;

procedure copiar (Var Vect, vect_copy:t_vector; lim:subrango);							
var 
	j:subrango;
Begin
For j:= 1 to lim do
     vect_copy:=Vect;
End;

procedure listar (var vect:t_vector; lim:subrango);
var 
	j:subrango;
begin
    for j:=1 to lim do
    begin 
		writeln ('El mes: ',j,' tiene el importe: ',vect[j]:2:2);
	end;
end;

procedure listar3 (var vect:t_vector; lim:subrango);
var 
	j:subrango;
begin
    for j:=1 to lim do
    begin 
		writeln ('El mes: ',j,' tiene el importe: ',vect[j]:2:2);
	end;
end;

procedure totalizar (var vect:t_vector; lim:subrango; var it:pesos);
var
	j:subrango;
begin
	for j:=1 to lim do
		begin
			it:=it +vect[j]
		end;
end;


procedure promedio (var vect:t_vector; lim:subrango; var pro:pesos);
var 
	j:subrango;
begin
pro:=0;
	for j:=1 to lim do
		begin
			pro:=pro+vect[j]
		end;
	pro:=(pro/lim);
end;

procedure sin_produccion (var vect:t_vector; lim:subrango;var vect2:t_vector2);
var
	j:subrango;
begin
	for j:=1 to lim do
		begin
			if (vect[j]=0) then
				begin
					vect2[j]:='Sin produccion.'
				end;
		end;
end;

procedure listar2 (var vect:t_vector; lim:subrango; var vect2:t_vector2);
var 
	j:subrango;
begin
    for j:=1 to lim do
    begin 
		if (vect[j]=0) then
			begin
				writeln ('El mes: ',j,' ',vect2[j]);
			end;	
	end;
end;

BEGIN
inicializar (vector,limite);

repeat
pos_buscado:=0;
imp_promedio:=0;
clrscr;
	writeln ('*-----------------------------------------*');
	writeln ('*             Elija una opcion            *');
	writeln ('*-----------------------------------------*');
	writeln ('* 1 - Ingresar todos importes mensuales   *');
	writeln ('* 2 - Modificar un mes                    *');
	writeln ('* 3 - Mostrar un mes                      *');
	writeln ('* 4 - Realizar copia                      *');
	writeln ('* 5 - Listar                              *');
	writeln ('* 6 - Total del anio                      *');
	writeln ('* 7 - Promedio                            *');
	writeln ('* 8 - Sin producion                       *');
	writeln ('* 9 - Salir                               *');
	writeln ('*-----------------------------------------*');
	readln (opcion);
	case opcion of
		1: begin
			cargar(vector,limite);
			end;
		2: begin
			writeln ('ingrese el mes a modificar');
			readln (pos_buscado);
			modificar (vector,limite,pos_buscado);
			readkey;
			end;
		3: begin
			writeln ('ingrese el mes a mostrar');
			readln (pos_buscado);
			mostrar (vector,limite,imp_buscado,pos_buscado);
			writeln ('el importe es : ',imp_buscado:2:2);
			readkey;
			end;
		4: begin
			copiar (vector, vector_copia, limite);
			listar3 (vector_copia,limite);
			readkey;
			end;
		5: begin
			listar(vector,limite);
			readkey;
			end;
		6: begin
			totalizar (vector,limite,imp_total);
			writeln ('el total es: ',imp_total:2:2);
			readkey;
			end;
		7: begin
			promedio (vector,limite,imp_promedio);
			writeln ('el promedio de ventas es: ',imp_promedio:2:2);
			readkey;
			end;
		8: begin
			sin_produccion(vector, limite,vector2);
			listar2 (vector, limite,vector2);
			readkey;
			end;
		9: writeln ('gracias por usar el sistema')
		else
			writeln ('eligio una opcion incorrecta');
		end;
until (opcion=9);
readkey;	
END.
