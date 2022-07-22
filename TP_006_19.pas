//Gabriel Omar Kazanski
//gokazanski@gmail.com


//19.Se tienen los datos de consumo de los clientes de una empresa telefónica, de cada uno se tienen minutos consumidos y total a pagar. Se pide:
//a-Cargar datos hasta que el usuario los desee.
//b-Realizar un descuento del 20% sobre el monto a pagar si el abonado consumió menos de 180 minutos
//c-Total de abonados que obtuvieron descuento 
//d-Total recaudado
//e-Abonado que más minutos consumió

Program TP_006_19;
Uses crt;
Var 
	Cont, ContB, Minutos, Minutos2, Abonado :Integer;
	Total, Importe, Importe2 :Real;
	
BEGIN
Cont:=0;
ContB:=0;
Total:=0;

Writeln ('Ingrese los minutos consumidos / Ingresar 0 para terminal');
Readln (Minutos);
Minutos2:=Minutos;

	While Minutos <>0 do
		Begin
			Writeln ('Ingrese el mmonto a Pagar');
			Readln(Importe);
			Cont:=Cont+1;
			If Minutos <180 then
				Begin
					Importe:=Importe*0.08;
					ContB:=ContB+1
				End;
			Total:=Total+Importe;
			If Minutos2<Minutos then
				Begin
					Abonado:=Cont;
					Minutos2:=Minutos;
					Importe2:=Importe;
				End;	
		
		Writeln ('Ingrese los minutos consumidos / Ingresar 0 para terminal');
		Readln (Minutos);
		End;
	
	Writeln ('El total recaudado es de: ',Total:2:2);
	Writeln ('La cantidad de clientes beneficiados con el descuento: ', ContB);
	Writeln ('El Cliente que mas consumio fue el N: ',Abonado,', Minutos Consumidos: ',Minutos2,', Con un importe de: ',Importe2:2:2);
	Readkey;
END.
