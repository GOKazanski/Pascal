//Gabriel Omar Kazanski
//gokazanski@gmail.com

//14.Se pide cargar los empleados de una empresa (no se conoce la cantidad),
//de cada uno se tiene el nombre, sueldo, antigüedad y sexo de los mismos, 
//se pide listar para cada empleado, el nombre y sueldo considerando un aumento del 10% si la antigüedad supera los 5 años. 
//Informar también la cantidad de empleados con antigüedad superior a 5 años, el porcentaje de empleados y el de empleadas.
   
Program TP_006_14;
Uses crt;
Var 
	NomyApe, Sexo:String[30];
	Sueldo: Real;
	Antig, CantEmp, CantHom, CantMuj, CantMay: Integer;
	
BEGIN
CantEmp:=0;
CantHom:=0;
CantMuj:=0;	
CantMay:=0;
	
Writeln('Ingrese el Nombre');
Readln (NomyApe);
	While NomyApe <>'' do
	Begin
		Writeln ('Ingrese el Sexo');
		Readln (Sexo);
		Writeln('Ingrese sueldo');
		Readln(Sueldo);
		Writeln('Ingrese antiguedad');
		Readln(Antig);
		CantEmp:=CantEmp+1;
		If Antig>5 then
			Begin
				Sueldo:=Sueldo*1.10;
				CantMay:=CantMay+1;
			End;
		Writeln ('El Nombre del empleado es: ', NomyApe, ', el sueldo es: ', Sueldo);
		If Sexo='MUJER' then
			CantMuj:=CantMuj + 1
		Else
			CantHom:=CantHom+1;
		
		Writeln('Ingrese el Nombre');
		Readln (NomyApe);
	End;
	
	Writeln('La cantidad de empleados con antiguedad mayor a 5 años es: ', CantMay);
	Writeln('el porcentaje de mujeres es: ', (CantMuj*100)/CantEmp:2:2);
	Writeln('el porcentaje de hombre es: ', (CantHom*100)/CantEmp:2:2);
	Readkey;
		
END.
