//Gabriel Omar Kazanski
//gokazanski@gmail.com
program Tp_005_22;
uses crt;
//22.	Se dispone de la información recopilada del último censo universitario; 
//donde la cantidad de alumnos censados fueron 20000 
//y se desea obtener el porcentaje del estudiantado femenino sobre el total de alumnos 
//y la cantidad de alumnos mayores a 30 años.

var
	i, CF, CA, Edad : integer;
	Sexo : Char;

BEGIN
	CF:=0; //Contador Femenino
	CA:=0; //Contador Alumnos >30
	For i:=1 to 5 do
	Begin
		Writeln ('Ingrese la edad del Alumno');
		Readln (Edad);
		Writeln ('Ingrese el sexo (F - Femenino; M - Masculino)');
		Readln (Sexo);
		Sexo:= Upcase (Sexo);
		If (Sexo= 'F') then
			CF:=CF + 1;
		If (Edad >30) Then
			CA:=CA + 1;
	End;
	Writeln ('El porcentaje de alumnos feminos es de: ', (CF*100/i):2:2);	
	Writeln ('La cantidad de alumnos mayores a 30 anios es de: ', CA);	
	Readkey;
END.
