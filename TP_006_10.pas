//Gabriel Omar Kazanski
//gokazanski@gmail.com

//10.Realice un algoritmo que resuelva el siguiente problema: En una empresa que tiene N empleados, se requiere realizar un algoritmo que, dados los nombres, 
// 	las edades, el género y el sueldo de las personas calcule:
//a-Promedio de sueldos del total de empleados.
//b-Cantidad de hombres de edad mayor a 60 años.
//c-Empleado que más gana y todos sus datos (suponer que es uno solo).
//d-Informar además aquellos empleados con más 70 años, con un mensaje que están  en edad de jubilarse.


Program TP_006_10;
Uses crt;
Var 
	Apellido, Apellido2, Genero, Genero2: String[60];
	Edad, Edad2,Cont, ContH: Integer;
	Sueldo, AcuSueldo, SueldoMax: Real;
	Jubilados: Boolean;

BEGIN
Cont:=0;
AcuSueldo:=0;
ContH:=0;
SueldoMax:=0;
Jubilados:=false;

Writeln('Ingrese el apellido');
Readln(Apellido);
While Apellido <>'' do
Begin
     Writeln('Ingrese el sueldo');
     Readln(Sueldo);
     Writeln('ingrese la edad');
     Readln(Edad);
     Writeln('Ingrese el género');
     Readln(Genero);
     Genero:= Upcase (Genero);
     AcuSueldo:= AcuSueldo + Sueldo;
     Cont:= Cont+1;
     If (Edad>60) and (Genero='HOMBRE') then
		ContH:= ContH+1;
     If SueldoMax < Sueldo then
		Begin
			SueldoMax:= Sueldo;
			Apellido2:= Apellido;
			Edad2:= Edad;
			Genero2:= Genero;
		End;
     If Edad > 70 then
		jubilados:= true;

     Writeln('ingrese el apellido');
     Readln(Apellido);
End;

Writeln('el promedio de sueldos es: ', AcuSueldo/Cont:2:2);
Writeln('la cantidad de hombres mayores a 60 años es: ', ContH);
Writeln('el sueldo mayor es: ', SueldoMax:2:2, ' el nombre es: ', Apellido2, ' la edad es: ', Edad2, ' y el genero es: ', Genero2);
If jubilados=true then
Writeln('hay personas en edad de jubilarse');
Readkey;
END.
