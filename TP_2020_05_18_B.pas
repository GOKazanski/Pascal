{	Gabriel Omar Kazanski
	gokazanski@gmail.com
	
EJERCICIO PARA RESOLVER EN CLASE LUNES 18-05
1. Se tienen los cobradores de una empresa de seguridad con sus respectivos clientes asignados. 
	De cada uno se lee apellido y nombre, plan (A o B) y cuota. Se pide:
	a. Procesar los datos, los mismos están ordenados por cobrador.
b. Mostrar la cantidad de clientes por plan, por cobrador y en la empresa.
c. Calcular total recaudado por cobrador y por la empresa.
d. Mostrar cual cobrador recaudó más dinero.
e. Indicar que porcentaje representa el monto anterior en el total recaudado.
f. Indicar si Mario Moren es cliente de la empresa, si es así mostrar sus datos además del cobrador asignado.
g. Mostrar total de cobradores que posee la empresa. 
}

Program TP_2020_05_18;
Uses crt;
Var
	Plan: char;
	ContClientesA, ContClientesB, TotalClientesCob,TotalClientesEmp,TotalClientesEmpA,TotalClientesEmpB, TotalCobradores: Integer;
	Cobrador,CobradorBuscado, CobradorMax, Clientes, ClienteBuscado: String [25];
	Cuota, CuotaCobrador, CuotaCobradorMax, CuotaEmpresa: Real;
	ClienteBuscadotrue: boolean; 
	
BEGIN
{ Inicializas los contadores. Necesitas para contar y acumumular para cada
	Cobrador y también para la empresa.
}
ContClientesA:=0;
ContClientesB:=0;
CuotaCobrador:=0;
Cuota:=0;
CuotaEmpresa:=0;
CuotaCobradorMax:=0;
TotalClientesCob:=0;
TotalClientesEmpA:=0;
TotalClientesEmpB:=0;
ClienteBuscadotrue:=False;
TotalClientesEmp:=0;
TotalCobradores:=0;	
		
	Writeln ('Ingrese Cliente Buscado');
	Readln (ClienteBuscado);
	ClienteBuscado:=Upcase(ClienteBuscado);
	ClrScr;	
	
{ Como no sabes la cantidad de cobradores y de Clientes necesitamos un mientras (while)
	Comienza con un Begin y termina con un End;
	Como tenes que saber la cantidad de cada cobrador al finanizar el
	ciclo tenes que poner los contadores otra vez a valor cero, sino
	el proximo contador va acumular lo del cobrador anterior
}
	Writeln('Ingrese el Nombre del Cobrador'); 		
	Readln(Cobrador);
	Cobrador:=Upcase (Cobrador);
	
	While Cobrador <>'' do												// Comienza el Ciclo para Cobradores
		Begin		
			TotalCobradores:=TotalCobradores+1;
		
			Writeln('Ingrese el Nombre del Cliente');
			Readln (Clientes);
			Clientes:= upcase(clientes);								// Upcase pasa todo el texto a MAYUSCULA

			While Clientes <> '' do										// También necesitas un mientras para controlar los clientes
				Begin
					TotalClientesCob:=TotalClientesCob+1;

 						Repeat  
							Writeln('Ingrese el plan (A o B)');			// Con un repetir controlas que solo ingrese las opciones que queres,
							Readln (Plan);	
							Plan:= Upcase (Plan);
						Until (Plan= 'A') or (Plan='B'); 				// hasta que no se cumpla no sale.
						
						If  Plan='A' then
							ContClientesA:=ContClientesA+1
							Else 
								ContClientesB:=ContClientesB+1;			
			
						Writeln ('Ingrese el Valor de la Cuota');
						readln (Cuota);
						CuotaCobrador:=CuotaCobrador+Cuota;
					
						If Clientes = ClienteBuscado Then 				// aca controla si el cliente buscado fue ingresado
							Begin
								ClienteBuscadotrue:=True; 				// si es así, convierte el dato en verdadero
								CobradorBuscado:=Cobrador; 				// Aca guardo el dato del cobrador que tiene a ese cliente
							End;
						
					ClrScr;												// esto es limpiar pantalla
					Writeln('Ingrese el Nombre del Cliente'); 			// Aca se renueva el ciclo de clientes
					Readln (Clientes);
					Clientes:= upcase(clientes);
				End;													// En este end termina el Ciclo de Clientes
			ClrScr;
			Writeln ('Resumen del Cobrador: ', Cobrador); 				// Cuando no hay mas clientes del cobrador te muestra un resumen
			Writeln ('Clientes en total: ', TotalClientesCob);
			Writeln ('Clientes del Plan A: ', ContClientesA); 
			Writeln ('Clientes del Plan B: ', ContClientesB); 			
			Writeln ('Total cobrado: ', CuotaCobrador:2:2);
	
			If CuotaCobradorMax< CuotaCobrador then 					// aca guardamos que cobrador cobro mas
				Begin 
				CuotaCobradorMax:=CuotaCobrador;
				CobradorMax:= Cobrador
				End;
		
			CuotaEmpresa:=CuotaEmpresa+CuotaCobrador;					// Desde aca acumulamos la información para los totales de la empresa	
			TotalClientesEmp:= TotalClientesEmp + TotalClientesCob;
			TotalClientesEmpA:=TotalClientesEmpA+ ContClientesA;
			TotalClientesEmpB:=TotalClientesEmpB+ ContClientesB;
	
			ContClientesA:=0;											// Desde aca se ponen los contadores a cero para el proximo cobrador
			ContClientesB:=0;
			TotalClientesCob:=0;
			CuotaCobrador:=0;
			Readkey;
			ClrScr;
			
			Writeln('Ingrese el Nombre del Cobrador'); 					// aca renovas el ciclo para el proximo cobrador
			Readln(Cobrador);
			Cobrador:=Upcase (Cobrador);
	
		End;															// Este el Fin del Ciclo de Cobradores
	
	Writeln ('El total cobrado por la Empresa: ', CuotaEmpresa:2:2);	// cuando no hay mas cobradores muestra el resumen de la empresa
	Writeln ('Total de Cobradores: ', TotalCobradores);
	Writeln ('Total de Clientes de la Empresa: ', TotalClientesEmp);
	Writeln ('Total de Clientes plan A de la Empresa: ', TotalClientesEmpA);	
	Writeln ('Total de Clientes plan B de la Empresa: ', TotalClientesEmpB);	
	Writeln ('El cobrador que mas recaudo: ',CobradorMax, ' La cobranza representa el ', CuotaCobradorMax*100/CuotaEmpresa:2:2,'%');
	If ClienteBuscadoTrue= true Then 									// si el dato de cliente buscado es verdadero va mostrarlo junto a su cobrador asignado
		Writeln ('El cliente buscado: ', ClienteBuscado, ' fue ingresado en la lista de: ', CobradorBuscado)	
	Else	
		Writeln ('El cliente buscado: ', ClienteBuscado, ' No fue ingresado.');
	Readkey;
END.
