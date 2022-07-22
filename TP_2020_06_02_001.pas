{	Gabriel Omar Kazanski
	gokazanski@gmail.com

1.	Se tienen los ingresantes a una Facultad, de cada uno se lee carrera que estudia, 
	sede seleccionada para cursar (A, B o C), lugar de procedencia y si adeuda materias del secundario. Se pide:
a.	Procesar los datos, los mismos NO están ordenados por sede.
b.	Mostrar la cantidad de aspirantes por sede y en la Facultad.
c.	Calcular porcentaje de aspirantes de la provincia de Entre Ríos.
d.	Determinar en cual sede cursan más alumnos con materias previas del secundario.
e.	Indicar si la estudiante Mariana Moreno estudia en la Facultad, si es así mostrar en cual sede.
   
}
Program TP_2020_06_02_001;
Uses crt;
Var 
	ContAspirantesTotal, ContAspirantesA, ContAspirantesB, ContAspirantesC, ContAspirantesER, PreviasA, PreviasB, PreviasC: Integer;
	EstBuscado, ApellidoyNombre, Carrera:String[30];
	OpcionesMenu:Byte;
	Sede, Provincia, Previas, AuxSede, AuxPrevias:Char;
	Buscado: Boolean;
	
BEGIN
Buscado:= False;	
ContAspirantesA:=0;														//Inicializas los contadores. Necesitas para contar y acumumular para cada
ContAspirantesB:=0;
ContAspirantesC:=0;
ContAspirantesER:=0;
ContAspirantesTotal:=0;
PreviasA:=0;
PreviasB:=0;
PreviasC:=0;
Repeat
	writeln ('-----------------------------------------');
	writeln ('- Ingrese una de las opciones del Menu  -');
	writeln ('-----------------------------------------');
	writeln ('- 1 - Generar una Busqueda de un alumno -');
	writeln ('- 2 - Ingresar un alumno nuevo          -');
	writeln ('- 3 - Salir de la Aplicacion            -');
	writeln ('-----------------------------------------');
	readln (OpcionesMenu);	
	
	Case OpcionesMenu of												// Case contrala las Opciones del menú
	1: begin
				writeln ('Ingrese el Alumno a Buscar');
				readln (EstBuscado);
				EstBuscado:= Upcase (EstBuscado);
				readkey;
				clrscr; 												// Limpiar pantalla
		end;
	2: begin
			clrscr;
			writeln ('Ingrese el Apellido y Nombre o "Enter" para salir');
			readln (ApellidoyNombre);
			ApellidoyNombre:= Upcase(ApellidoyNombre);
				
			while ApellidoyNombre <>'' do 							// Con While controla el ingreso de los estudiantes
			begin
					if EstBuscado= ApellidoyNombre then
						Buscado:= true;
					
					repeat												// Con Repeat solo se sale si es una de las opciones 
					writeln ('Ingrese si es de la Provincia de Entre Rios (S/N)');
					readln (Provincia);
					Provincia:= Upcase (Provincia);
						if (Provincia='S') then
							ContAspirantesER:=ContAspirantesER+1
					until (Provincia= 'S') or (Provincia='N');
				
					writeln ('Ingrese la Carrera a cursar');
					readln (Carrera);
				
					repeat		
					writeln ('Ingrese si posee previas del Secundario (S/N)');	
					readln (Previas);
					Previas:=Upcase (Previas);
					until (Previas= 'S') or (Previas='N');
					
					writeln ('Ingrese la sede (A, B, C)');
					readln (Sede);
					Sede:= upcase (Sede);
					
					repeat												// Según la opción elegida se van incrementado los contadores
					case Sede of
							'A': begin
									ContAspirantesA:=ContAspirantesA +1;
									if (Previas='S') then
										PreviasA:=PreviasA+1;
								end;		
							'B': begin
									ContAspirantesB:=ContAspirantesB +1;
									if (Previas='S') then
										PreviasB:=PreviasB+1
								end;		
							'C': begin
									ContAspirantesC:=ContAspirantesC +1;
									if (Previas='S') then
										PreviasC:=PreviasC+1
								end;
					else
						writeln ('Ingreso una opcion incorrecta');				
					end;
					until (Sede	= 'A') or (Sede	= 'B') or(Sede	= 'C');
				if Buscado= true then
					AuxSede:=Sede;
				readkey;
				clrscr;	
				writeln ('Ingrese el Apellido y Nombre o "Enter" para salir');
				readln (ApellidoyNombre);
				ApellidoyNombre:= Upcase(ApellidoyNombre);
				end;
			end;
	3: writeln ('Gracias por utilizar nuestra Sistema');
	else
		writeln ('Ingreso una opcion incorrecta');
		readkey;
		clrscr;
	end;
until OpcionesMenu = 3;													// se sale del case unicamente con una opción
	
	if (PreviasA > PreviasB) and (PreviasA > PreviasC) then
		AuxPrevias:= 'A'
	Else
		if (PreviasB > PreviasC) then
			AuxPrevias:= 'B'
		Else
			AuxPrevias:='C';
			
	ContAspirantesTotal:= ContAspirantesA + ContAspirantesB + ContAspirantesC;
		
	writeln ('Los Alumnos de la Sede A Son: ',ContAspirantesA);
	writeln ('Los Alumnos de la Sede B Son: ',ContAspirantesB);	
	writeln ('Los Alumnos de la Sede C Son: ',ContAspirantesC);
	writeln ('Los Alumnos de la Facultad Son: ',ContAspirantesTotal);
	writeln ('El porcentaje de Alumnos de Entre Rios es: ',ContAspirantesER*100/ContAspirantesTotal:2:2,'%');
	writeln ('La Sede con mas alumnos con Previas es: ',AuxPrevias);
	if Buscado= true then
	writeln ('El Alumno buscado: ',EstBuscado,', se Inscribio en la Sede: ',AuxSede )
	else
	writeln ('El Alumno buscado: ',EstBuscado,', no se Inscribio en la Facultad.');	
	readkey;
END.
