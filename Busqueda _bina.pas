program TP_busqueda_binaria;
uses crt;
const
cant=100;

type
	t_vector=array [1..cant] of integer;
	t_datos=integer;
	
var
	vect_num: t_vector;
	limite, buscado, posicion:t_datos;
	

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
	writeln ('Ingrese un numero');
	readln (aux);
	while ((aux <>0) and (lim<cant))do
	begin
		inc(lim);
		vect[lim]:=aux;
		if lim < cant then
		begin
			writeln ('Ingrese otro numero');
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

// el vector ingresa como var para no ocupar memoria
procedure buscar_binario (Var vect:t_vector; lim, bus:t_datos; var pos:t_datos);

var 																	// se declara variables internas que no influyen al resto del programa
pri, ult, med:t_datos;													// variables para contrplar la posicion
Begin
pri:=1;
ult:=lim;
pos:=0;

while (pos=0) and (pri<=ult) do
begin
//1 2 3 3 5 6 7  - 8 9 10 11 12 50 55
	med:= (pri+ult) div 2; 												// pone como valor el promedio de posicion entre los 2 limites
	if (vect[med]=bus)then
		pos:=med 														// guarda posicion en el medio
	else
		if vect[med]>bus then 											// pregunta si el valor esta a la izquierda
			ult:=(med-1)												// corre la ultima posicion al medio -1
		else
		pri:= med+1;													// si no esta a la izquierda corre el limite inferior al medio +1
	end;

end;



	
BEGIN
inicializar (vect_num, limite);	
cargar (vect_num,limite);
ordenar (vect_num, limite);
listar (vect_num, limite);
writeln ('Ingrese el numero a buscar');
readln (buscado);
buscar_binario (vect_num, limite, buscado, posicion);
if posicion <> 0 then
writeln ('el numero buscado: ', buscado,'Se encuentra en el vector en la posicion', posicion)
else
writeln ('el numero buscado: ', buscado,'no se encuentra en la lista');

readkey;
END.


