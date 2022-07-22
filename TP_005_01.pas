//Gabriel Omar Kazanski
//gokazanski@gmail.com
program TP_005_01;
Uses Crt;
//1.	Se solicita ingresar el sueldo de 20 empleados y mostrar el total abonado. Además calcular el sueldo promedio.

var 
	Sueldo,SumaSu:Real;
	i:byte;

BEGIN
	SumaSu:=0;
	
	FOR i:=1 TO 3 DO
	begin
		Writeln ('Ingrese el Importe del Sueldo');
		Readln (Sueldo);
		SumaSu:= Sueldo + SumaSu;
	End;
	
	Writeln ('El total abonado es de: $',SumaSu);
	Writeln ('El Promedio de los sueldos es: $',SumaSu);
	Readkey;
END.
