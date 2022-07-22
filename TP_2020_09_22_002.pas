{
2- Se desea llevar registro de la materia Fundamentos de Programación. 
	Se desea registrar los nombres y apellidos de los estudiantes y las notas del primer parcial. 
Se pide:
		a- Evaluar la nota obtenida y generar una estructura auxiliar donde almacene su condición,
			teniendo en cuenta que si la nota es mayor a siete debe estar en condición de promocionado,
			si es mayor a 4 regular y en caso contrario desaprobado.
		b- Cantidad de promocionados, de regularizados y desaprobados. 
			Mostrar los porcentajes respectivos que representan.
		c- Listado completo de los estudiantes con sus notas y condiciones.
		d- Indicar si el el estudiante Pepito cursa la materia, si es así mostrar su nota y condición. Utilizar BBIN.
   
Tp en grupo

Burgos Gabriela
González Claudio
Kazanski Gabriel
Moran Joaquin
}
program TP_2020_09_22_002;

uses crt;

const
n=10;

type 

t_vector = array [1..n] of string [25];
n_vector = array [1..n] of integer;


Var 
opcion:char;
ape_y_nom:t_vector;
condicion:t_vector;
notas:n_vector;
limite:integer;

// procedimiento para inicializar los vectores
procedure inicializar(var ayn,cond:t_vector; var nota:n_vector; var lim:integer); 			
var 
j:integer;
begin
lim:=0;
    for j:=1 to n do
    begin 
		ayn[j]:=('');
		cond[j]:=('');
		nota[j]:=0;
    end;
end;

//Procedimiento Cargar
procedure cargar (var ayn,cond:t_vector; var nota:n_vector; var lim:integer);
var 
aux_ayn:string[25];
aux_nota:integer;
begin
	writeln ('Ingrese el Apellido y Nombre del Alumno.');
	readln (aux_ayn);
	aux_ayn:= upcase (aux_ayn);
	while ((aux_ayn <> '') and (lim<n))do
	begin
		repeat
			writeln ('Ingrese la Nota del Parcial.');
			readln (aux_nota);	
			
		until (aux_nota>=0) and (aux_nota<=10);	
		inc(lim);
		ayn[lim]:=aux_ayn;
		nota[lim]:=aux_nota;
		if aux_nota>=7 then
			cond[lim]:= 'Promocionado'
		else
			if aux_nota>=4 then
				cond[lim]:= 'Regular'
			else	
				cond[lim]:= 'Desaprobado';
		if lim < n then
		begin
			writeln ('Ingrese el Apellido y Nombre del Alumno.');
			readln (aux_ayn);
		end;
	end;
end;	

//Procedimiento de Ordenamiento
procedure insercion (var ayn,cond:t_vector; var nota:n_vector; var lim:integer);
var 
i,j:integer;
aux_ayn,aux_cond:string[25];
aux_nota:integer;
begin
	for i:=2 to lim do      											
		begin
			j:=i-1;
			aux_ayn:=ayn[i];
			aux_cond:=cond[i];
			aux_nota:=nota[i];
			while (j>0) and (ayn[j]>aux_ayn) do // ordena por nombre		
				begin                                 						
					ayn[j+1]:=ayn[j];
					cond[j+1]:=cond [j]; 
					nota[j+1]:=nota [j];
					j:=j-1;                          						
				end;                                  
			ayn[j+1]:=aux_ayn; // ordena nombre
			cond[j+1]:=aux_cond; // ordena condición
			nota[j+1]:=aux_nota; // ordena nota
		end;
end;

//Procedimiento de listar
procedure listado(var ayn,cond:t_vector; var nota:n_vector; var lim:integer);
var 
j : integer;
begin
writeln ('---------------------------------------------------');	
writeln ('- Alumno                    - Nota - Condicion    -');
writeln ('---------------------------------------------------');	
    for j:=1 to lim do
    begin
		writeln ('-                           -      -              -');
        gotoxy(3,3+j);
        writeln (ayn[j]);
		gotoxy(32,3+j);
        writeln (nota[j]);
		gotoxy(38,3+j);
        writeln (cond[j]);
    end;
 writeln ('---------------------------------------------------');   
end;

//Procedimiento Cantidad y porcentaje
procedure cant_porcen (var cond:t_vector;var lim:integer);
var 
cant_pro,cant_reg,cant_des,j:integer;
begin
cant_pro:=0;
cant_reg:=0;
cant_des:=0;
	for j:=1 to lim do
		begin 
			if (cond[j]= 'Promocionado') then
				inc(cant_pro)
			else	
				if (cond[j]= 'Regular') then
					inc(cant_reg)
				else
					inc(cant_des)
		end;
	writeln ('-----------------------------------------');	
	writeln ('- Condicion     - Cantidad - Porcentaje -');
	writeln ('-----------------------------------------');	
	writeln ('- Promocionados -          -            -');	
	writeln ('-----------------------------------------');
	writeln ('- Regulares     -          -            -');
	writeln ('-----------------------------------------');		
	writeln ('- Desaprobados  -          -            -');	
	writeln ('-----------------------------------------');
	gotoxy (23,4);
	writeln (cant_pro);
	gotoxy (23,6);
	writeln (cant_reg);
	gotoxy (23,8);
	writeln (cant_des);	
	gotoxy (32,4);
	writeln (cant_pro*100/lim:2:2,'%');
	gotoxy (32,6);
	writeln (cant_reg*100/lim:2:2,'%');
	gotoxy (32,8);
	writeln (cant_des*100/lim:2:2,'%');	
end;

//Procedimiento de busqueda binaria
procedure buscar_binario (var ayn,cond:t_vector; var nota:n_vector; var lim,pos:integer;var aux_alu:string;var aux_n:integer;var aux_con:string);
var 																	
pri, ult, med:integer;
Begin
pri:=1;
ult:=lim;
pos:=0;
while (pos=0) and (pri<=ult) do
begin
	med:= (pri+ult) div 2; 												
	if (ayn[med]=aux_alu)then
		begin
			pos:=med;
			aux_con:=cond[med];
			aux_n:=nota [med];
		end	
	else
		if ayn[med]>aux_alu then 											
			ult:=(med-1)												
		else
		pri:= med+1;													
	end;
	
end;

//Procedimiento Menú de opciones
procedure menu (var opc:char);
var
aux_nom_alum,aux_condicion:string;
aux_notas,posicion:integer;
begin
repeat
TextColor (7);
TextBackground (3);
clrscr;
	writeln ('------------------------------------------');
	writeln ('----------------Bienvenido----------------');
	writeln ('------------------------------------------');
	writeln ('- Elija una de las opciones --------------');
	writeln ('------------------------------------------');	
	writeln ('- 1 - Ingresar Alumnos y Notas------------');
	writeln ('- 2 - Cantidad y Porcentajes de Alumnos --');	
	writeln ('- 3 - Listado ----------------------------');
	writeln ('- 4 - Buscar un Alumno -------------------');	
	writeln ('- 5 - Salir ------------------------------');
	writeln ('------------------------------------------');
	opc:= readkey; // con pulsar la tecla ya la toma opción
	Case opc of
	'1': begin // Punto A
		clrscr;
			cargar (ape_y_nom,condicion,notas,limite);
			insercion (ape_y_nom,condicion,notas,limite);				
		end;
	'2': begin // Punto B
						clrscr;
			if limite >0 then 
					cant_porcen (condicion,limite) // llama al procedimiento si hay datos
				else // si no hay datos
					writeln ('No hay Alumnos Cargados');
			writeln ('');
			writeln ('Presione un tecla para volver al menu.');				
			readkey;	
		end;	
	'3': begin // Punto C
			clrscr;
			if limite >0 then
					listado(ape_y_nom,condicion,notas,limite) // llama al procedimiento si hay datos
				else // si no hay datos
					writeln ('No hay Alumnos Cargados');
			writeln ('');
			writeln ('Presione un tecla para volver al menu.');				
			readkey;
		end;
	'4': begin // Punto D
			clrscr;
			if limite >0 then
				begin
					writeln ('Ingrese el nombre del Alumno. Ej "Pepito"');
					readln (aux_nom_alum);
					aux_nom_alum:= upcase (aux_nom_alum); // llama al procedimiento si hay datos
					buscar_binario (ape_y_nom,condicion,notas,limite,posicion,aux_nom_alum,aux_notas,aux_condicion);
					if posicion <> 0 then
						writeln ('El Alumno: ', aux_nom_alum,' tiene como nota de parcial: ', aux_notas,' y esta con la condicion de: ',aux_condicion)
					else
						writeln ('El Alumno: ', aux_nom_alum,' no se encuentra en la lista');					
				end
				else // si no hay datos
					writeln ('No hay Alumnos Cargados');

			writeln ('');
			writeln ('Presione un tecla para volver al menu.');	
			readkey;
		end;
	'5': begin 
			writeln ('Gracias por usar nuestro sistema');
			writeln ('');
			TextColor (128);
			writeln ('G. Burgos - C. Gonzalez - G. Kazanski - J. Moran');
		end;
	else
		begin
			clrscr;
			writeln ('Ingreso una opcion incorrecta, pulse una tecla para continuar');
			readkey;
		end;
	end;
until (opc= '5');
end;

// Cuerpo principal
BEGIN
inicializar (ape_y_nom,condicion,notas,limite); // llama al procedimiento inicializar
menu (opcion); // llama al procedimiento menú
readkey;
END.
