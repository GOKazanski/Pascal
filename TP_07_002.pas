{	Gabriel Omar Kazanski
	gokazanski@gmail.com
	
2.	Ídem para el perímetro.
}

program TP_07_002;
uses crt;
var 
	Base, Altura, Perimetro : real;

procedure Perim(Bas,Alt:real; Var Per:real);
begin
Per:=(Bas+Alt)*2
end;

BEGIN
	writeln ('Ingrese la base del rectangulo');
	readln(Base);
	writeln ('Ingrese la altura del rectangulo');
	readln(Altura);	
	Perim (Base,Altura,Perimetro);
	writeln ('El Perimetro del rectangulo es: ',Perimetro:2:2);
	readkey;
END.
