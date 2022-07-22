//Gabriel Omar Kazanski
//gokazanski@gmail.com

//18.Se leen los datos de los clientes de una empresa. De cada uno: apellido y nombre, cliente preferencial (si-no), vendedor, saldo deudor. Se pide:
//a-Procesar la información para cada uno de las tres sucursales que posee la empresa 
//b-Total de deuda por sucursal y total de la empresa.
//c-Total de clientes preferenciales por la empresa
//d-Total de clientes preferenciales por sucursal

Program TP_006_18;
Uses crt;

Var 
	ApelyNom, Vendedor, Cliente:String [30];
	Saldo, Saldo1, Saldo2, Saldo3:Real; 								// Saldos según sucursal
	Sucursal:Byte;
	Vip1, Vip2, Vip3: Integer; 											// Clientes preferenciales según sucursal
	
BEGIN
Saldo1:=0;																// Inicialización de Acumuladores
Saldo2:=0;
Saldo3:=0;
Vip1:=0;																// Inicialización de Contadores
Vip2:=0;
Vip3:=0;

Writeln ('Ingrese Apellido y Nombre del Cliente');
Readln (ApelyNom);

While ApelyNom <> ''do													// Corta el ciclo la no entrada de datos
Begin
	Writeln ('Ingrese si es un Cliente Preferencial, (Si,No)');
	Readln (Cliente);
	Cliente:= Upcase(Cliente);
	Writeln ('Ingrese el saldo Deudor');
	Readln (Saldo);
	Writeln ('Ingrese el Vendedor');
	Readln (Vendedor);
	Writeln ('Ingrese el N de sucursal (1,2,3)');
	Readln (Sucursal);
	Case Sucursal of													// Segun la opcion elejida de sucursal acumula Saldo y cuenta los clientes
		1: Begin
				Saldo1:=Saldo1 + Saldo;
				If (Cliente='SI') Then
					Vip1:=Vip1+1
			End;
		2: Begin
				Saldo2:=Saldo2 + Saldo;
				If (Cliente='SI') Then
					Vip2:=Vip2+1
			End;			
		3: Begin
				Saldo3:=Saldo3 + Saldo;
				If Cliente='SI' Then
					Vip3:=Vip3+1;
			End
		Else
			Writeln ('N de sucursal incorrecta')						// Si coloca sucursal incorrecta no suma saldo
		End;
		
	Writeln ('Ingrese Apellido y Nombre del Cliente');					// Bucle del ciclo
	Readln (ApelyNom);
End; 
	
Writeln ('El Saldo Deudor acumulado en la Sucursal N 1 es: ',Saldo1:2:2);
Writeln ('El Saldo Deudor acumulado en la Sucursal N 2 es: ',Saldo2:2:2);	
Writeln ('El Saldo Deudor acumulado en la Sucursal N 3 es: ',Saldo3:2:2);
Writeln ('El Saldo Deudor acumulado en la Empresa es: ',Saldo1+Saldo2+Saldo3:2:2);			
Writeln ('La cantidad de Clientes Preferenciales de la Sucursal N 1 es: ',Vip1);
Writeln ('La cantidad de Clientes Preferenciales de la Sucursal N 2 es: ',Vip2);	
Writeln ('La cantidad de Clientes Preferenciales de la Sucursal N 3 es: ',Vip3);
Writeln ('La cantidad de Clientes Preferenciales de la Empresa es: ',Vip1+Vip2+Vip3);	
Readkey;
END.
