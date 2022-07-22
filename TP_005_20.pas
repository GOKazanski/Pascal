//Gabriel Omar Kazanski
//gokazanski@gmail.com

//20. Se desea cargar los datos de 1000 clientes de la empresa Buenas 
//Vibras que se dedica a armar viajes de solos y solas a distintos lugares del mundo. 
//De cada cliente que viajó con la empresa se tiene nombre y apellido, sexo, dirección, edad, DNI, fecha del viaje y destino. 
//Se pide:
//	a. Verificar cuantos hombres entre 40 y 50 años viajaron a Brasil.
//	b. Cantidad de mujeres entre 20 y 45 años que viajaron a México en la fecha 10/04/2019.
//	c. Mostrar si Felicitas Aguirre, DNI 15.345.123 es cliente de la empresa, de ser así mostrar todos sus datos. 
	//Caso contrario un mensaje que indique “no realizó viajes en esta empresa”
//	d. Promedio de edades de las mujeres que viajaron a Calafate.

Program TP_005_20;
Uses crt;
Var 
	i, Edad, Cont1, Cont2, Cont3 : integer;
	SumaEdades: Real;
	Sexo: Char;
	Nombre, Apellido, Domicilio, Buscado, Destino, DNI, Fecha: String;
	
BEGIN
Cont1:=0; //hombres a brasil
Cont2:=0; //Mujeres a mexico
Cont3:=0; //Mujeres a calafate
SumaEdades:=0;

	For i:=1 to 1000 do
	Begin
		Writeln ('A Continuacion Ingrese los datos del Pasajero');
		
		Writeln ('Ingrese el Apellido');
		Readln (Apellido);
		Apellido:= Upcase (Apellido);
		
		Writeln ('Ingrese los Nombres');
		Readln (Nombre);
		Nombre:= Upcase (Nombre);
		
		Writeln ('Ingrese el Sexo (F/M):');
		Readln (Sexo);
		Sexo:= Upcase (Sexo);	
		
		Writeln ('Ingrese el domicilio');
		Readln (Domicilio);
		
		Writeln ('Ingrese la Edad');
		Readln (Edad);
		
		Writeln ('Ingrese el DNI (Sin Puntos)');
		Readln (DNI);
		
		Writeln ('Ingrese la fecha del Viaje (DD/MM/AAAA)');
		Readln (Fecha);
		
		If (Apellido= 'AGUIRRE') AND (Nombre= 'FELICITAS')AND(DNI= '15345123') then
			Buscado:= (APellido +' ' + Nombre + ', con DNI: '+ DNI + ' Domicilio: '+ Domicilio);
		
		Writeln ('Ingrese el destino del Viaje');
		Readln (Destino);
		Destino:= Upcase (Destino);

		If (Sexo= 'M') and (Edad >= 40) and (Edad <= 50) and (Destino= 'BRASIL') then
			Cont1:= Cont1+1;		
		If (Sexo= 'F') and (Edad >=20) and (Edad <=45) and (Fecha= '10/04/2019')and (Destino= 'MEXICO') then
			Cont2:= Cont2+1;		
		If (Sexo = 'F') and (Destino= 'CALAFATE') then
			Begin
			Cont3:= Cont3 + 1;
			SumaEdades:=SumaEdades + Edad;
			End;
		Clrscr;	
	End;
	Writeln ('La cantidad de Hombres entre 40 y 50 anios viajaron a Brasil: ',Cont1);
	Writeln ('Cantidad de mujeres entre 20 y 45 anios que viajaron a Mexico en la fecha 10/04/2019: ', Cont2);
	Writeln ('Promedio de edades de las mujeres que viajaron a Calafate: ', SumaEdades/Cont3:0:1);	
	If (Buscado > '')Then
		Writeln (Buscado, ' Es clienta de la empresa')
	else
		Begin
		Writeln ('Felicitas Aguirre No realizo viajes en esta empresa');
		End;
	Readkey;	
END.
