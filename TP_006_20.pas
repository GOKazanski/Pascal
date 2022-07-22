//Gabriel Omar Kazanski
//gokazanski@gmail.com

//20.Dados los empleados de una empresa con los siguientes datos: nombre y apellido, antigüedad, puesto y sueldo. Se pide:
//a-Cantidad de empleados con más de 20 años de antigüedad.
//b-Total de sueldos
//c-Empleado que más gana
//d-Porcentaje que representa el mayor sueldo sobre el total
//e-Listado de empleados con su incremento, de acuerdo a los siguientes datos: operarios 10%, jefe 15% y gerente 20%

Program TP_006_20;
Uses crt;
Var 
	ApelyNom, ApelyNom2,Puesto : String;
	Antiguedad, ContA: Integer;
	TotalSueldo, Sueldo, Sueldo2: Real;

BEGIN
ContA:=0;	
Sueldo2:=0;
TotalSueldo:=0;
	
Writeln ('Ingresar el Apellido y Nombre');
Readln (ApelyNom);
ApelyNom:=Upcase(ApelyNom);	
	
	While ApelyNom <>'' do
		Begin
			Writeln ('Ingresar la antiguedad');
			Readln (Antiguedad);
			If Antiguedad > 20 then
				ContA:=ContA+1;
				
				Writeln ('Ingrese el Puesto (Gerente, Jefe, Operario)');
				Readln (Puesto);
				Puesto:=Upcase(Puesto);
				Writeln	('Ingrese el Importe del Sueldo');
				Readln(Sueldo);
				If Puesto ='OPERARIO' Then
					Sueldo:=Sueldo*1.1
				Else
					If Puesto='JEFE' then
						Sueldo:=Sueldo*1.15
					Else
						If Puesto= 'GERENTE' then
							Sueldo:=Sueldo*1.2
						Else
							Writeln ('No hay incremento para ese puesto');
							
			If Sueldo2<Sueldo Then
				Begin
					Sueldo2:=Sueldo;
					ApelyNom2:=ApelyNom
				End;
		Writeln ('El empleado: ', ApelyNom,', en el puesto de: ',Puesto,', tendra un sueldo de: $ ',Sueldo:2:2);		
		TotalSueldo:=TotalSueldo+Sueldo;
		Writeln ('Ingresar el Apellido y Nombre');
		Readln (ApelyNom);
		ApelyNom:=Upcase(ApelyNom);	
		End;
	
	Writeln ('La Cantidad de empleados con mas de 20 a#os de antiguedad son: ', ContA);
	Writeln ('El Total de Sueldos es: ',TotalSueldo:2:2);
	Writeln ('El empleado que mas gana es: ',ApelyNom2);
	Writeln ('El mayor sueldo representa el: ',Sueldo2*100/TotalSueldo:2:2);
	Readkey;
END.
