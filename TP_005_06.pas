//Gabriel Omar Kazanski
//gokazanski@gmail.com
program TP_005_06;
uses crt;
// 6.	Leer un lote de 30 valores de a uno por vez. 
// Determinar y emitir el valor máximo del conjunto y el orden en que fue leído. 
//Si hay más de un máximo considerar solo el primer valor hallado.

var 
	i , Num, Orden, Max: integer;

BEGIN
	Writeln ('Ingrese un valor');
	Readln (Num);
	Max:= Num;
	Orden:= 1;
	For i:=2 to 30 do
	Begin
		Writeln ('Ingrese un valor');
		Readln (Num);
		If (Num> Max) Then
		Begin
			Max:=Num;
			Orden:=i;
		End;
	End;
	Writeln ('El valor maximo ingresado es: ', Max, ' y su orden es: ', Orden);
	Readkey;
END.
