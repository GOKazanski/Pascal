//Gabriel Omar Kazanski
//gokazanski@gmail.com
program TP_005_04;
uses crt;
//4.	Calcular la suma y el producto de los números pares comprendidos entre 3 y 50.

var 
	i : byte;
	Suma : Integer;
	Producto : Real;
	
BEGIN
	Producto:=1;
	Suma:=0;
	For i:=3 to 50 do
	Begin
		If (i mod 2=0) then
		begin
			Suma := Suma + i;	
			Producto:= Producto * i;
		End;
	End;
	Writeln ('El resultado de la Suma es: ', Suma);
	Writeln ('El resultado del producto es: ', Producto:0:2);
	Readkey;
END.
