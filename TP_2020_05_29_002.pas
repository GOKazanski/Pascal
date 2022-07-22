{	Gabriel Omar Kazanski
	gokazanski@gmail.com

2. Se tienen almacenados los datos de los vuelos realizados por una empresa de viajes con el objeto de repatriar a los argentinos varados en el exterior. 
	De cada vuelo se tiene aerolínea, procedencia, capacidad del avión, fecha y costo recaudado. Además, se tiene el listado de pasajeros por vuelo.
Se pide:
*A- Dada una aerolínea, mostrar los datos de los vuelos realizados en una fecha leída previamente (suponer que realizó más de un viaje). Mostrar además su procedencia.
*B- Mostrar todos los vuelos que se realizaron desde Madrid y la cantidad de repatriados de ese destino. Indicar además que porcentaje representa este número sobre el total.
*C- Suponiendo que la empresa debe cobrar el 15% de costo total del vuelo, mostrar el dinero recaudado por la misma en cada vuelo y en total.
*D- Además, mostrar un mensaje si cada vuelo viajó con su capacidad completa.
*E- Mostrar los datos del vuelo en que se repatrió a nuestra estudiante María Paula Barreto. Indicar además si viajó en el mes de marzo.
*F- Emitir listado completo con los datos de los vuelos realizados con el número de pasajeros al pie.   
}
Program TP_2020_05_29_002;
Uses crt;
Var 
	Aerolinea, Aux_Aero_pasajero, Aux_Mes, Ciudad, CiudadBuscada, Pasajeros, PasajeroBuscado, Viaje:string[25];
	
	CapacidadAvion, Cont_Pasajeros, Acu_Pasajeros_Total, Acu_Pas_Ciudad_Bus, Cont_Filas, Cont_Vuelo_Busc, Anio:integer;
	Dia, Mes:byte;
	Recaudacion, Acu_Recaudacion:real;
	Date, Aux_pasajero:boolean;
{ uso como plantilla para ubicar los espacios para el gotoxy
         1         2         3         4         5         6         7
1234567890123456789012345678901234567890123456789012345678901234567890
------------------------------------------------------------
- Controlando Ciudad:                                      -
- Controlando Pasajero:                                    -
------------------------------------------------------------
- Aerolinea:                             Fecha: 00/00/0000 -
------------------------------------------------------------
- Ciudad de Origen:                                        -
------------------------------------------------------------
- Capacidad:                    Recaudacion:               -
------------------------------------------------------------
- Num - Pasajeros                                          -
------------------------------------------------------------
-     -                                                    -
------------------------------------------------------------
}
BEGIN
Cont_Pasajeros:=0;
Cont_Vuelo_Busc:=0;
Acu_Pasajeros_Total:=0;
Acu_Pas_Ciudad_Bus:=0;
Acu_Recaudacion:=0;
Aux_pasajero:= false;
textbackground (3);
clrscr;
textcolor (15);

writeln ('Desea cargar un viaje (Si/No)'); // comienzo del ciclo principal.
readln (Viaje);
Viaje:=upcase(Viaje);

if (Viaje='SI') then // condicional para cargar los datos de busqueda
	begin
		writeln ('Ingrese la Ciudad a Controlar');
		readln (CiudadBuscada);
		CiudadBuscada:=Upcase(CiudadBuscada); // upcase pasa todo a mayuscula
		writeln ('Ingrese el Nombre del Pasajero a Controlar                    ');
		readln (PasajeroBuscado);
		PasajeroBuscado:=upcase(PasajeroBuscado)
	end;

while (Viaje='SI') do
	begin
		Date:= false;
		clrscr; // limpia pantalla y muestra plantilla
		writeln ('------------------------------------------------------------');//1 
		writeln ('- Controlando Ciudad:                                      -');//2
		writeln ('- Controlando Pasajero:                                    -');//3
		writeln ('------------------------------------------------------------');//4
		writeln ('- Aerolinea:                             Fecha:   /  /     -');//5
		writeln ('------------------------------------------------------------');//6
		writeln ('- Ciudad de Origen:                                        -');//7
		writeln ('------------------------------------------------------------');//8
		writeln ('- Capacidad:                    Recaudacion:               -');//9
		writeln ('------------------------------------------------------------');//10
		writeln ('- Num - Pasajeros                                          -');//11
		writeln ('------------------------------------------------------------');//12
		writeln ('-     -                                                    -');//13 P1
		writeln ('-     -                                                    -');//14 P2
		writeln ('-     -                                                    -');//15 P3
		writeln ('-     -                                                    -');//16 P4
		writeln ('-     -                                                    -');//17 P5
		writeln ('-     -                                                    -');//18 P6
		writeln ('-     -                                                    -');//19 P7
		writeln ('-     -                                                    -');//20 P8
		writeln ('-     -                                                    -');//21 P9
		writeln ('-     -                                                    -');//22 P10
		writeln ('-     -                                                    -');//23 P11
		writeln ('-     -                                                    -');//24 P12
		writeln ('------------------------------------------------------------');//25

		gotoxy (23,2);
		writeln (CiudadBuscada);

		gotoxy (25,3);
		writeln (PasajeroBuscado);

		gotoxy (1,28); // ubico las preguntas debajo de la plantilla
		writeln ('Ingrese el nombre de la Aerolinea                             '); // dejo espacios en blanco en el texto para eliminar al sobrescribir en la misma fila 
		readln (Aerolinea);
		Aerolinea:=upcase (Aerolinea);
		gotoxy (14,5);
		writeln(Aerolinea);
		gotoxy(1,29);
		clreol; // sentencia que borra el renglón
		
		gotoxy (1,28);
		writeln ('Ingrese la Ciudad de Origen                                   ');
		readln (Ciudad);
		Ciudad:=Upcase(Ciudad);
		gotoxy (21,7);
		writeln (Ciudad);
		gotoxy(1,29);
		clreol;
		
		repeat // comienza el código para corroborar la fecha, hasta que no tenga un valor real no sale
			gotoxy (1,28);
			writeln ('Ingrese la el dia                                              ');
			readln (Dia);
			gotoxy(1,29);
			clreol;
			if Dia>31 then
				begin 
				gotoxy (1,28);
				writeln ('No hay tantos dias.                                         ');
				readkey;
				end
			else
				begin
					gotoxy (1,28);
					writeln ('Ingrese el Mes                                             ');
					read (Mes);
					gotoxy(1,29);
					clreol;
					if Mes > 12then
						begin
							gotoxy (1,28);
							writeln ('No hay tantos meses                              ');
							readkey;
						end	
					else
						if ((Mes=4) or (Mes=6) or (Mes=9) or (Mes=11) and (Dia>30)) or ((Mes=2) and (Dia>29)) then
							begin
								gotoxy (1,28);
								writeln ('No hay tantos dias en mes                              ');
								readkey;
							end	
						else 
							begin
								gotoxy (1,28);
								writeln ('Ingrese el Anio                                    ');
								read (Anio);
								gotoxy(1,29);
								clreol;
								if ((Anio mod 4)<>0) and ((Mes=2) and (Dia=29)) then
									begin
										gotoxy (1,28);
										writeln ('No es anio bisiesto                             ');
										readkey;
									end
								else
									Date:=true;
							end;		
				end;
					
		until Date  = true; // sale si fecha es un valor verdadero
		gotoxy (49,5);
		writeln (Dia);
		gotoxy (52,5);
		writeln (Mes);
		gotoxy (55,5);
		writeln (Anio);		
				
		gotoxy (1,28);
		writeln ('Ingrese la Capacidad del Avion                                ');
		readln (CapacidadAvion);
		gotoxy (14,9);
		writeln (CapacidadAvion);
		gotoxy(1,29);
		clreol;
		
		gotoxy (1,28);
		writeln ('Ingrese la Recaudacion del vuelo                              ');
		readln (Recaudacion);
		gotoxy (45,9);
		writeln (Recaudacion:2:2);
		gotoxy(1,29);
		clreol;
		
		gotoxy (1,28);
		writeln ('Ingrese el Nombre del Pasajero                                ');
		readln (Pasajeros);
		Pasajeros:=Upcase(Pasajeros);
		gotoxy(1,29);
		clreol;
		Cont_Filas:=0;
		
				
		while Pasajeros <> '' do // comienza 2º ciclo 
			Begin
				inc(Cont_Pasajeros);// cuento la cantidad de pasajeros
				inc (Cont_Filas); // cuento las filas para ubicar los pasajeros en la plantilla
				gotoxy (3,12+Cont_Filas); // ubico al pasajero con una ubicación original + el valor del contador
				writeln (Cont_Pasajeros);
				gotoxy (9,12+Cont_Filas);
				writeln (Pasajeros,'                         ');
				
				if Pasajeros = PasajeroBuscado then // condicional comparando pasajero buscado
					Begin
					Aux_pasajero:=true;
					Aux_Aero_pasajero:=Aerolinea;
						if Mes=3 then // condicional para guardar si viajo en marzo
							Aux_Mes:='Si'
						else
							Aux_Mes:='No'	
					End;
							
				if (Cont_Filas =12) then // si se completa la plantilla con todos los espacios, vuelve al valor original 
					Cont_Filas:=0;
				
				if (CapacidadAvion-Cont_Pasajeros)=0 then // si se completa la capacidad del avion, no dejo cargar más pasajeros dandole el valor a pasajeros ''
					begin
						gotoxy (1,28);
						Writeln ('Se completo la Capacidad del vuelo');
						Pasajeros:='';
						readkey;
					end
				else // si no se completó, da la posibilidad de renovar el ciclo 
					begin
						gotoxy (1,28);
						writeln ('Ingrese el Nombre del Pasajero                                ');
						readln (Pasajeros);
						Pasajeros:=Upcase(Pasajeros);
						gotoxy(1,29);
						clreol;
					end;	
			end; // fin del 2º ciclo
		
		Acu_Pasajeros_Total:=Acu_Pasajeros_Total+Cont_Pasajeros; // al salir del ciclo acumulo los datos para el final
		Acu_Recaudacion:=Acu_Recaudacion+Recaudacion;
		
		If Ciudad = CiudadBuscada then // comparo la ciudad buscada con el vuelo y guardo los datos solicitados
			begin
				Cont_Vuelo_Busc:=+1;
				Acu_Pas_Ciudad_Bus:=Acu_Pas_Ciudad_Bus+Cont_Pasajeros
			end;
		
		// se muestra el resumen antes de entrar al próximo ciclo
		clrscr;
		writeln ('------------------------------------------------------');
		writeln ('Resumen del vuelo');
		writeln ('Aerolinea: ',Aerolinea );
		writeln ('Ciudad de Origen: ',Ciudad);
		writeln ('Fecha: ', Dia,'/',Mes,'/',Anio);
		writeln ('Recaudacion: $ ',Recaudacion:2:2);
		writeln ('Comision: $ ',Recaudacion*15/100:2:2);
		writeln ('Capacidad del Avion: ',CapacidadAvion); 
		writeln ('Cantidad de Pasajeros: ', Cont_Pasajeros);
		writeln ('El porcentaje es: ',Cont_Pasajeros*100/CapacidadAvion:2:2,'%');
		writeln ('------------------------------------------------------');

		writeln ('Desea cargar un viaje (Si/No)'); // renovación del ciclo principal
		readln (Viaje);
		Viaje:=upcase(Viaje);	
		
	end; // fin del ciclo principal
	// muestra el resumen de todos los viajes
	writeln ('------------------------------------------------------');
	writeln ('Resumen Total de vuelos');
	writeln ('La recuadacion total fue: $',Acu_Recaudacion:2:2);
	writeln ('Comision Total: $ ',Acu_Recaudacion*15/100:2:2);
	
	writeln ('------------------------------------------------------');
	Writeln ('Los vuelos desde: ', CiudadBuscada);
	writeln ('Fueron: ',Cont_Vuelo_Busc);
	writeln ('Con un total de: ',Acu_Pas_Ciudad_Bus, ' Pasajeros');
	writeln ('Que representan el: ',Acu_Pas_Ciudad_Bus*100/ Acu_Pasajeros_Total:2:2,'%' );
	writeln ('------------------------------------------------------');
	if Aux_pasajero then // si el pasajero buscado viajó se muestra la información
		begin
			writeln ('El pasajero: ', PasajeroBuscado);
			writeln ('Viajo por la aerolinea: ',Aux_Aero_pasajero);
			writeln (Aux_Mes,' viajo en Marzo');
			writeln ('------------------------------------------------------');
		end;
	readkey;
END.
