//Gabriel Omar Kazanski
//gokazanski@gmail.com

//4.Contar la cantidad de Números negativos de una lista que finaliza con el Nº 0.

Program TP_006_04;
Uses crt;
Var 
	Num, Cantidad:Integer;
	
BEGIN
Cantidad:=0;
Writeln ('Ingrese la secuencia de Numeros, Si desea salir precione el Cero (0)');
Readln (Num);

While Num <>0 do
Begin
	If Num < 0 Then
		Cantidad:=Cantidad+1;
	Writeln ('Ingrese la secuencia de Numeros, Si desea salir precione el Cero (0)');
	Readln (Num);
End;

Writeln ('La cantidad de numeros negativos fue de: ', Cantidad);
Readkey;

END.
