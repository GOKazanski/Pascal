//Gabriel Omar Kazanski
//gokazanski@gmail.com

//6.Dada una lista de valores numéricos, hallar su rango, es decir la diferencia entre su valor máximo y su valor mínimo.

Program TP_006_06;
Uses crt;
Var 
	Num, NumMayor, NumMenor:Integer;
	Seguir:Char;

BEGIN

Writeln('Ingrese un numero');
Readln (Num);
NumMayor:=Num;
NumMenor:=Num;
Writeln('Presione "S" para Salir');
Readln (Seguir);
Seguir:=Upcase(Seguir);
	
	While Seguir <> 'S' do
		Begin
		Writeln('Ingrese un numero');
		Readln (Num);
			If Num>NumMayor Then
				NumMayor:=Num;
			If Num<NumMenor Then
				NumMenor:=Num;
		
		Writeln('Presione "S" para Salir');
		Readln (Seguir);
		Seguir:=Upcase(Seguir);
		
		End;
		
Writeln ('El numero mayor es: ', NumMayor);
Writeln ('El numero menor es: ', NumMenor);	
Writeln ('La diferencia entre ellos: ', NumMayor-NumMenor);
ReadKey;
END.

