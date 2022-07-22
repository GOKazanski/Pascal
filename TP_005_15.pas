//Gabriel Omar Kazanski
//gokazanski@gmail.com
program TP_005_15;
uses crt;
//15.	Se efectúa una encuesta entre 200 usuarios de programas de gestión de sueldos. 
// Las respuestas están codificadas como 1, 2 o 3 según sea el elegido. 
//Preparar un algoritmo para ingresarle las 200 respuestas, y muestre por pantalla el número del sistema preferido.

var 
	i, Cont1,Cont2,Cont3 : byte;
	Opcion : char;

Begin
	Cont1:=0;
	Cont2:=0;
	Cont3:=0;
	
	For i:=1 to 5 do
	Begin
		Writeln ('Ingrese una Opción (1,2,3)');
		Readln (opcion);
		Case (Opcion) of
			'1': inc(Cont1);
			'2': inc(Cont2);
			'3': inc(Cont3);
		Else Write ('Opción incorrecta');
		End;
	End;
		If (Cont1 > Cont2) and (Cont1 > Cont3) then
			Writeln ('El sistema preferido es el Nº 1 Con ', Cont1, ' Elecciones')
		else
		Begin
			If (Cont2 > Cont3) then
				Writeln ('El sistema preferido es el Nº 2 Con ', Cont2, ' Elecciones')
			Else
				Writeln ('El sistema preferido es el Nº 3 Con ', Cont3, ' Elecciones');	
		End;
	Readkey;
End.
