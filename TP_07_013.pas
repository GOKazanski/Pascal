{	Gabriel Omar Kazanski
	gokazanski@gmail.com
	
13.	Escribir un procedimiento que permita calcular la suma 1+2+3+ ... + n.
}

program TP_07_013;
uses crt;
var 
	Num,Resultado : integer;

procedure Sumatoria(N:integer; Var Resul:integer);
var
	i:integer;
begin
Resul:=0;
	for i:=N downto 1 do
	begin
		Resul:=Resul+i;
	end;
end;

BEGIN
	writeln ('Ingrese un numero');
	readln(Num);
	Sumatoria(Num,Resultado);
	writeln ('La suma da: ',Resultado);
	readkey;
END.
