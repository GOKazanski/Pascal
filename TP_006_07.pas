//Gabriel Omar Kazanski
//gokazanski@gmail.com

//7.Dada una lista de valores enteros positivos, hallar cuántos valores mayores que 1.000 hay. 
//Si la cantidad es menor que 20 calcular su factorial.

Program TP_006_07;
Uses Crt;
Var 
	Num, Fact, I, Cont:integer;

Begin
Cont:=0;
Fact:=1;
writeln('Ingrese un numero');
Readln(Num);

While Num<>0 do
	Begin
		If Num>1000 then
			Cont:=Cont+1;
			
	Writeln('Ingrese un numero');
	Readln(Num);
	End;

If Cont<20 then
	Begin
		For I:=Cont downto 1 do
		Begin
			Fact:=Fact*I;
		End;
	Writeln('el factorial es: ', Fact);
End;
Readkey;
End.
