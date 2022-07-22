//Gabriel Omar Kazanski
//gokazanski@gmail.com
// 10.Obtener un algoritmo que permita calcular la siguiente serie: h(n)=1 + ½ + 1/3 + ... + 1/n

program TP_10;
uses crt;

var i,j: byte;
total:real;

BEGIN
	total:=0;
	writeln ('Ingrese un numero');
	readln (j);
	for i:=1 to j do
			begin
				writeln (1/i:0:4, ' equivale a 1/',i);
				total:= total + (1/i);
			end;
		writeln (total:0:4);
		readkey; 
END.
