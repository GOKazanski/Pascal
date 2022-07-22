{	Gabriel Omar Kazanski
	gokazanski@gmail.com

3.	Se desea simular una venta de artículos de tecnología para lo cual se tienen los datos de una factura.
FACTURA

Cliente: Apellido y Nombre 
Forma de pago
Cantidad		Descripción			PrecioUnitario		Subtotal
2				Mouse Inalámbrico	  650.00			 1300.00
1				Impresora 3D		30000.00			30000.00
1				Notebook			60000.00			60000.00
		
												Total	91300.00
}
Program TP_2020_05_29_003;
Uses crt;
Var 
	Cantidad, OpcionMenu, NumProducto: integer;
	Cliente, FormaDePago, Descripcion: string[25];
	Precio, Total: real;
	AuxCliente: boolean;
	
BEGIN

AuxCliente:= false;
	
repeat
	writeln ('-------------------------------------');
	writeln ('----- Menu de ventas            -----');
	writeln ('-------------------------------------');
	writeln ('- 1 - Ingrese el Nombre del Cliente -');
	writeln ('- 2 - Cargar Ventas                 -');
	writeln ('- 3 - Salir                         -');
	writeln ('-------------------------------------');
	readln (OpcionMenu);
	
	Case OpcionMenu of
		
		1: begin
			writeln ('Ingrese el Apellido y Nombre del Cliente');
			readln (Cliente);
			if (Cliente> '') then											// con el bolenano controlo que continue en la opcionn 2
				AuxCliente:= true;
			clrscr;
		end;
		
		2: begin
			if AuxCliente = false then
				begin
					writeln ('Primero ingrese un Cliente');
					readkey;
					clrscr;
				end
				else
					begin
						clrscr;
						writeln ('------------------------------------------');
						writeln ('Cliente: ', Cliente);
						writeln ('------------------------------------------');
						writeln ('Ingrese la forma de Pago');
						readln (FormaDePago);
						
						clrscr;
						writeln ('Ingrese los datos para hacer la factura');
						Writeln ('');						
						writeln ('------------------------------------------');
						writeln ('Cliente: ', Cliente);
						writeln ('------------------------------------------');
						writeln ('Forma de Pago: ', FormaDePago);
						writeln ('------------------------------------------');
						writeln ('Cant Descripcion         Precio   Subtotal');
						writeln ('------------------------------------------');
						
						NumProducto:=0;
						Total:=0;		
							
						gotoxy (1,20);									// con gotoxy ubicas el texto o sentencia siguiente en un lugar de la pantalla
						writeln ('Ingrese la Cantidad');				// x: columna un caracter y:filas 
						readln (Cantidad);						
						
						while Cantidad <> 0 do
						begin
							
							NumProducto:=NumProducto + 1;
							writeln ('Descripcion');
							readln (Descripcion);
							writeln ('valor');
							readln (Precio);
							
							gotoxy (1,9+NumProducto);
							write (Cantidad);
							gotoxy (5,9+NumProducto);
							write (Descripcion);
							gotoxy (25,9+NumProducto);
							write (Precio:2:2);
							gotoxy (34,9+NumProducto);
							write (Cantidad*Precio:2:2);
							
							Total:=Total+ (Cantidad*Precio);
						
						gotoxy (1,20);
						writeln ('                             ');
						writeln ('                             ');
						writeln ('                             ');
						writeln ('                             ');
						writeln ('                             ');
						writeln ('                             ');
						writeln ('                             ');
						writeln ('                             ');
						gotoxy (1,20);
						writeln ('Ingrese la Cantidad');
						readln (Cantidad);							
						end;
						gotoxy (1,9+NumProducto+1);
						writeln ('------------------------------------------');
						writeln ('TOTAL');
						writeln ('------------------------------------------');
						gotoxy (34,9+NumProducto+2);
						writeln (Total:2:2);
						readkey;
						clrscr;
						AuxCliente:= false;
					end;

		end;
		
		3: begin
			writeln ('Gracias por utilizar nuestra Sistema');
			readkey;
			clrscr;
		end;	
		
	Else
		writeln ('Opcion incorrecta, vuelva a elegir un opcion');
		readkey;
		clrscr;
	end;
		
until OpcionMenu = 3;   												// con la opcion 3 se sale
	
END.
