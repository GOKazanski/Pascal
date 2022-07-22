//Gabriel Omar Kazanski
//gokazanski@gmail.com

//13.Se debe ingresar la nota de cada uno de los alumnos de un curso (indicando con nota = 99 para finalizar el ingreso). 
//El programa debe calcular e informar la cantidad de aplazados y de aprobados y además los porcentajes que representan dichos valores en relación al total de alumnos examinados.
   
Program TP_006_13;
Uses crt;
Var 
	Nota :Real;
	ContAlum, CantApla, CantApro: integer;

BEGIN
ContAlum:=0;
CantApla:=0;
CantApro:=0;
	
	Writeln('Ingrese las notas de 0 a 10, para salir "99"');
	Readln(Nota);
	While Nota<>99 do
	Begin
		If (Nota >=0) and (Nota<=10) then
			Begin	
				ContAlum:=ContAlum+1;
				If Nota <6 Then
					CantApla:=CantApla+1
				Else
					CantApro:=CantApro+1;
			End
		Else	
		Writeln ('Ingreso una nota incorrecta');
		
		Writeln('Ingrese la nota');
		Readln(Nota);
	End;
		
	Writeln('La cantidad de de Alumnos Aplazados son: ', CantApla,'. El Porcentaje es: ',CantApla*100/ContAlum:2:2,'%');
	Writeln('La cantidad de de Alumnos Aprobados son: ', CantApro,'. El Porcentaje es: ',CantApro*100/ContAlum:2:2,'%');
	Readkey;
END.
