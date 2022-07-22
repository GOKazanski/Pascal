//Gabriel Omar Kazanski
//gokazanski@gmail.com

//12.Calcular las calificaciones de un grupo de alumnos. La nota final de cada alumno se calcula según el siguiente criterio: 
//la parte práctica vale el 10%; la parte de problemas vale el 50% y la parte teórica el 40%. 
//El algoritmo leerá el nombre del alumno, las tres notas, escribirá el resultado y volverá a pedir los datos del siguiente alumno 
//hasta que el nombre sea una cadena vacía. Las notas deben estar entre 0 y 10, si no lo están, no imprimirá las notas, mostrará un mensaje de error y volverá a pedir otro alumno.

Program TP_006_12;
Uses crt;
Var 
	ApelyNom:String;
	NPrac, NProb, NTeor: Integer;
	NotaFinal:Real;
	
BEGIN
Writeln ('Ingrese el Apellido y Nombre del Alumno');
ReadLn (ApelyNom);
	
	While ApelyNom <>'' do
	Begin
		Writeln ('Ingrese la Nota de la Parte Practica');
		Readln (NPrac);
		Writeln ('Ingrese la Nota de la Parte de Problemas');
		Readln (NProb);
		Writeln ('Ingrese la Nota de la Parte Teorica');
		Readln (NTeor);
		If (NPrac<= 10) and (NProb<= 10) and (NTeor <= 10) then
			IF(NPrac>= 0) and (NProb>= 0) and (NTeor >= 0) then
			Begin
				NotaFinal:= NPrac*10/100+NProb*50/100+NTeor*40/100;
				Writeln ('La nota final de: ',ApelyNom,', es de: ',NotaFinal:2:1)
			End
			Else
			Writeln('Ingreso un valor Erroneo')
		Else
			Writeln('Ingreso un valor Erroneo');
	
		Writeln ('Ingrese el Apellido y Nombre del Alumno');
		Readln (ApelyNom);
	End;
	Write ('FIN');
	Readkey;
END.
