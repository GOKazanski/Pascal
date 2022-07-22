{	Gabriel Omar Kazanski
	gokazanski@gmail.com
	
3.	Dados tres números enteros distintos, obtener el mayor.
}

program TP_07_003;
uses crt;
var 
	Num1,Num2,Num3,Mayor : integer;

procedure El_Mayor(N1,N2,N3:integer; Var May:integer);
begin
if (N1>N2) and (N1>N3) then
	May:=N1
else
	if N2>N3 then
		May:=N2
	else
		May:=N3;
end;

BEGIN
	writeln ('Ingrese el primer numero');
	readln(Num1);
	writeln ('Ingrese el segundo numero');
	readln(Num2);
	writeln ('Ingrese el tercer numero');
	readln(Num3);
	El_Mayor (Num1,Num2,Num3,Mayor);
	writeln ('El numero mayor es: ',mayor);
	readkey;
END.
