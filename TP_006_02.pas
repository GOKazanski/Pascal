//Gabriel Omar Kazanski
//gokazanski@gmail.com

//2.Construir un algoritmo que, dada una secuencia de enteros acabada con el valor cero,
// devuelva el mayor de ellos. Determinar cuántos números negativos han aparecido.

Program TP_006_02;
Uses crt;
Var 
	Num, Cantidad, NumMayor: integer;

BEGIN
Cantidad:=0;
Writeln ('Ingrese la secuencia de numeros, Si desea salir precione 0' );
Readln (Num);
NumMayor:=Num;

While Num <>0 do
begin
    If (Num > NumMayor) then
		NumMayor:= Num;
	If (Num < 0) Then
	Cantidad:=Cantidad+1;       

     Writeln ('Ingrese la secuencia de numeros, Si desea salir precione 0' );
     Readln (Num);
End;  
   
Writeln ('La cantidad de numeros negativos son: ', Cantidad );
Writeln ('El Valor mas alto fue: ', NumMayor );
Readkey;

END.
