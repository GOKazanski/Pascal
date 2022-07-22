{	Gabriel Omar Kazanski
	gokazanski@gmail.com
	
15.	Escribir una función que dados 2 números, calcule el porcentaje que el primero representa respecto del segundo.
}

program TP_07_005;
uses crt;
var 
	Num1,Num2: real;
	//Porcentaje;real;
	
{procedure El_Porcentaje(N1,N2:real; var Porc:Real);

begin
	Porc:=N1*100/N2;
end;
}
function El_Porcentaje (N1,N2:real):real;
begin
	El_Porcentaje:=N1*100/N2;
end;

BEGIN
	writeln ('Ingrese un numero');
	readln(Num1);
	writeln ('Ingrese otro numero');
	readln(Num2);
	
	//El_Porcentaje (Num1,Num2,Porcentaje);
	writeln ('El pocentaje que representa el primer numero con el sugundo es: ', El_Porcentaje(Num1,Num2):2:2,'%');
	readkey;
END.
