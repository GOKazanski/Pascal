{	Gabriel Omar Kazanski
	gokazanski@gmail.com
	
6.	Escribir una función lógica tal que dadas dos cadenas indique si la primera es más larga que la segunda.
}

program TP_07_006;
uses crt;
var 
	Texto1,Texto2:string;
	Resultado:boolean;
	
procedure Longitud_Texto(T1,T2:string; Var Resul:boolean);

begin
if (length(t1))>(length(t2))then
	Resul:=true

end;

BEGIN
Resultado:=false;

	writeln ('Ingrese la primera oracion');
	readln(Texto1);
	writeln ('Ingrese la segunga oracion');
	readln(Texto2);
	Longitud_Texto (Texto1,Texto2,Resultado);
	
if Resultado then
	writeln ('La primera oracion es mas larga')
else
	writeln ('La segunda oracion es mas larga');
	
readkey;
END.
