{
Grupo BacKGaMmon
				-Gabriela Burgos
				-Claudio Gonzalez
				-Gabriel Kazanski
}

unit Circulo_BacKGaMmon;
{$codepage utf8}

interface // Parte pública, que se comparte

uses
	wincrt,graph,crt;

procedure circulo(porc1,porc2,porc3:real; prov:string; opc:char; valor0,valor1,valor2,valor3:string);

implementation // Parte privada de la unit

var
	drive,modo : integer;

procedure initgrafico;
begin
	drive:=detect;
	initgraph(drive,modo,'');
end;

procedure circulo(porc1,porc2,porc3:real; prov:string; opc:char; valor0,valor1,valor2,valor3:string);
var
	salir1,salir2,salir3,x1,y1,xc,yc,radio :integer;
	ang:real;
	por1,por2,por3:string;

begin
	initgrafico; // Procedimiento para abrir la parte gráfica
	xc:=120; // Posición del Círculo según X
	yc:=160; // Posición del Círculo según Y
	radio:=90; // Radio del circulo
	ang:=0; // Comienza con ángulo cero
	salir1:=0;
	salir2:=0;
	salir3:=0;
	str(porc1:2:2,por1); // Pasa el número a texto
	str(porc2:2:2,por2); // Pasa el número a texto
	str(porc3:2:2,por3); // Pasa el número a texto
	setcolor (3); // Cambia el color de los gráficos
	SetTextStyle (5,0,2); // Cambia la forma y tamaño de la letra
	OutTextXY (20,20,'Resultados de ' + prov + '. Cantidad de personas: ' + valor0);

		repeat // Secuencia para graficar la torta de porcentaje 1
			setcolor (12); // Cambia el color de los gráficos
			x1:=round(radio*cos(ang)); // Hace el cálculo del punto del ángulo para X
			y1:=round(radio*sin(ang)); // Hace el cálculo del punto del ángulo para Y
			putpixel(x1+xc,y1+yc,12); // Dibuja el punto según las coordenadas
			line(xc,yc,x1+xc,y1+yc); // Dibuja una línea según las coordenadas
			inc (salir1); // incrementa la variable 
			ang:=ang-(1/100); // Hace que el ángulo vaya dibujandose a contra reloj
		until salir1 > 628*porc1/100; // Sale de la secuencia. 628 es el tope para hacer toda una circunferencia

		repeat // Secuencia para graficar la torta de porcentaje 2
			setcolor (15); // Cambia el color de los gráficos
			x1:=round(radio*cos(ang)); // Toma el valor del ángulo de la secuencia anterior
			y1:=round(radio*sin(ang));
			putpixel(x1+xc,y1+yc,15);
			line(xc,yc,x1+xc,y1+yc);
			inc (salir2);
			ang:=ang-(1/100);
		until salir2 > 628*porc2/100;

		repeat // Secuencia para graficar la torta de porcentaje 3
			setcolor (10); // Cambia el color de los gráficos
			x1:=round(radio*cos(ang));
			y1:=round(radio*sin(ang));
			putpixel(x1+xc,y1+yc,10);
			line(xc,yc,x1+xc,y1+yc);
			inc (salir3);
			ang:=ang-(1/100);
		until salir3 > 628*porc3/100;

		if (opc='1') or (opc='4') then // Según la opción mostrará el texto
			begin
				setcolor (12); // Cambia el color de los gráficos
				OutTextXY (250,80, por1+ ' % de infectados Activos. Cantidad de personas: '+valor1);
				setcolor (15); // Cambia el color de los gráficos
				OutTextXY (250,140,por2+ ' % de infectados Recuperados. Cantidad de personas: '+valor2);
				setcolor (10); // Cambia el color de los gráficos
				OutTextXY (250,200,por3+ ' % de infectados Fallecidos. Cantidad de personas: '+valor3);
			end
		else
			if (opc='2') or (opc='5') then // Según la opción mostrará el texto
				begin
					setcolor (12); // Cambia el color de los gráficos
					OutTextXY (250, 80,por1+ ' % Contagio Directo. Cantidad de personas: '+valor1);
					setcolor (15); // Cambia el color de los gráficos
					OutTextXY (250,140,por2+ ' % Contagio por Transmision Comunitaria. Cantidad de personas: '+valor2);
					setcolor (10); // Cambia el color de los gráficos
					OutTextXY (250,200,por3+ ' % Contagio de forma Desconocida. Cantidad de personas: '+valor3);
				end
			else
				if (opc='3') or (opc='6') then // Según la opción mostrará el texto
					begin
						setcolor (12); // Cambia el color de los gráficos
						OutTextXY (250, 80,por1+ ' % Menores de 18 Anios. Cantidad de personas: '+valor1);
						setcolor (15); // Cambia el color de los gráficos
						OutTextXY (250,140,por2+ ' % Mayores de 18 y menores de 50 anios. Cantidad de personas: '+valor2);
						setcolor (10); // Cambia el color de los gráficos
						OutTextXY (250,200,por3+ ' % Mayores de 50 anios. Cantidad de personas: '+valor3);
					end;

	readkey;
	closegraph; // Cierra el modo gráfico
end;

begin
end.
