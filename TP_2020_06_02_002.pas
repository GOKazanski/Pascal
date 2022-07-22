{	Gabriel Omar Kazanski
	gokazanski@gmail.com

2.	El Municipio realizó un relevamiento del cual surgen datos de los socios de los clubes deportivos de la ciudad. 
	Los mismos se han registrado en planillas que deben ser procesadas para fines estadísticos.
	Por cada socio se lee deporte principal que práctica (básquet, natación, hockey), edad y cuota que abona.
Se pide:
A.	*Club con más socios.
B.	*Total de socios en la ciudad.
C.	*Cantidad de socios que practican cada uno de los deportes en la ciudad y por club.
D.	*Promedio de cuota abonada por club.
E.	*Deporte más practicado por club.
F.	*Promedio de edad de los socios que practican natación en la ciudad.
G.	*Determinar si Juan Amaro practica deportes, si es así mostrar además cual y en que club.
}
Program TP_2020_05_29_002;
Uses crt;
Var 
	OpcionesMenu:byte;
	Club, AuxClub, AuxClubCiudad, SocioBuscado, Socio, DeporteBuscado: string[25];
	Edad, SumaEdad, CantSociosClub, CantSociosCiudad, AuxCantSociosCiudad, Basquet, Natacion, Hockey, TotalBasquet, TotalNatacion, TotalHockey: integer;
	AuxSocioBuscado: boolean;
	Cuota, CuotaClub:Real;
	Deporte: char;
	
BEGIN
AuxSocioBuscado:= false;
TotalBasquet:=0;
TotalNatacion:=0;
TotalHockey:=0;
CantSociosCiudad:=0;
SumaEdad:=0;
AuxCantSociosCiudad:=0;

repeat
	writeln ('-----------------------------------------');
	writeln ('- Ingrese una de las opciones del Menu  -');
	writeln ('-----------------------------------------');
	writeln ('- 1 - Generar una Busqueda de un socio  -');
	writeln ('- 2 - Ingresar un Club nuevo            -');
	writeln ('- 3 - Salir de la Aplicacion            -');
	writeln ('-----------------------------------------');
	readln (OpcionesMenu);	
	
	case OpcionesMenu of
		
		1: begin
			writeln ('Ingrese el Socio a Buscar');
			readln (SocioBuscado);
			SocioBuscado:= Upcase (SocioBuscado);
			readkey;
			clrscr;
		end;
		
		2: begin
			clrscr;
			writeln ('Ingrese en nombre del Club o "Enter" para salir');
			readln (Club);
			Club:= upcase (Club);
			
			while Club <>'' do
			begin
				
				CantSociosClub:=0;
				Basquet:=0;
				Natacion:=0;
				Hockey:=0;
				CuotaClub:=0;
				
				writeln ('Ingrese en nombre del socio o "Enter" para salir');
				readln (Socio);
				Socio:=upcase (Socio);
					
				while Socio<> '' do
				begin

					repeat
						writeln ('Ingrese la Edad');
						readln (Edad);
					until edad >=0;
					
					repeat
						writeln ('Ingrese el valor de la Cuota');
						readln (Cuota);
					until Cuota>=0;
						
					repeat
						writeln ('Ingrese el deporte segun las opciones');
						writeln ('B - Basquet');
						writeln ('N - Natacion');
						writeln ('H - Hockey');
						readln (Deporte);
						Deporte:= upcase (Deporte);
											
						case Deporte of
							'B': Basquet:=Basquet+1;
								
							'N': begin
									Natacion:=Natacion+1;
									SumaEdad:=SumaEdad + Edad;
								end;
								
							'H': Hockey:=Hockey+1;
						else
							writeln ('Ingreso una opcion incorrecta');
						end;
					until (Deporte='B') or (Deporte='N') or (Deporte='H');
					
					CantSociosClub:=CantSociosClub+1;
					CuotaClub:=CuotaClub + Cuota;
		
					if SocioBuscado= Socio then							// guardar los datos de la persona buscada
						Begin
							AuxSocioBuscado:=true;
							AuxClub:=Club;
							if (Deporte='B') then
								DeporteBuscado:= 'Basquet'
								else
									if (Deporte='N') then
										DeporteBuscado:= 'Natacion'
										else
											DeporteBuscado:= 'Hockey'
						end;
					readkey;
					clrscr;
					writeln ('Ingrese en nombre del socio o "Enter" para salir');
					readln (Socio);
					Socio:=upcase (Socio);
				end;													// Se sale de la carga de socios y termina el club
			
				clrscr;
				writeln ('-------------------------------------------');
				writeln ('Resumen del Club: ',Club); 
				writeln ('-------------------------------------------');
				writeln ('Cantidad de Socios: ',CantSociosClub); 	
				writeln ('Cantidad que practican basquet: ',basquet); 				
				writeln ('Cantidad que practican Natacion: ',Natacion); 	
				writeln ('Cantidad que practican Hockey: ',Hockey); 	 				
				writeln ('El promedio de la cuota es:',CuotaClub/CantSociosClub:2:2);
				if (Basquet > Natacion) and (Basquet > Hockey) then
					writeln('El deporte mas practicado en Basquet')
					else
						if (Natacion > Hockey)then
							writeln('El deporte mas practicado en Natacion')
							else
								writeln('El deporte mas practicado en Hockey');
				writeln ('-------------------------------------------');
				readkey;
			
				TotalBasquet:=TotalBasquet + Basquet;					// se va guardando el total de deporte por club
				TotalNatacion:=TotalNatacion + Natacion;
				TotalHockey:=TotalHockey + Hockey;
				CantSociosCiudad:=CantSociosCiudad + CantSociosClub;
				if CantSociosClub>AuxCantSociosCiudad then
					begin
						AuxCantSociosCiudad:= CantSociosClub;
						AuxClubCiudad:=Club
					end;
					
				clrscr;			
				writeln ('Ingrese en nombre del Club o "Enter" para salir');
				readln (Club);			
				Club:= upcase (Club);
			end;
			
		end;
		
		3: begin
			clrscr;
			writeln ('Gracias por utilizar nuestra Sistema');
			readkey
		end;	
		
	Else
		writeln ('Ingreso una opcion incorrecta');
		readkey;
		clrscr;
	End;	
	
until OpcionesMenu = 3;	

if CantSociosCiudad > 0 then
	Begin
	clrscr;
	writeln ('-------------------------------------------');
	writeln ('Resumen de la Ciudad'); 
	writeln ('-------------------------------------------');
	writeln ('Cantidad de Socios: ',CantSociosCiudad); 	
	writeln ('Cantidad que practican basquet: ',TotalBasquet); 				
	writeln ('Cantidad que practican Natacion: ',TotalNatacion); 	
	writeln ('Cantidad que practican Hockey: ',TotalHockey);
	writeln ('El club con mas socios es: ',AuxClubCiudad);
	writeln ('El promedio de la edad que practican Natacion es: ',SumaEdad/CantSociosCiudad:2:2);
	writeln ('-------------------------------------------');
	if AuxSocioBuscado=true then
		writeln ('El Socio: ',SocioBuscado,' es socio de; ',AuxClub,' y realiza: ',DeporteBuscado)
		else
			writeln (SocioBuscado, ' no se encuentra en la lista de ningun club');
	end;
	readkey	
END.
