//Gabriel Omar Kazanski
//gokazanski@gmail.com

//8. Hacer un programa que permita ingresar una lista de números, 
//la cual termina con un cero y que informe al finalizar el producto de todos los negativos y el promedio de todos  los positivos.

Program TP_006_08;
Uses crt;
Var
	num, c, an, ap:integer;

Begin
c:=0;
ap:=0;
an:=1;

Writeln('Ingrese un numero');
Readln(num);

While num <>0 do
Begin
     If num>0 then
     Begin
          c:=c+1;
          ap:=ap+num;
     End
     Else
     an:=an*num;
     Writeln('Ingrese un numero');
     Readln(num);
End;
Writeln('El promedio de los numeros positivos es: ', ap/c:2:2);
Writeln('El producto de los negativos es: ', an);
Readkey;
End.
