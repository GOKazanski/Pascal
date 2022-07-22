{	Gabriel Omar Kazanski
	gokazanski@gmail.com
	
1.	Escribir un procedimiento Geometría tal que dado el alto y ancho de un rectángulo calcule el área.
}

program TP_07_001;
uses crt;
var 
	Base, Altura, Area : real;

procedure Superficie (Bas,Alt:real; Var Ar:real);
begin
Ar:=Bas*Alt
end;

BEGIN
	writeln ('Ingrese la base del rectangulo');
	readln(Base);
	writeln ('Ingrese la altura del rectangulo');
	readln(Altura);	
	Superficie (Base,Altura,Area);
	writeln ('El Area del rectangulo es: ',Area:2:2);
	readkey;
END.
