//Gabriel Omar Kazanski
//gokazanski@gmail.com

//15.Dada la siguiente situación: se dispone de un mazo de cartas españolas. Se debe sacar la primera carta y separarla. 
//Luego sacar de a una carta por vez hasta encontrar una del mismo palo y número mayor a la primera. 
//El problema planteado es determinar cuántas cartas fue necesario extraer del mazo.

Program TP_006_15;

Var	
	num_elegido,num,Cartas:byte;
	palo_elegido,palo: String[10];
	Cont:Integer;
	
BEGIN
	Cartas:= 0;
	Cont:=0;
	
	Writeln('ingrese el palo de la carta elegida');
	readln(palo_elegido);
	Writeln('ingrese el numero de la carta elegida');
	readln(num_elegido);


	Writeln('ingrese palo de la carta sacada');
	readln(palo);
	Writeln('ingrese el numero de la carta sacada');
	Readln(num);
	
	while (palo<>palo_elegido) or (num<=num_elegido) do
		begin
			inc(cont);
			writeln('ingrese palo de la carta sacada');
			readln(palo);
			writeln('ingrese el numero de la carta sacada');
			readln(num);
		end;

	writeln('la cantidad de cartas sacadas fueron: ',cont);

END.





