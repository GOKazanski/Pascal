//Gabriel Omar Kazanski
//gokazanski@gmail.com

//se leen los datos de las personas interesadas en adquirir un plan para comprar un auto en cuotas,
//de cada uno se lee apellido y nombre, sueldo, marca y modelo de auto (fiat siena, Volkswagen UP, renault sandero) y valor cuota;
//Los aspirantes serán aceptados en el plan solo si la cuota representa el 20% del sueldo. Se pide cantidad de aspirantes y de ahorristas (clientes) por plan (TAREA PARA EL HOGAR)

Program Plan_autos;
Uses crt;
Const                 //define una constante
Porc=0.20;
Var
marcaymodelo, ContAspFS, ContFS, ContAspVU, ContVU, ContAspRS, ContRS:word;  // ContAsp = Aspirantes ; Cont = Clientes
apynom:string[60];
ValorCuota, Sueldo:real;
tecla:char;

begin
ContAspFS:=0;
ContFS:=0;
ContAspVU:=0;
ContVU:=0;
ContAspRS:=0;
ContRS:=0;

Writeln('¿Desea ingresar un nuevo cliente?. Presione s para cargar n para salir');
Readln (tecla);
	While (tecla='s') or (tecla='S') do
	begin
		Writeln('ingrese apellido y nombre: ');
		Readln(apynom);
		Writeln('ingrese valor cuota: ');
		Readln(ValorCuota);
		Writeln('ingrese sueldo: ');
		Readln(Sueldo);
		Writeln('Ingrese la opcion: ');
		Writeln ('1 - Fiat Siena');
		Writeln ('2 - Volkswagen UP');
		Writeln ('3 - Renault Sandero');
		Readln(marcaymodelo);
		Case marcaymodelo of
			1: If (Sueldo*Porc>=ValorCuota) then
					ContFS:=ContFS+1
				Else
					ContAspFS:=ContAspFS+1;
			2: If (Sueldo*Porc>=ValorCuota) then
					ContVU:=ContVU+1
				Else
					ContAspVU:=ContAspVU+1;			
			3: If (Sueldo*Porc>=ValorCuota) then
					ContRS:=ContRS+1
				Else
					ContAspRS:=ContAspRS+1;	
		Else
			Writeln ('No eligió correctamente')
		End;
	Writeln('¿Desea ingresar un nuevo cliente?. Presione s para cargar n para salir');
	Readln(tecla);                    
	End;
	
Writeln ('La cantidad de ahorristas para el Plan Fiat Siena son: ', ContFS, ' y de Aspirantes: ',ContAspFS);
Writeln ('La cantidad de ahorristas para el Plan Volkswagen UP son: ', ContVU,' y de Aspirantes: ',ContAspVU);
Writeln ('La cantidad de ahorristas para el Plan Renault Sandero son:',ContRS,' y de Aspirantes: ',ContAspRS);

Readkey;
End.                                               
