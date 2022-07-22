//Gabriel Omar Kazanski
//gokazanski@gmail.com
program TP_005_24;
uses crt;
//24.	Construir un algoritmo que muestre por pantalla las tablas de multiplicar usuales hasta el Nº 10.
	//Ejemplo:	
	//5 por 1 es 5
	//5 por 2 es 10
	//5 por 3 es 15

var i,j : integer;

BEGIN

		For i:=1 to 10 do
		Begin
			Writeln ('Teclear para seguir');
			Readln ();
			Writeln ('La tabla del: ', i);
				For j:=1 to 10 do
				Begin
					Writeln (j, ' x ',i,' = ',j*i);
				End				
		End;
	Readkey;	
END.
