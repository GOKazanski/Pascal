{
Grupo BacKGaMmon
				-Gabriela Burgos
				-Claudio Gonzalez
				-Gabriel Kazanski
}

unit Salir_BacKGaMmon;
{$codepage utf8}

interface // Parte pública, que se comparte

uses
	wincrt,crt,graph;

procedure salida;

implementation // Parte privada de la unit

var
	drive,modo:integer;

procedure initgrafico;
begin
	drive:=detect;
	initgraph (drive,modo,'');
end;

procedure salida;
var
	salir, x1, y1, base, i:integer;
	ang:real;
begin
	salir:=0;
	ang:=0;
	initgrafico; // Procedimiento para abrir la parte gráfica
	setcolor (3); // Cambia el color de los gráficos
	Rectangle (0,0,640,480); // Forma un rectángulo
	Rectangle (5,5,635,475); // Forma un rectángulo
	SetTextStyle (2,0,7); // Cambia la forma y tamaño de la letra
	setcolor (13); // Cambia el color de los gráficos
	OutTextXY (45,40,'BacKGaMmon'); // Posiciona a que distancia del margen Izquierdo y a que altura comienza el texto
	OutTextXY (46,41,'BacKGaMmon');
	OutTextXY (47,42,'BacKGaMmon');
	OutTextXY (48,43,'BacKGaMmon');
	OutTextXY (49,44,'BacKGaMmon');
	setcolor (15); // Cambia el color de los gráficos
	OutTextXY (50,45,'BacKGaMmon');

	SetFillStyle (1,2);  // Cambia la forma y color de relleno 
	Bar (10,100,630,470); // Hace un cuadrado

	base:=10;
	for i:=1 to 6 do
		begin
		setcolor (1); // Cambia el color de los gráficos
		line (base,468,base+25,300); // Dibuja una línea según las coordenadas
		line (base+50,468,base+25,300);
		line (base,468,base+50,468);
		line (base+52,102,base+77,270);
		line (base+102,102,base+77,270);
		line (base+52,102,base+102,102);

		setcolor (15); // Cambia el color de los gráficos
		line (base+52,468,base+77,300);
		line (base+102,468,base+77,300);
		line (base+52,468,base+102,468);
		line (base,102,base+25,270);
		line (base+50,102,base+25,270);
		line (base,102,base+50,102);

		base:=base+103; // Va cambiando desde donde comienza la línea en cada ciclo

		end;

	repeat // Secuencia para hacer todas las fichas
		setcolor (12); // Cambia el color de los gráficos
		x1:=round(13*cos(ang)); // Hace el cálculo del punto del ángulo para X
		y1:=round(13*sin(ang)); // Hace el cálculo del punto del ángulo para Y

		putpixel(x1+344,y1+455,12); // Dibuja el punto según las coordenadas
		line(344,455,x1+344,y1+455); // Dibuja una línea según las coordenadas
		putpixel(x1+344,y1+427,12);
		line(344,427,x1+344,y1+427);
		putpixel(x1+344,y1+399,12);
		line(344,399,x1+344,y1+399);
		putpixel(x1+344,y1+371,12);
		line(344,371,x1+344,y1+371);
		putpixel(x1+344,y1+343,12);
		line(344,343,x1+344,y1+343);
		putpixel(x1+344,y1+315,12);
		line(344,315,x1+344,y1+315);

		putpixel(x1+241,y1+455,12);
		line(241,455,x1+241,y1+455);
		putpixel(x1+241,y1+427,12);
		line(241,427,x1+241,y1+427);
		putpixel(x1+241,y1+399,12);
		line(241,399,x1+241,y1+399);

		putpixel(x1+35,y1+115,12);
		line(35,115,x1+35,y1+115);
		putpixel(x1+35,y1+143,12);
		line(35,143,x1+35,y1+143);
		putpixel(x1+35,y1+171,12);
		line(35,171,x1+35,y1+171);
		putpixel(x1+35,y1+199,12);
		line(35,199,x1+35,y1+199);
		putpixel(x1+35,y1+227,12);
		line(35,227,x1+35,y1+227);
		putpixel(x1+35,y1+255,12);
		line(35,255,x1+35,y1+255);

		putpixel(x1+602,y1+115,12);
		line(602,115,x1+602,y1+115);
		putpixel(x1+602,y1+143,12);
		line(602,143,x1+602,y1+143);

		setcolor (16); // Cambia el color de los gráficos

		putpixel(x1+344,y1+115,12);
		line(344,115,x1+344,y1+115);
		putpixel(x1+344,y1+143,12);
		line(344,143,x1+344,y1+143);
		putpixel(x1+344,y1+171,12);
		line(344,171,x1+344,y1+171);
		putpixel(x1+344,y1+199,12);
		line(344,199,x1+344,y1+199);
		putpixel(x1+344,y1+227,12);
		line(344,227,x1+344,y1+227);
		putpixel(x1+344,y1+255,12);
		line(344,255,x1+344,y1+255);

		putpixel(x1+241,y1+115,12);
		line(241,115,x1+241,y1+115);
		putpixel(x1+241,y1+143,12);
		line(241,143,x1+241,y1+143);
		putpixel(x1+241,y1+171,12);
		line(241,171,x1+241,y1+171);

		putpixel(x1+35,y1+455,12);
		line(35,455,x1+35,y1+455);
		putpixel(x1+35,y1+427,12);
		line(35,427,x1+35,y1+427);
		putpixel(x1+35,y1+399,12);
		line(35,399,x1+35,y1+399);
		putpixel(x1+35,y1+371,12);
		line(35,371,x1+35,y1+371);
		putpixel(x1+35,y1+343,12);
		line(35,343,x1+35,y1+343);
		putpixel(x1+35,y1+315,12);
		line(35,315,x1+35,y1+315);

		putpixel(x1+602,y1+455,12);
		line(602,455,x1+602,y1+455);
		putpixel(x1+602,y1+427,12);
		line(602,427,x1+602,y1+427);

		inc (salir);
		ang:=ang-(1/100)
	until salir > 628;
	delay (1500); // Lapso de Reloj

	for i:=0 to 4 do
	begin
		SetFillStyle (9,16);  // Cambia la forma y color de relleno 
		Bar (0,0,640,480); // Hace un cuadrado
		SetTextStyle (3,0,9); // Cambia la forma y tamaño de la letra
		setcolor (13); // Cambia el color de los gráficos
		if i=1 then
			OutTextXY (300,200,'3');
			if i=2 then
				OutTextXY (300,200,'2');
				if i=3 then
					OutTextXY (300,200,'1');
					if i=4 then
					OutTextXY (200,200,'Chau!!');
	end;
		delay (2000); // Lapso de Reloj
	closegraph; // Cierra el modo gráfico
end;

BEGIN
END.
