{
1- Se tienen las edades de los pacientes de una clínica almacenadas en un vector. 

Se pide:
		a- Cargar la estructura hasta que el usuario lo desee.
		b- Listado de edades ordenado en forma ascendente.
		c- Mostrar Cantidad de Pacientes con edad 58 años.
		d- Verificar si hay un paciente con edad de 90 años, de ser así, indicarlo con un mensaje
			y mostrar la posición en la que se encuentra almacenada (Utilice búsqueda Binaria, suponer que es uno solo).
		e- Calcular el promedio de edades de todos los pacientes.
		f- Mostrar el porcentaje que representan los pacientes con más de 50 años, sobre el total.

Tp en grupo

Burgos Gabriela
González Claudio
Kazanski Gabriel
Moran Joaquin

}
program TP_2020_09_22_001;

uses crt;

const
n=100;

type 
vector = array [1..n] of integer;
datos = integer;

Var 
opcion:char;
edad:vector;
limite:datos;

//Procedimiento inicializar
procedure inicializar(var v:vector; var lim:datos);
var 
j:datos;
begin
lim:=0;
	for j:=1 to n do
	begin
		v[j] := 0;
	end;
end;

//Procedimiento Cargar
procedure cargar (var v:vector; var lim:datos);
var 
aux:datos;
begin
	writeln ('Ingrese la edad del paciente, para dejar de ingresar ingrese 0.');
	readln (aux);
	while ((aux <>0) and (lim<n))do // si ingresa 0 no entra al ciclo
	begin
		inc(lim);
		v[lim]:=aux;
		if lim < n then
		begin
			gotoxy (1,1);
			writeln ('Ingrese la edad del paciente, para dejar de ingresar ingrese 0.');
			writeln ('                                                              ');
			gotoxy (1,2);
			readln (aux);
		end;
	end;
end;	

//Procedimiento de Ordenamiento
procedure insercion (var v:vector; lim:datos);
var i,j,aux:datos;
begin
     for i:=2 to lim do //recorre el vector
     begin
          j:=i-1;
          aux:=v[i];
          while (j>0) and (v[j]>aux) do //evalúa dos elementos del vector
          begin // para saber si el que esta antes es menor.
               v[j+1]:=v[j]; // en esta línea desplaza el numero que es mayor hacia
               j:=j-1; // una posición mas del vector
          end;                                  
          v[j+1]:=aux;                       
     end;
end;

//Procedimiento de listar
procedure listado(var v:vector; lim:datos);
var 
j : datos;
begin
    for j:=1 to lim do
    begin
        writeln(v[j]);
    end;
end;

//Procedimiento de cantidad de una edad determinada
procedure cantidad_edad (var v:vector; lim:datos; eb:datos; var cb:datos);
var
j:datos;
begin
cb:=0;
	for j:=1 to lim do
		begin
			if v[j]=eb then
				begin
					inc(cb) // incrementa la cantidad de edad buscada
				end;	
		end;
end;

//Procedimiento de busqueda binaria
procedure buscar_binario (Var v:vector; lim, eb:datos; var pos:datos);
var 																	
pri, ult, med:datos;
Begin
pri:=1;
ult:=lim;
pos:=0;

while (pos=0) and (pri<=ult) do
begin
	med:= (pri+ult) div 2; 												
	if (v[med]=eb)then
		pos:=med 														
	else
		if v[med]>eb then 											
			ult:=(med-1)												
		else
		pri:= med+1;													
	end;
end;

//Procedimiento promedio
procedure promedio_pacientes (var v:vector; lim:datos; var pro:real);
var 
j:datos;
begin
pro:=0;
	for j:=1 to lim do
		begin
			pro:=pro+v[j]
		end;
	pro:=(pro/lim);
end;

//Procedimiento porcentaje
procedure porcentaje (var v:vector; lim:datos; eb:datos; var cb:datos);
var 
j:datos;
begin
cb:=0;
	for j:=1 to lim do
		begin 
			if (v[j])> eb then
				inc(cb) // incrementa la cantidad buscada
		end;
end;

//Procedimiento Menú de opciones
procedure menu (var opc:char);
var
edad_buscada,cant_buscada,posicion:datos;
promedio:real;
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
	writeln ('- 1 - Ingresar edades --------------------');
	writeln ('- 2 - Listar -----------------------------');
	writeln ('- 3 - Cantidad de pacientes de una edad --');
	writeln ('- 4 - Buscar pacientes de una edad -------');	
	writeln ('- 5 - Promedio de edades -----------------');
	writeln ('- 6 - Porcentaje de edades mayores a -----');
	writeln ('- 7 - Salir ------------------------------');
	writeln ('------------------------------------------');
	opc:= readkey; // con pulsar la tecla ya la toma opción
	Case opc of
	'1': begin // Punto A
		clrscr;
			cargar (edad,limite); // llama al procedimiento cargar
			insercion (edad,limite); // llama al procedimiento ordenamiento
		end;
	'2': begin // Punto B
			clrscr;
			if limite >0 then
					listado (edad,limite) // llama al procedimiento para listar si hay datos cargados
				else
					writeln ('No hay pacientes Cargados'); 
			writeln ('');
			writeln ('Presione un tecla para volver al menu.');				
			readkey;
		end;
	'3': begin // Punto C
			clrscr;
			writeln ('Ingrese la edad del pacinete a buscar y se mostrara la cantidad que hay de ellos. Ej:58');
			readln (edad_buscada);
			cantidad_edad (edad,limite,edad_buscada,cant_buscada); // llama al procedimiento cantidad de una edad
			writeln ('Son: ',cant_buscada, ' pacientes.');
			writeln ('');
			writeln ('Presione un tecla para volver al menu.');	
			readkey;
		end;
	'4': begin // Punto D
			clrscr;
			writeln ('Ingrese la edad del pacinete a buscar y se mostrara la ubicacion. Ej 90');
			readln (edad_buscada);
			buscar_binario (edad,limite,edad_buscada,posicion); // llama al procedimiento de busqueda
			if posicion <> 0 then // muestra si hay datos
				writeln ('El Paciente con la edad de: ', edad_buscada,' Se encuentra en la posicion: ', posicion)
			else // Si no hay con esa edad
				writeln ('El Paciente con la edad de: ', edad_buscada,' no se encuentra en la lista');
			writeln ('');
			writeln ('Presione un tecla para volver al menu.');	
			readkey;
		end;
	'5': begin // Punto E
			clrscr;
			if limite >0 then
			begin
				promedio_pacientes (edad,limite,promedio); // llama al procedimiento promedio si hay datos cargados
				writeln ('El promedio de edad de los ',limite,' pacientes');
				writeln ('Es de ',promedio:2:1,' anios');
			end
			else // si no hay datos
				writeln ('No hay pacientes Cargados');
			writeln ('');
			writeln ('Presione un tecla para volver al menu.');		
			readkey;
		end;
	'6': begin // Punto F
			clrscr;
			if limite >0 then
			begin
				writeln ('Ingrese la edad del pacinete a buscar y se mostrara la ubicacion. Ej 50');
				writeln ('');
				readln (edad_buscada);
				porcentaje (edad,limite,edad_buscada,cant_buscada); // llama al procedimiento porcentaje si hay datos cargados
				writeln ('El porcentaje de pacientes mayores a ',edad_buscada);
				writeln ('Es del ',cant_buscada*100/limite:2:2,'%');	
			end
			else // si no hay datos
				writeln ('No hay pacientes Cargados');
			writeln ('');
			writeln ('Presione un tecla para volver al menu.');		
			readkey;
		end;
	'7': begin 
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
until (opc= '7');
end;

// Cuerpo principal
BEGIN
inicializar (edad,limite); // llama al procedimiento inicializar
menu (opcion); // llama al procedimiento menú
readkey;
END.
