//Gabriel Omar Kazanski
//gokazanski@gmail.com

//1.Dada una secuencia de caracteres acabada en #, mostrar los números de 0 a 9 que en ella aparecen.

Program TP_006_01;
Uses crt;
var
  Caract: Char;
  Numeros : String;
  Cantidad: word;

BEGIN
Cantidad:=0;
Numeros:= '';
Writeln ('Ingrese la secuencia de numeros, Si desea salir precione #' );
Readln (Caract);

While Caract <>'#' do
begin
     If Caract In ['0'..'9'] then
     Begin
     Cantidad:= Cantidad+1;
     Numeros:=Numeros + Caract + ' ';
     
     End;
     Writeln ('Ingrese la secuencia de numeros, Si desea salir precione #' );
     Readln (Caract);
End;

Writeln ('La cantidad de numeros ingresados son: ', Cantidad );
Writeln ('La secuencia fue: ', Numeros );
Readkey;

END.
