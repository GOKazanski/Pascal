{
Grupo BacKGaMmon
				-Gabriela Burgos
				-Claudio Gonzalez
				-Gabriel Kazanski
}

unit Configuracion_BacKGaMmon;
{$codepage utf8}

interface // Parte pública, que se comparte

uses 
	crt;

const
	ruta_P='provincias.dat';

type

	provincias = record
		codigo_provincia:byte;
		denominacion:string[30];
		telefono_covid:string[13]; 
	end;

fichero_P= file of provincias;

var
	archivo_P:fichero_P;
	registro_P:provincias;

procedure crear_archivo(var archivo:file; ruta_archivo:string);
procedure menu_configuracion;
procedure listar_provincias(var arch:fichero_P);
procedure cerrar_archivo_P(var arch:fichero_P);
procedure listar_P(var arch:fichero_P);
procedure mostrar_en_carga (var arch:fichero_P; reg:provincias; cod_prov:byte; ubi:integer;var aux_denominacion:string);
procedure buscar_registro_P (var arch:fichero_P; reg:provincias; cod_prov:byte; var encont:boolean; var ubic:integer);

implementation // Parte privada de la unit

// Procedimiento que crea la plantilla a mostrar
procedure plantilla_provincia;
begin
	TextColor (7);
	TextBackground (3);
			//         1         2         3         4         5         6
			//123456789012345678901234567890123456789012345678901234567890
	writeln ('-------------------------------------------------------');//01
	writeln ('- CP - Provincia                       - Telefono     -');//02
	writeln ('-------------------------------------------------------');//03
	writeln ('-    -                                 -              -');//03
end;

// Procedimiento para crear el archivo de provincias
procedure crear_archivo(var archivo:file; ruta_archivo:string);
begin
	assign(archivo, ruta_archivo); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar. Asignamos el tipo y ruta de archivo a Archivo.
	{$I-} 
	reset(archivo); // reset: abre un fichero para lectura.
	{$I+}
	if ioresult <> 0 then // Si IOResult es distinto de 0, significa que el archivo no existe.
		begin
			writeln(ruta_archivo,'. No existe. Se creará el archivo.'); // muestra en pantalla que se está creando el archivo
			rewrite(archivo); // Si el archivo no existe lo creamos y abrimos con rewrite.
		end
	else
	begin
		writeln('Cargando: ', ruta_archivo); // muetra en pantalla si se esta cargando
	end;
	close(archivo); // cierra el archivo
end;

// Procedimiento para abrir el archivo
procedure abrir_archivo_P (var arch:fichero_P);
begin
	assign(arch, ruta_P); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
	reset(arch); // reset: abre un fichero para lectura.
end;

// Procedimiento para cerrar el archivo
procedure cerrar_archivo_P(var arch:fichero_P);
begin
	close(arch); // cierra el archivo
end;

// Procedimiento para guardar un registro ingresado
procedure guardar_registro_P(var arch:fichero_P;reg:provincias);
begin
	seek(arch,filesize(arch)); // Se posiciona en la última posición del registro
	write(arch,reg); // Escribe al archivo
end;

// Procedimiento para mostrar los registros
procedure mostrar_registro_P(reg:provincias);
begin
	gotoxy (1,3+reg.codigo_provincia);
	writeln ('-    -                                 -              -');
	gotoxy (3,3+reg.codigo_provincia);
	writeln(reg.codigo_provincia);
	gotoxy (8,3+reg.codigo_provincia);
	writeln(reg.denominacion);
	gotoxy (42,3+reg.codigo_provincia);
	writeln(reg.telefono_covid);
end;

// Procedimiento para modificar un registro
procedure modificar_registro_P (var reg:provincias;ubi:integer);
begin
	gotoxy(1,10);
	writeln ('Ingrese el Codigo de la  Provincia              ');
	gotoxy (3,6);
	readln (reg.codigo_provincia);
	gotoxy(1,10);
	writeln ('Ingrese Nombre de la Provincia                  ');
	gotoxy(8,6);
	readln(reg.denominacion);
	gotoxy(1,10);
	writeln ('Ingrese el numero de telefono                   ');
	gotoxy(42,6);
	readln(reg.telefono_covid);
	seek(archivo_P,ubi); // Se posiciona en el registro con posición ubi
	write(archivo_P,reg); // sobreescribe el registro
end;

// Procedimiento que al ingresar el cod devuelve la denominación de la provincia
procedure mostrar_en_carga (var arch:fichero_P; reg:provincias; cod_prov:byte; ubi:integer;var aux_denominacion:string);
begin
	seek (arch,ubi); // Se posiciona en el registro con posición ubi
	read (arch,reg); // lee el archivo
	if cod_prov=reg.codigo_provincia then
		aux_denominacion:=reg.denominacion;
end;

// Procedimiento para mostrar el registro buscado
procedure mostrar_buscado_P (var arch:fichero_P; reg:provincias; cod_prov:byte; ubi:integer);
begin
	seek (arch,ubi); // Se posiciona en el registro con posición ubi
	read (arch,reg); // lee el archivo
	if cod_prov=reg.codigo_provincia then
		begin
			gotoxy (3,4);
			writeln(reg.codigo_provincia);
			gotoxy (8,4);
			writeln(reg.denominacion);
			gotoxy (42,4);
			writeln(reg.telefono_covid);
		end;
end;

// Procedimiento para listar las provincias
procedure listar_P(var arch:fichero_P);
var
	reg:provincias;
begin
	clrscr;
	plantilla_provincia; // Procedimiento para dibujar la plantilla
	reset(arch);
	while not (eof(arch)) do
		begin
			read (arch,reg);
			mostrar_registro_P(reg); // Procedimiento para para mostrar cada registro
		end;
end;

// Procedimiento para leer los registros del archivo
procedure leer_registro_P(var arch:fichero_P; var reg:provincias; pos:integer);
begin
	seek(arch,pos);
	read(arch,reg);
end;

// Procedimiento busca si cod está ingresado y devuelve la ubicación
procedure buscar_registro_P (var arch:fichero_P; reg:provincias; cod_prov:byte; var encont:boolean; var ubic:integer);
var
	i: integer;
begin
for i:=0 to filesize(arch)-1 do
	begin
		leer_registro_P (arch,reg,i); // Procedimiento para leer los registros del archivo
		if cod_prov=reg.codigo_provincia then
			Begin
				encont:=true;
				ubic:=i;
			end;
	end;
end;

// Procedimiento para mostrar las provincias pero en forma horizontal
procedure mostrar_registro_provincias(reg:provincias);
begin
	write(reg.codigo_provincia,'-',reg.denominacion,'  ');
end;

// Procedimiento para listar las provincias
procedure listar_provincias(var arch:fichero_P);
var
	reg:provincias;
	i:byte;
begin
	i:=0;
	reset(arch);
	while not (eof(arch)) do
		begin
			read (arch,reg);
			if i=7 then // Va haciendo grupos de 7 provincias por renglón
				begin
					writeln('');
					i:=0;
				end;
			inc(i);
			mostrar_registro_provincias(reg); // Procedimiento para mostrar las provincias pero en forma horizontal 
		end;
end;

// Procedimiento para cargar las provincias
procedure cargar_registro_P(var reg:provincias);
begin
	clrscr; // Limpia la pantalla
	plantilla_provincia; // llama al procedimiento para dibujar la plantilla
	TextColor (10); // Cambia color de Texto
	gotoxy(1,26);
	listar_P (archivo_P); // llama al procedimiento listar y muestra las provincias ya ingresadas
	with reg do
		begin
			codigo_provincia:= filesize(archivo_P)+1;
			gotoxy(3,3+codigo_provincia);
			gotoxy(1,3+codigo_provincia);
			writeln ('-    -                                 -              -');
			gotoxy(3,3+codigo_provincia);
			writeln (codigo_provincia);
			gotoxy(1,29);
			writeln ('Ingrese Nombre de la Provincia                  ');
			gotoxy(8,3+codigo_provincia);
			readln(denominacion);
			gotoxy(1,29);
			writeln ('Ingrese el numero de telefono                   ');
			gotoxy(42,3+codigo_provincia);
			readln(telefono_covid);
		end;
end;

// Procedimiento para ordenar las provincias en forma alfabética
procedure orden_burbuja_P (var arch:fichero_P);
var 
	reg1,reg2:provincias;
	lim,i,j:integer;
begin

	lim:= filesize(arch)-1;
	for i:= 1 to lim - 1 do
		for j:= 0 to lim - i do
			begin
				seek(arch,J); // Se posiciona en el registro con posición J
				read(arch,reg1); // lee el archivo
				seek(arch,j+1); // Se posiciona en el registro con posición J+1
				read(arch,reg2); // lee el archivo
				if reg1.denominacion > reg2.denominacion then
					begin
						seek(arch,j+1);  // Se posiciona en el registro con posición J+1
						write(arch,reg1); // Escribe al archivo
						seek(arch,j);  // Se posiciona en el registro con posición J
						write(arch,reg2); // Escribe al archivo
					end;
			end;
end;

// Procedimiento del menu de opciones
procedure menu_configuracion;
var
	opcion,seguir:char;
	aux_provincia:byte;
	ubicacion:integer;
	encontrado:boolean;
begin
	abrir_archivo_P (archivo_P); // abre el archivo
	orden_burbuja_P (archivo_P); // ordenda los registros por abecedario
	cerrar_archivo_P (archivo_P); // cierra el archivo

	TextColor(7); // Cambia color de Texto
	TextBackground(3); // Cambia color de Fondo
	repeat
		ubicacion:=-1;
		encontrado:=false;
		clrscr; // Limpia la pantalla
		writeln ('------------------------------------------');
		writeln ('-          menu configuracion            -');
		writeln ('------------------------------------------');
		writeln ('- Elija una opción                       -');
		writeln ('------------------------------------------');
		writeln ('- 1 - Alta Provincias                    -');
		writeln ('- 2 - Modificar Provincias               -');
		writeln ('------------------------------------------');
		writeln ('- 3 - Volver al Menu Principal           -');
		writeln ('------------------------------------------');
		opcion:= readkey; // Toma la opción con solo teclear 
		Case opcion of
			'1': begin // Opción que muestra las provincias 
					repeat
						abrir_archivo_P (archivo_P); // abre el archivo
						cargar_registro_P (registro_P); // Carga los datos de un registro
						guardar_registro_P (archivo_P,registro_P); // Guarda el registro
						cerrar_archivo_P (archivo_P); // cierra el archivo
						gotoxy(1,29) ;
						writeln ('desea ingresar otra provincia (S/N)');
						seguir:=readkey; // Toma la opción con solo teclear 
						seguir:=upcase(seguir); // Pasa a mayúscula
					until seguir <> 'S';
				end;
			'2':begin // opción para modificar una provincia
					clrscr; // Limpia la pantalla
					plantilla_provincia; // Procedimiento para dibujar la plantilla
					abrir_archivo_P (archivo_P); // Abre el archivo de provincias
					listar_P (archivo_P); // muestra la lista de provincias
					writeln ('');
					writeln ('Elija la provincia a modificar.');
					readln (aux_provincia);
					clrscr; // Limpia la pantalla
					buscar_registro_P (archivo_P,registro_P,aux_provincia,encontrado,ubicacion); // busca si está la provincia
					if encontrado then
						begin
							plantilla_provincia; // Procedimiento para dibujar la plantilla
							mostrar_buscado_P (archivo_P,registro_P,aux_provincia,ubicacion); // muestra la provincia buscada
							gotoxy(1,10);
							writeln ('quiere modificar esta provincia (S/N)');
							seguir:= readkey; // Toma la opción con solo teclear 
							seguir:=upcase(seguir); // Pasa a mayúscula
							if seguir='S' then
								begin
									modificar_registro_P (registro_P,ubicacion); // Procedimiento para modificar un registro
								end;
						end;
					cerrar_archivo_P (archivo_P); // cierra el archivo
				end;
			'3': begin // Salir del Menu, vuelve al menu principal
				end;
			else
				begin
					clrscr; // Limpia la pantalla
					writeln ('Ingreso una opcion incorrecta, pulse una tecla para continuar');
					readkey;
				end;
			end;
	until (opcion= '3');
end;

begin
end.
