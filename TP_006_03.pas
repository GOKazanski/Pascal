//Gabriel Omar Kazanski
//gokazanski@gmail.com

//3.Dada una secuencia de caracteres acabada en punto, 
//obtener un algoritmo que determine cuantas veces aparece un determinado carácter,
//el cual será leído previamente.

Program TP_006_03;
Uses crt;
Var 
	Caract, CBuscado:Char;
	Cantidad:Integer;
	
BEGIN
Cantidad:=0;
Writeln ('Ingrese el Caracter a controlar');
Readln (CBuscado);
Writeln ('Ingrese la secuencia de caracteres, Si desea salir precione punto (.)');
Readln (Caract);

While Caract <>'.' do
Begin
	If Caract= CBuscado Then
		Cantidad:=Cantidad+1;
	Writeln ('Ingrese la secuencia de caracteres, Si desea salir precione punto (.)');
	Readln (Caract);
End;

Write('La cantidad que fue ingresado el Caracter ',CBuscado,' es de :', Cantidad);
Readkey;

END.
