{	Gabriel Omar Kazanski
	gokazanski@gmail.com

1. Se tienen los jugadores de los equipos de fútbol de primera división de Argentina, de cada uno se lee apellido y nombre, goles convertidos, y tarjetas rojas obtenidas. 
	Además, se conoce el Director Técnico de cada equipo y goles en contra recibidos.
Se pide:
*A. Procesar los datos hasta ingresar valores vacíos.
*B. Listado completo de los equipos con su DT y jugadores.
*C. Indicar si Mauro Martínez es dirigido por el DT Pablo Rodríguez, si es así mostrar un mensaje al finalizar el programa.
*D. Mostrar todos los datos del goleador de primera división suponiendo que es el jugador que mas goles convirtió y no obtuvo tarjetas rojas. 
	Mostrar el primero que cumple con esta condición, pero además indicar cuantos jugadores se encuentran en condición de goleador.
*E. Mostrar la cantidad de goles convertidos por equipo, (suponiendo que los goles en contra se restan de los convertidos) y cuál es el equipo goleador.
*F. Además, se pide mostrar cantidad de jugadores con tarjetas rojas.
*G. Suponiendo que se ingresó el apellido y nombre de cada jugador en dos variables separadas, utilizando las funciones de cadena de texto, ¿cómo se le ocurre insertar
	el apellido en la variable nombre?. Por ejemplo si ap=Juarez y nom=José, debe quedar nom=Juarez José.
H. Suponiendo que se quiere realizar un cartel en homenaje al jugador del punto D, informar la cantidad de letras que se necesitan para escribir su nombre y apellido.

Nota: Para los mensajes utilizar los subprogramas predefinidos en Pascal TextColor (Color): Cambia el color de primer plano. 
TextBackground (Color): Cambia el color de fondo y GotoXY recordando que la columna, es de 1 a 80 e Y es la fila, de 1 a 25. Los mismos deberán ser investigados por el
estudiante para ser aplicados.
}
Program TP_2020_05_29_001;
Uses crt;
Var

	Club, AuxClub, AuxClubJugMax, Director, DTBuscado, Jugador, JugGoleador, JugBuscado: string[30];
	Largogoleador, CantidadJug, Goles, GolesClub, GolesMax, CantGolesMax, AuxGolesClub, GolesContra, Tarjeta, JugTarjetas: byte;
	Buscado: boolean;
	
procedure Club_Goleador (GC,GE:byte; C:string; var AGC:byte; var MC:string);
begin
	if AGC<(GC - GE)then
			begin
				AGC:=(GC- GE);
				MC:=C
			end;

	
end;

procedure Jugador_Goleador (TR,G:byte; Var GM,CGM:byte; J,C:string; Var JG,ACJM:string);
begin


if (TR=0) and (GM<G) then
				begin
				GM:=G;
				JG:=J;
				ACJM:=C;
				CGM:=0
				End
			else
				if (TR=0) and (GM=G) then
					CGM:=CGM+1;
End;

BEGIN
AuxGolesClub:=0;
Buscado:= false;
JugTarjetas:=0;
GolesMax:=0;
CantGolesMax:=0;

textbackground (3);
clrscr;
textcolor (15);
writeln ('Ingrese el Director Tecnico a Buscar');
readln (DTbuscado);
DtBuscado:=upcase (DtBuscado);
writeln ('Ingrese el Apellido y Nombres del Jugador a Buscar');
readln (JugBuscado);
JugBuscado:=upcase (JugBuscado);

clrscr;
textcolor (10);
writeln ('------------------------------------------------------------------------');//1
writeln ('- Club:                                                                -');//2
writeln ('------------------------------------------------------------------------');//3
writeln ('- Director Tecnico:                                                    -');//4
writeln ('------------------------------------------------------------------------');//5
writeln ('- Lista de Jugadores                                    - T.R. - Goles -');//6
writeln ('------------------------------------------------------------------------');//7
writeln ('-                                                       -      -       -');//8,  J1
writeln ('-                                                       -      -       -');//9,  J2
writeln ('-                                                       -      -       -');//10, J3
writeln ('-                                                       -      -       -');//11, J4
writeln ('-                                                       -      -       -');//12, J5
writeln ('-                                                       -      -       -');//13, J6
writeln ('-                                                       -      -       -');//14, J7
writeln ('-                                                       -      -       -');//15, J8
writeln ('-                                                       -      -       -');//16, J9
writeln ('-                                                       -      -       -');//17, J10
writeln ('-                                                       -      -       -');//18, J11
writeln ('------------------------------------------------------------------------');//19
writeln ('- Goles en Contra:                                       Total -       -');//20
writeln ('------------------------------------------------------------------------');//21
writeln ('');																		 //22
textcolor (15);		
writeln ('Ingrese el nombre del Club                                    ');			 //23
readln (Club);
Club:= upcase (Club);

	while Club <> '' do
	begin
		CantidadJug:=0;
		GolesClub:=0;
		
		gotoxy (9,2);
		writeln (Club);
		
		gotoxy (1,23);
		writeln ('                                                                        ');
		writeln ('                                                                        ');
		
		gotoxy (1,23);
		writeln ('Ingrese el Director Tecnico                           ');
		readln (Director);
		Director:= upcase (Director);
		
		gotoxy (21,4);
		writeln (Director);
		
		gotoxy (1,23);
		writeln ('                                                                        ');
		writeln ('                                                                        ');
		
		gotoxy (1,23);
		writeln ('Ingrese la Cantidad de Goles en contra'); 
		readln (GolesContra);
		
		gotoxy (20,20);
		writeln (GolesContra);
		
		gotoxy (1,23);
		writeln ('                                                                        ');
		writeln ('                                                                        ');
		
		gotoxy (1,23);
		writeln ('Ingrese el Apellido y Nombres del Jugador');
		readln (Jugador);
		Jugador:=upcase (Jugador);
		
		while Jugador <> '' do
		begin
			inc(CantidadJug);
			if (Jugbuscado = Jugador)  and (DTbuscado = Director)then
			Buscado:= true;
			
			gotoxy (3,7+CantidadJug);
			writeln (Jugador);
			
			gotoxy (1,23);
			writeln ('                                                                        ');
			writeln ('                                                                        ');
			
			gotoxy (1,23);
			writeln ('Ingrese la cantidad de Tarjetas Rojas recibidas');
			readln (Tarjeta);
			if Tarjeta> 0 then
				begin
				JugTarjetas:=JugTarjetas+1;
				textcolor (12)
				end;
			
			gotoxy (60,7+CantidadJug);
			writeln (Tarjeta);
			textcolor (15);
			
			gotoxy (1,23);
			writeln ('                                                                        ');
			writeln ('                                                                        ');
			
			gotoxy (1,23);
			writeln ('Ingrese la cantidad Goles realizados');
			readln (Goles);
			if Goles<10 then
				begin
				gotoxy (70,7+CantidadJug);
				writeln (Goles);
				end
			else
				if Goles < 100 then
					begin
					gotoxy (69,7+CantidadJug);
					writeln (Goles);
					end
				else
					begin
					gotoxy (68,7+CantidadJug);
					writeln (Goles);
					end;
						
			GolesClub:=GolesClub+Goles;
			if GolesClub<10 then
				begin
				gotoxy (70,20);
				writeln (GolesClub);
				end
			else
				if GolesClub < 100 then
					begin
					gotoxy (69,20);
					writeln (GolesClub);
					end
				else
					begin
					gotoxy (68,20);
					writeln (GolesClub);
					end;
			//if (Tarjeta=0) and (GolesMax<Goles) then
			//	begin
			//	GolesMax:=Goles;
			//	JugGoleador:=Jugador;
			//	AuxClubJugMax:=Club;
			//	CantGolesMax:=0
			//	End
			//else
			//	if (Tarjeta=0) and (GolesMax=Goles) then
			//		CantGolesMax:=CantGolesMax+1;
		
			Jugador_Goleador (Tarjeta,Goles,GolesMax,CantGolesMax,Jugador,Club,JugGoleador,AuxClubJugMax);
			
		gotoxy (1,23);
		writeln ('                                                                        ');
		writeln ('                                                                        ');
		
		gotoxy (1,23);
		writeln ('Ingrese el Apellido y Nombres del Jugador');
		readln (Jugador);
		Jugador:=upcase (Jugador);
		if CantidadJug=11 then
			begin
				textcolor (10);
				gotoxy (1,8);
				writeln ('-                                                       -      -       -');//8,  J1
				writeln ('-                                                       -      -       -');//9,  J2
				writeln ('-                                                       -      -       -');//10, J3
				writeln ('-                                                       -      -       -');//11, J4
				writeln ('-                                                       -      -       -');//12, J5
				writeln ('-                                                       -      -       -');//13, J6
				writeln ('-                                                       -      -       -');//14, J7
				writeln ('-                                                       -      -       -');//15, J8
				writeln ('-                                                       -      -       -');//16, J9
				writeln ('-                                                       -      -       -');//17, J10
				writeln ('-                                                       -      -       -');//18, J11
				CantidadJug:=0;
				textcolor (15)
			end;
		end;
		
//		if AuxGolesClub<(GolesClub - GolesContra)then
//			begin
//				AuxGolesClub:=(GolesClub- GolesContra);
//				AuxClub:=Club
//			end;
	
		Club_Goleador (GolesClub, GolesContra,Club,AuxGolesClub,AuxClub);
		
		clrscr;
		textcolor (10);
		writeln ('------------------------------------------------------------------------');//1
		writeln ('- Club:                                                                -');//2
		writeln ('------------------------------------------------------------------------');//3
		writeln ('- Director Tecnico:                                                    -');//4
		writeln ('------------------------------------------------------------------------');//5
		writeln ('- Lista de Jugadores                                    - T.R. - Goles -');//6
		writeln ('------------------------------------------------------------------------');//7
		writeln ('-                                                       -      -       -');//8,  J1
		writeln ('-                                                       -      -       -');//9,  J2
		writeln ('-                                                       -      -       -');//10, J3
		writeln ('-                                                       -      -       -');//11, J4
		writeln ('-                                                       -      -       -');//12, J5
		writeln ('-                                                       -      -       -');//13, J6
		writeln ('-                                                       -      -       -');//14, J7
		writeln ('-                                                       -      -       -');//15, J8
		writeln ('-                                                       -      -       -');//16, J9
		writeln ('-                                                       -      -       -');//17, J10
		writeln ('-                                                       -      -       -');//18, J11
		writeln ('------------------------------------------------------------------------');//19
		writeln ('- Goles en Contra:                                       Total -       -');//20
		writeln ('------------------------------------------------------------------------');//21
		writeln ('');																		 //22
		textcolor (15);		
		writeln ('Ingrese el nombre del Club');
		readln (Club);
		Club:= upcase (Club);
	end;
	clrscr;
	writeln ('El Club ganador es ',AuxClub,' con un saldo de ',AuxGolesClub,' goles.');
	writeln ('El goleador del torneo es el jugador de: ',AuxClubJugMax,', ', JugGoleador,' con un total de ', GolesMax,' goles. Con ese mismo record hay ',CantGolesMax,' jugadores.');
	writeln ('La cantidad de jugadores con tarjetas rojas son: ',JugTarjetas);
	Largogoleador:= length(JugGoleador);
	
	writeln ('Si ', AuxClubJugMax,' desea hacer un cartel a ',JugGoleador, ' su apellido y nombre tienen ',Largogoleador,' letras.' );
	
	if Buscado then
		writeln ('El Jugador ',JugBuscado,' esta siendo dirigido por ', DTBuscado);
	readkey;
	
END.
