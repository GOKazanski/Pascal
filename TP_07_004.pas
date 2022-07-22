{	Gabriel Omar Kazanski
	gokazanski@gmail.com
	
4.	Escribir un procedimiento que calcule el factorial de un Nº entero.
}

program TP_07_004;
uses crt;
var 
	Num,Factorial : integer;

procedure El_Factorial(N:integer; Var fac:integer);
var
	i:integer;
begin
Fac:=1;
	for i:=N downto 1 do
	begin
		Fac:=Fac*i
	end;
end;

BEGIN
	writeln ('Ingrese un numero');
	readln(Num);
	El_Factorial(Num,Factorial);
	writeln ('El factorial de ',Num,' es: ', Factorial);
	readkey;
END.
