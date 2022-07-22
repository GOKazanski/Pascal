//Gabriel Omar Kazanski
//gokazanski@gmail.com

//11.Una empresa debe procesar la siguiente información para cada uno de sus empleados: 
//Apellido y Nombre, Cantidad de horas trabajadas al mes y valor hora. 
//El programa debe calcular e informar el importe total que debe abonar el empleador en concepto de sueldos. 
//El ingreso de datos termina cuando el Apellido y Nombre sea ZZZ. 
//El programa debe permitir además premiar a aquellos empleados que trabajaron más de 180 horas al mes incrementando su sueldo total en un 5%

Program TP_006_11;
Uses crt;
Var 
	ApelyNom: string;
	SumaT,Sueldo, ValorH, Horas:Real;

BEGIN
SumaT:=0;

Writeln('Ingrese el apellido y Nombre del Empleado');
Readln(ApelyNom);
ApelyNom:=Upcase(ApelyNom);

	While ApelyNom <>'ZZZ' do
		Begin
			Writeln('Ingrese las horas trabajadas en el mes');
			Readln (Horas);
			IF Horas<220 then
				Begin
					Writeln('Ingrese el Valor de horas');
					Readln (ValorH);
					Sueldo:=Horas*ValorH;
					If Horas>180 then
						Sueldo:=Sueldo*1.05;
				End	
			Else
				Writeln ('Son demasiadas horas');
			
		SumaT:=SumaT+Sueldo;
		Writeln('Ingrese el apellido y Nombre del Empleado');
		Readln(ApelyNom);
		ApelyNom:=Upcase(ApelyNom)	
	End;
	
	Writeln ('El total de Sueldos a pagar es: ',SumaT:2:2);
	Readkey;
END.
