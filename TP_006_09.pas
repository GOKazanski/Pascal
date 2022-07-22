//Gabriel Omar Kazanski
//gokazanski@gmail.com

//9.Dada una lista de precios de productos, la cual termina con un precio igual a cero.
// 	Se desea saber el monto total a pagar y la cantidad de artículos comprados.

Program TP_006_09;
Uses crt;
Var 
	Precio,PagarTotal:real;
	Cont:integer;

BEGIN
PagarTotal:=0;
Cont:=0;

Writeln('Ingrese el precio');
Readln(Precio);

While Precio<>0 do
Begin
     PagarTotal:= PagarTotal + Precio;
     Cont:= Cont+1;
     
     Writeln('Ingrese el precio');
     Readln(Precio);
End;

writeln('La cantidad de productos es: ', Cont);
writeln('El total a pagar es: ', PagarTotal:2:2);
Readkey;
END.
