{	Gabriel Omar Kazanski
	gokazanski@gmail.com
	
5.	Diseñar una función que calcule potencias de forma Xn y un programa que haga uso de la misma, para distintos valores de x y n.
}

program TP_07_005;
uses crt;
var 
	X,N,Potencia : integer;

procedure La_Potencia(XX,NN:integer; Var Resul:integer);
Var
	i:integer;
begin
	Resul:=1;
	for i:=NN downto 1 do
	begin
		Resul:=Resul*XX;
	end;
end;

BEGIN
	writeln ('Ingrese un numero a elevar');
	readln(X);
	writeln ('Ingrese el valor de la potencia');
	readln(N);
	La_Potencia (X,N,Potencia);	
	writeln ('El resultado es: ', Potencia);
	readkey;
END.
