//Gabriel Omar Kazanski
//gokazanski@gmail.com

//21.Se tienen los datos de 1000 usuarios de INTI, de cada uno se tienen: razón social, actividad y fondos que han recibido del estado para I+D+I ($). Se pide:
//a-Cuantos usuarios se dedican a la actividad avícola y cuantos a la porcina 
//b-Total de fondos percibidos del estado por los usuarios
//c-Porcentaje que representan los fondos estatales recibidos por el sector avícola sobre el total.
//d-Determinar si las Camelias es usuario de INTI y si es así mostrar si percibe fondos del estado.

Program untitled;
Uses crt;
Var 
	i: Integer;															// Variable para el For
	ContAvi, ContPoc :Integer;											// Contadores
	Actividad: Char;													// OPción para el Case														
	RazonSocialBusq, RazonSocial, Actividad :String;
	Fondos :Real;

BEGIN
ContAvi:=0;																// Inicialización de Contadores
ContPoc:=0;

Writeln ('Ingrese la Razon Social a Buscar');
Readln (RazonSocialBusq)

Writeln ('Ingrese la Actividad');
Readln (Actividad)

Writeln ('Ingrese el Monto Recibido por Estado');
Readln (RazonSocialBusq)

Writeln ('Ingrese la Razon Social a Buscar');
Readln (RazonSocialBusq)

Writeln ('Ingrese la Razon Social a Buscar');
Readln (RazonSocialBusq)

	For i:=1 to 5 do 													//For i:=1 to 1000 do
	Begin

		

	
	End;
	Writeln ('El resultado de la Suma es: ', Suma);
	Writeln ('El resultado del producto es: ', Producto:0:2);
	Readkey;
END.
