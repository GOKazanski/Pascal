{
Grupo BacKGaMmon
				-Gabriela Burgos
				-Claudio Gonzalez
				-Gabriel Kazanski
}

unit Listados_BacKGaMmon;
{$codepage utf8}

interface // Parte pública, que se comparte

uses
	crt,
	ABMC_BacKGaMmon,Configuracion_BacKGaMmon;

const
	ruta_I='infectados.dat'; // ubicacion del archivo
	ruta_E='estadisticas.dat'; // ubicacion del archivo
	ruta_P='provincias.dat'; // ubicacion del archivo

var
	archivo_P:fichero_P;

procedure menu_listados;

implementation // Parte privada de la unit


// Procedimiento del Menú de Listados
procedure menu_listados;
var
	opcion:char;
	aux_condicion,encontrado:boolean;
	aux_denominacion:string;
	codigo_provincia:byte;
	ubicacion:integer;

begin
	TextColor(7); // Cambia color de Texto
	TextBackground(3); // Cambia color de Fondo

	assign(archivo_I, ruta_I); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
	reset(archivo_I); // reset: abre un fichero para lectura.
	orden_burbuja_I_Apellido (archivo_I); // ordenda los registros por Apellido
	close (archivo_I); // cierra el archivo


	repeat
		clrscr; // Limpia la pantalla
		writeln ('------------------------------------------');
		writeln ('-             menu Listados              -');
		writeln ('------------------------------------------');
		writeln ('- Elija una opción                       -');
		writeln ('------------------------------------------');
		writeln ('- 1 - Provincias                         -');
		writeln ('------------------------------------------');
		writeln ('- Pacientes Nacionales                   -');
		writeln ('------------------------------------------');
		writeln ('- 2 - Correctos                          -');
		writeln ('- 3 - Carga Incorrecta                   -');
		writeln ('------------------------------------------');
		writeln ('- 4 - Pacientes por Provincia            -');
		writeln ('------------------------------------------');
		writeln ('- 5 - Volver al Menu Principal           -');
		writeln ('------------------------------------------');
		opcion:= readkey; // Toma la opción con solo teclear 

		Case opcion of
			'1': begin
					assign(archivo_P, ruta_P); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
					reset(archivo_P); // reset: abre un fichero para lectura.
					listar_P (archivo_P); // Procedimiento para listar las provincias
					cerrar_archivo_P (archivo_P); // Cierra el archivo
					writeln ('');
					writeln ('Pulse una tecla para continuar');
					readkey;
				end;
			'2': begin
					aux_condicion:=true; // Muestra los que están OK
					assign(archivo_I, ruta_I); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
					reset(archivo_I); // reset: abre un fichero para lectura.
					listar_I (archivo_I,aux_condicion); // muestra la lista de todos los intectados true
					close (archivo_I); // Cierra el archivo
					writeln ('');
					writeln ('Presione un tecla para volver al menu.');
					readkey;
				end;
			'3': begin
					aux_condicion:=false; // Muestra los que están dados de Baja
					assign(archivo_I, ruta_I); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
					reset(archivo_I); // reset: abre un fichero para lectura.
					listar_I (archivo_I,aux_condicion); // muestra la lista de todos los intectados true
					close (archivo_I); // Cierra el archivo
					writeln ('');
					writeln ('Presione un tecla para volver al menu.');
					readkey;
				end;
			'4': begin
					clrscr; // Limpia la pantalla
					writeln ('Ingrese el codigo de Provincia');
					writeln ('');
					assign(archivo_P, ruta_P); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
					reset(archivo_P); // reset: abre un fichero para lectura.
					listar_provincias(archivo_P); // Procedimiento para listar las provincias en forma horizontal
					writeln ('');
					readln (codigo_provincia);
					buscar_registro_P (archivo_P,registro_P,codigo_provincia,encontrado,ubicacion); // Busca a la provincia si está 
					mostrar_en_carga (archivo_P,registro_P,codigo_provincia,ubicacion,aux_denominacion); // Devuelve la denominación
					cerrar_archivo_P (archivo_P); // Cierra el archivo
					assign(archivo_I, ruta_I); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
					reset(archivo_I); // reset: abre un fichero para lectura.
					listar_I_Provincia(archivo_I,codigo_provincia,aux_denominacion); // Procedimiento que lista pacientes por provincia
					close (archivo_I); // Cierra el archivo
					writeln ('');
					writeln ('Presione un tecla para volver al menu.');
					readkey;
				end;
			'5': begin // Salir del Menu, vuelve al menu principal
				end;
			else
				begin
					clrscr; // Limpia la pantalla
					writeln ('Ingreso una opcion incorrecta, pulse una tecla para continuar');
					readkey;
				end;
			end;
	until (opcion= '5');
end;

begin
end.

