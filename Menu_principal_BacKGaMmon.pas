{
Grupo BacKGaMmon
				-Gabriela Burgos
				-Claudio Gonzalez
				-Gabriel Kazanski
}

unit Menu_principal_BacKGaMmon;
{$codepage utf8}

interface // Parte pública, que se comparte

uses 
	wincrt,crt,graph,Fecha_BacKGaMmon;

procedure Menu_principal (var opc:char);

implementation // Parte privada de la unit

var
	drive,modo:integer;

procedure initgrafico;
begin
	drive:=detect;
	initgraph(drive,modo,'');
end;

procedure menu_principal (var opc:char);
var
	hoy:string;
begin
	initgrafico; // Procedimiento para abrir la parte gráfica
	setcolor (3); // Cambia el color de los gráficos
	Rectangle (5,5,805,255); // Forma un rectángulo
	Rectangle (6,6,804,254); // Forma un rectángulo
	Rectangle (7,7,803,253); // Forma un rectángulo
	Rectangle (8,8,802,252); // Forma un rectángulo
	Rectangle (9,9,801,251); // Forma un rectángulo
	Rectangle (10,10,800,250); // Forma un rectángulo
	line (10,50,800,50); // Forma una línea
	line (10,51,800,51); // Forma una línea
	line (10,52,800,52); // Forma una línea
	line (10,83,800,83); // Forma una línea
	line (10,84,800,84); // Forma una línea
	line (10,85,800,85); // Forma una línea
	setcolor (9); // Cambia el color de los gráficos
	SetTextStyle (2,0,2); // Cambia la forma y tamaño de la letra
	OutTextXY (50,22,'Sistema Estadistico de Datos COD VID - 19'); // Posiciona a que distancia del margen Izquierdo y a que altura comienza el texto
	OutTextXY (110,60,'Elija una de las opciones del menu');
	setcolor (10); // Cambia el color de los gráficos
	OutTextXY (20,100,'1 - Pacientes - Alta/Baja/Modidicacion/Consulta');
	OutTextXY (20,130,'2 - Listados');
	OutTextXY (20,160,'3 - Estadistica');
	OutTextXY (20,190,'4 - Configuracion');
	setcolor (4); // Cambia el color de los gráficos
	OutTextXY (20,220,'5 - Salir');

	setcolor (9); // Cambia el color de los gráficos
	fecha_de_hoy (hoy); // llama al procedimiento de la unit Fecha_BacKGaMmon
	OutTextXY (20,270,hoy);

	opc:=readkey; // Toma la opción con solo teclear 
	if opc in ['1'..'5'] then // si la opción está en el conjunto correcta
		else // si la opción NO está en el conjunto correcta
			begin
				setcolor (9); // Cambia el color de los gráficos
				OutTextXY (20,300,'Opcion incorrecta');
				delay (2000) // Lapso de Reloj
			end;
	closegraph; // Cierra el modo gráfico
end;

begin
end.
