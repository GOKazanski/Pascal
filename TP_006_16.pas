//Gabriel Omar Kazanski
//gokazanski@gmail.com

//16.Se dispone de un conjunto de tarjetas rojas y azules, las cuales están numeradas en forma correlativa. 
//El lote de tarjetas termina con una tarjeta blanca. El problema es determinar de las tarjetas del lote: 
//cuántas son azules y con número par; cuántas son rojas y con número impar, y cuántas son las restantes (excepto la blanca).

Program TP_006_16;
Uses crt;
Var 
	Color: String[10];
	Cont, ContA, ContR, ContO:Integer;
	
BEGIN
Cont:=0;
ContA:=0;
ContR:=0;
ContO:=0;

Writeln ('Ingrese el Color de la tarjeta (Azul - Roja / Blanca para terminar)');
Readln (Color);
Color:=Upcase(Color);

	While Color <> 'BLANCA' do
	Begin
		Cont:= Cont+1;
		If (Cont mod 2=0) and (Color='AZUL') Then
			ContA:=ContA+1
		Else
			If (Cont Mod 2 <>0) and (Color='ROJA') then
				ContR:=ContR+1
			Else
				ContO:=ContO+1;
			
	Writeln ('Ingrese el Color de la tarjeta (Azul - Roja / Blanca para terminar)');
	Readln (Color);
	Color:=Upcase(Color);
	End;
	
	Writeln ('La cantidad de Tarjetas Azules y N par son: ', ContA);
	Writeln ('La cantidad de Tarjetas Rojas y N impar son: ', ContR);
	Writeln ('La cantidad de Tarjetas restantes son: ', ContO);
	Readkey;
END.
