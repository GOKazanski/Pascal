//Gabriel Omar Kazanski
//gokazanski@gmail.com

//5.Escribir un algoritmo que permita leer una serie de enteros. 
//Contar el Nº de valores introducidos y su suma.

Program TP_006_05;
Uses crt;
Var 
	Num, Cantidad, Suma:Integer;
	Seguir: Char;
	
BEGIN
Cantidad:=0;
Suma:=0;

Writeln ('Presione "S" para continuar');
Readln (Seguir);
Seguir:= Upcase(Seguir);

While Seguir ='S' do
	Begin
		Writeln ('Ingrese la secuencia de Numeros');
		Readln (Num);
		Cantidad:=Cantidad+1;
		Suma:=Suma+Num;
	
	Writeln ('Presione "S" para continuar');
	Readln (Seguir);
	Seguir:= Upcase(Seguir);
	End;

Writeln ('La cantidad de numeros fueron: ', Cantidad);
Writeln ('La suma de los numeros ingresados es; ', Suma); 
Readkey;

END.
