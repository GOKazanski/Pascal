{
Grupo BacKGaMmon
				-Gabriela Burgos
				-Claudio Gonzalez
				-Gabriel Kazanski
}

unit ABMC_BacKGaMmon;
{$codepage utf8}

interface // Parte pública, que se comparte

uses 
	crt,Configuracion_BacKGaMmon,Fecha_BacKGaMmon;

const
	ruta_I='infectados.dat'; // ubicacion del archivo
	ruta_E='estadisticas.dat'; // ubicacion del archivo
	ruta_P='provincias.dat'; // ubicacion del archivo

type
	infectados = record
		id:integer;
		apellidoynombre:string[30]; 
		dni:string[8];
		calle:string[20];
		numero:string[8];
		piso:string[3];
		departamento:string[3];
		cp:string[8];
		ciudad:string[30]; 
		codigo_provincia:byte;
		num_telefono:string[13]; 
		email:string[50]; 
		dia_nacimiento:word;
		mes_nacimiento:word;
		anio_nacimiento:word; 
		condicion:boolean;
	end;

	estadisticas = record
		id:integer;
		dni:string[8];
		codigo_provincia:byte;
		estado:char;
		formadecontagio:char;
		condicion:boolean;
	end;

fichero_I= file of infectados;
fichero_E= file of estadisticas;
fichero_P= file of provincias; 

var
	archivo_I:fichero_I;
	archivo_E:fichero_E;
	archivo_P:fichero_P;
	registro_I:infectados;
	registro_E:estadisticas;
	registro_P:provincias;

procedure crear_archivo(var archivo:file; ruta_archivo:string);
procedure menu_ABMC;
procedure cantidad_infectado_nacional (var arch:fichero_I;var cant:integer);
procedure cantidad_estado_nacional (var arch:fichero_E; Var cant1,cant2,cant3:integer);
procedure cantidad_forma_nacional (var arch:fichero_E; Var cant1,cant2,cant3:integer);
procedure cantidad_edad_nacional (var arch:fichero_I; Var cant1,cant2,cant3:integer);
procedure cantidad_infectado_Provincial (var arch:fichero_I;cod_prov:byte; var cant:integer);
procedure cantidad_estado_provincial (var arch:fichero_E; cod_prov:byte; Var cant1,cant2,cant3:integer);
procedure cantidad_forma_provincial (var arch:fichero_E; cod_prov:byte; Var cant1,cant2,cant3:integer);
procedure cantidad_edad_provincial (var arch:fichero_I; cod_prov:byte; Var cant1,cant2,cant3:integer);
procedure listar_I(var arch:fichero_I;verdadero:boolean);
procedure listar_I_Provincia(var arch:fichero_I; auxCodProv:byte;aux_denominacion:string);
procedure orden_burbuja_I_Apellido (var arch:fichero_I);

implementation // Parte privada de la unit

// Procedimiento para dibujar la Plantilla
procedure plantilla;
begin
	TextColor (7); // Cambia color de Texto
	TextBackground (3); // Cambia color de Fondo
			//         1         2         3         4         5         6         7         8
			//12345678901234567890123456789012345678901234567890123456789012345678901234567890
	writeln ('--------------------------------------------------------------------------------');//01
	writeln ('- Datos del Infectado:                                                         -');//02
	writeln ('--------------------------------------------------------------------------------');//03
	writeln ('- DNI: 00000000                                                                -');//04
	writeln ('- Apellido y nombres:                                                          -');//05
	writeln ('- Fecha de Nacimiento:                                                         -');//06
	writeln ('--------------------------------------------------------------------------------');//07
	writeln ('- Domicilio                                                                    -');//08
	writeln ('--------------------------------------------------------------------------------');//09
	writeln ('- Calle:                                                   Numero:             -');//10
	writeln ('- Piso:                                                      Dpto:             -');//11
	writeln ('- Codigo Postal:                                                               -');//12
	writeln ('- Ciudad:                                                                      -');//13
	writeln ('- Provincia:                                                                   -');//14
	writeln ('- Telefono:                                                                    -');//15
	writeln ('- E-mail:                                                                      -');//16
	writeln ('--------------------------------------------------------------------------------');//17
	writeln ('- Datos Epidemiologicos                                                        -');//18
	writeln ('--------------------------------------------------------------------------------');//19
	writeln ('- Estado:                                                                      -');//20
	writeln ('- Forma de Contagio:                                                           -');//21
	writeln ('--------------------------------------------------------------------------------');//22
end;

// Procedimiento para crear el archivo
procedure crear_archivo(var archivo:file; ruta_archivo:string);
begin
	assign(archivo, ruta_archivo); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar. Asignamos el tipo y ruta de archivo a Archivo.
	{$I-} 
	reset(archivo); // reset: abre un fichero para lectura.
	{$I+}
	if ioresult <> 0 then // Si IOResult es distinto de 0, significa que el archivo no existe.
		begin
			writeln(ruta_archivo,'. No existe. Se creará el archivo.'); // Si el archivo no existe lo creamos y abrimos con rewrite.
			rewrite(archivo);
		end
	else
	begin
		writeln('Cargando: ', ruta_archivo);
	end;
	close(archivo); // cierra el archivo
end;

// Procedimiento para abrir el archivo 
procedure abrir_archivo_I(var arch:fichero_I);
begin
	assign(arch, ruta_I); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
	reset(arch); // reset: abre un fichero para lectura.
end;

// Procedimiento para abrir el archivo 
procedure abrir_archivo_E(var arch:fichero_E);
begin
	assign(arch, ruta_E); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
	reset(arch); // reset: abre un fichero para lectura.
end;

// Procedimiento para cerrar el archivo 
procedure cerrar_archivo_I(var arch:fichero_I);
begin
	close(arch); // cierra el archivo
end;

// Procedimiento para cerrar el archivo 
procedure cerrar_archivo_E(var arch:fichero_E);
begin
	close(arch); // cierra el archivo
end;

// Procedimiento para guardar el registro 
procedure guardar_registro_I(var arch:fichero_I;reg:infectados);
begin
	seek(arch,filesize(arch)); // Se posiciona en la última posición del registro
	write(arch,reg); // Escribe al archivo
end;

// Procedimiento para guardar el registro 
procedure guardar_registro_E(var arch:fichero_E;reg:estadisticas);
begin
	seek(arch,filesize(arch));  // Se posiciona en la última posición del registro
	write(arch,reg); // Escribe al archivo
end;

// Procedimiento para leer el registro 
procedure leer_registro_I(var arch:fichero_I; var reg:infectados; pos:integer);
begin
	seek(arch,pos); // Se posiciona en el registro con posición Pos
	read(arch,reg); // lee el archivo
end;

// Procedimiento para leer el registro
procedure leer_registro_E(var arch:fichero_E; var reg:estadisticas; pos:integer);
begin
	seek(arch,pos); // Se posiciona en el registro con posición Pos
	read(arch,reg); // lee el archivo
end;

// Procedimiento para contar los pacientes a nivel Nacional 
procedure cantidad_infectado_nacional (var arch:fichero_I;var cant:integer);
var
	reg:infectados;
begin
	cant:=0;
	reset(arch);
	while not (eof(arch))do
		begin
			read (arch,Reg);
			if reg.condicion=true then
					inc(Cant)
		end;
end;

// Procedimiento para contar los pacientes a nivel Provincial
procedure cantidad_infectado_Provincial (var arch:fichero_I;cod_prov:byte; var cant:integer);
var
	reg:infectados;
begin
	cant:=0;
	reset(arch);
	while not (eof(arch))do
		begin
			read (arch,Reg);
			if reg.condicion=true then
				if (reg.codigo_provincia=cod_prov) then
					inc(Cant)
		end;
end;

// Procedimiento para contar los pacientes por Estado
procedure cantidad_estado_nacional (var arch:fichero_E; Var cant1,cant2,cant3:integer);
var
	reg:estadisticas;
begin
	reset(arch);
	while not (eof(arch))do
		begin
			read (arch,Reg);
			if reg.condicion=true then
				if reg.estado='1' then
						inc(Cant1);
				if reg.estado='2' then
						inc(Cant2);
				if reg.estado='3' then
						inc(Cant3);
		end;
end;

// Procedimiento para contar los pacientes por Estado
procedure cantidad_estado_provincial (var arch:fichero_E; cod_prov:byte; Var cant1,cant2,cant3:integer);
var
	reg:estadisticas;
begin
	reset(arch);
	while not (eof(arch))do
		begin
			read (arch,Reg);
			if reg.condicion=true then
				if reg.codigo_provincia=cod_prov then
				begin
					if reg.estado='1' then
						inc(Cant1);
					if reg.estado='2' then
						inc(Cant2);
					if reg.estado='3' then
						inc(Cant3);
				end;
		end;
end;

// Procedimiento para contar los pacientes por forma de Contagio
procedure cantidad_forma_nacional (var arch:fichero_E; Var cant1,cant2,cant3:integer);
var
	reg:estadisticas;
begin
	reset(arch);
	while not (eof(arch))do
		begin
			read (arch,Reg);
			if reg.condicion=true then
				if reg.formadecontagio='1' then
						inc(Cant1);
				if reg.formadecontagio='2' then
						inc(Cant2);
				if reg.formadecontagio='3' then
						inc(Cant3);
		end;
end;

// Procedimiento para contar los pacientes por forma de Contagio
procedure cantidad_forma_provincial (var arch:fichero_E; cod_prov:byte; Var cant1,cant2,cant3:integer);
var
	reg:estadisticas;
begin
	reset(arch);
	while not (eof(arch))do
		begin
			read (arch,Reg);
			if reg.condicion=true then
				if reg.codigo_provincia=cod_prov then
				begin
					if reg.formadecontagio='1' then
						inc(Cant1);
					if reg.formadecontagio='2' then
						inc(Cant2);
					if reg.formadecontagio='3' then
						inc(Cant3);
				end;
		end;
end;

// Procedimiento para contar los pacientes por forma grupo etario
procedure cantidad_edad_nacional (var arch:fichero_I; Var cant1,cant2,cant3:integer);
var
	reg:infectados;
	f_d,f_m,f_a,ed:word;
begin
	reset(arch);
	while not (eof(arch))do
		begin
			read (arch,Reg);
			if reg.condicion=true then
				begin
					f_d:=reg.dia_nacimiento;
					f_m:=reg.mes_nacimiento;
					f_a:=reg.anio_nacimiento; 
					calcular_edad (f_d,f_m,f_a,ed);
					if ed<18 then
						inc(Cant1);
					if (ed>=18) and (ed<50) then
						inc(Cant2);
					if ed>=50 then
						inc(Cant3);
				end;
		end;
end;

// Procedimiento para contar los pacientes por forma grupo etario
procedure cantidad_edad_provincial (var arch:fichero_I; cod_prov:byte; Var cant1,cant2,cant3:integer);
var
	reg:infectados;
	f_d,f_m,f_a,ed:word;
begin
	reset(arch);
	while not (eof(arch))do
		begin
			read (arch,Reg);
			if reg.condicion=true then
				if reg.codigo_provincia=cod_prov then
					begin
						f_d:=reg.dia_nacimiento;
						f_m:=reg.mes_nacimiento;
						f_a:=reg.anio_nacimiento; 
						calcular_edad (f_d,f_m,f_a,ed);
						if ed<18 then
							inc(Cant1);
						if (ed>=18) and (ed<50) then
							inc(Cant2);
						if ed>=50 then
							inc(Cant3);
					end;
		end;
end;

// Procedimiento para mostrar el registro buscado
procedure mostrar_registro_cargado_I(var arch:fichero_I; reg:infectados; documento:string; ubi:integer);
begin
	seek (arch,ubi); // Se posiciona en el registro con posición ubi
	read (arch,reg); // lee el archivo
	if documento=reg.dni then
		Begin
			TextColor (10);
			with reg do
				begin
					gotoxy(24,2);
					writeln (reg.id);
					gotoxy(8,4);
					writeln (reg.dni);
					gotoxy(23,5) ;
					writeln (reg.apellidoynombre);
					gotoxy(24,6) ;
					writeln (reg.dia_nacimiento);
					gotoxy(27,6) ;
					writeln (reg.mes_nacimiento);
					gotoxy(30,6) ;
					writeln (reg.anio_nacimiento);
					gotoxy(10,10);
					writeln (reg.calle);
					gotoxy(68,10);
					writeln (reg.numero);
					gotoxy(9,11);
					writeln (reg.piso);
					gotoxy(68,11);
					writeln (reg.departamento);
					gotoxy(18,12);
					writeln (reg.cp);
					gotoxy(11,13);
					writeln (reg.ciudad);
					gotoxy(14,14);
					writeln (reg.codigo_provincia);
					gotoxy(13,15);
					writeln (reg.num_telefono);
					gotoxy(11,16);
					writeln (reg.email);
				end;
		end;
end;

// Procedimiento para mostrar el registro buscado
procedure mostrar_registro_cargado_E(var arch:fichero_E; reg:estadisticas; documento:string; ubi:integer);
var
	i: integer;
begin
	for i:=0 to filesize(arch)-1 do
	begin
		seek (arch,ubi); // Se posiciona en el registro con posición ubi
		read (arch,reg); // lee el archivo
		if documento=reg.dni then
			begin
				with reg do
					begin
						gotoxy(11,20);
						writeln (estado);
						gotoxy(22,21);
						writeln (formadecontagio);
					end; 
			end;
	end;
end;

// Procedimiento de busqueda binaria
procedure busqueda_binaria (var arch:fichero_I; documento:string; var pos:integer);
var
	reg: infectados;
	PRI,ULT,MED:integer;
begin
	PRI:=0;
	ULT:= filesize(arch)-1;
	pos := -1;
	while (pos = -1) and (PRI<= ULT) do
		begin
			MED:= (PRI + ULT) div 2;
			seek(arch,MED); // Se posiciona en el registro con posición MED
			read(arch,reg); // lee el archivo
			if reg.dni = documento then 
				pos:= MED
			else
				if reg.dni > documento then 
				ULT:= MED -1
			else 
				PRI:= MED +1;
		end;
	if pos <> -1 then
		begin
			mostrar_registro_cargado_I(archivo_I,registro_I,documento,pos);
			mostrar_registro_cargado_E(archivo_E,registro_E,documento,pos);
		end;
end;

// Procedimiento para ordenar por apellido
procedure orden_burbuja_I_Apellido (var arch:fichero_I);
var 
	reg1,reg2:infectados;
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
				if reg1.apellidoynombre > reg2.apellidoynombre then
					begin
						seek(arch,j+1);  // Se posiciona en el registro con posición J+1
						write(arch,reg1); // Escribe al archivo
						seek(arch,j);  // Se posiciona en el registro con posición J
						write(arch,reg2); // Escribe al archivo
					end;
			end;
end;

// Procedimiento para ordenar por DNI
procedure orden_burbuja_I (var arch:fichero_I);
var 
	reg1,reg2:infectados;
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
				if reg1.dni > reg2.dni then
					begin
						seek(arch,j+1);  // Se posiciona en el registro con posición J+1
						write(arch,reg1); // Escribe al archivo
						seek(arch,j);  // Se posiciona en el registro con posición J
						write(arch,reg2); // Escribe al archivo
					end;
			end;
end;

// Procedimiento para ordenar por DNI
procedure orden_burbuja_E (var arch:fichero_E);
var 
	reg1,reg2:estadisticas;
	lim,i,j:integer;
begin
	lim:= filesize(arch)-1;
	for i:= 1 to lim - 1 do
		for j:= 0 to lim - i do
			begin
				seek(arch,J);  // Se posiciona en el registro con posición J
				read(arch,reg1); // lee el archivo
				seek(arch,j+1);  // Se posiciona en el registro con posición J+1
				read(arch,reg2); // lee el archivo
				if reg1.dni > reg2.dni then
					begin
						seek(arch,j+1);  // Se posiciona en el registro con posición J+1
						write(arch,reg1); // Escribe al archivo
						seek(arch,j);  // Se posiciona en el registro con posición J
						write(arch,reg2); // Escribe al archivo
					end;
			end;
end;

// Procedimiento para mostrar los registros
procedure mostrar_registro_I_Provincia(registro:infectados);
begin
	writeln (registro.dni,',',registro.apellidoynombre);
end;

// Procedimiento para listar pacientes
procedure listar_I_Provincia(var arch:fichero_I; auxCodProv:byte;aux_denominacion:string);
var
	reg:infectados;
begin
	clrscr;
	reset(arch);
	writeln ('listado de infectados en: ',aux_denominacion);
	writeln ('');
	while not (eof(arch))do
		begin
			read (arch,Reg);
			if reg.condicion=true then
				if reg.codigo_provincia=auxCodProv then
					mostrar_registro_I_Provincia(reg);
		end;
end;

// Procedimiento para mostrar los pacientes
procedure mostrar_registro_I(registro:infectados);
begin
	writeln (registro.dni,',',registro.apellidoynombre,', Cod Prov: ',registro.codigo_provincia);
end;

// Procedimiento para listar los pacientes true o false
procedure listar_I(var arch:fichero_I;verdadero:boolean);
var
	reg:infectados;
begin
	clrscr;
	reset(arch);
	writeln ('listado de infectados de condición: ',verdadero);
	writeln ('');
	while not (eof(arch))do
		begin
			read (arch,Reg);
			if verdadero=true then
				if reg.condicion=true then
					mostrar_registro_I (reg);
			if verdadero=false then
				if reg.condicion=false then
					mostrar_registro_I(reg);
		end;
end;

// Procedimiento para buscar un  paciente por DNI
procedure buscar(var arch:fichero_I; documento:string);
var
	reg:infectados; 
	i: integer;
begin
	for i:=0 to filesize(arch)-1 do
		begin
			leer_registro_I (arch,reg,i);
			if documento=reg.dni then
				mostrar_registro_I (reg)
		end;
end;

// Procedimiento para modificar los datos del pacientes
procedure modificar_alta_baja_I(var arch:fichero_I;pos:integer; verdad:boolean);
var
	reg:infectados;
begin
	seek(arch,pos); // Se posiciona en el registro con posición pos
	read(arch,reg);
	reg.condicion:=verdad;
	seek(arch,pos); // Se posiciona en el registro con posición pos
	write(arch,reg);
end;

// Procedimiento para modificar los datos de contagio
procedure modificar_alta_baja_E(var arch:fichero_E;pos:integer; verdad:boolean);
var
	reg:estadisticas;
begin
	seek(arch,pos); // Se posiciona en el registro con posición pos
	read(arch,reg);
	reg.condicion:=verdad;
	seek(arch,pos); // Se posiciona en el registro con posición pos
	write(arch,reg);
end;

// Procedimiento para buscar paciente para modificar
procedure buscar_I(var arch:fichero_I; documento:string; var encon:boolean);
var
	reg:infectados; 
	i: integer;
begin
	for i:=0 to filesize(arch)-1 do
		begin
			leer_registro_I (arch,reg,i);
			if documento=reg.dni then
				begin
					encon:=true;
					mostrar_registro_cargado_I(arch,reg, documento,i);
				end;
		end;
end;

// Procedimiento para buscar paciente para modificar
procedure buscar_E(var arch:fichero_E; documento:string; var encon:boolean);
var
	reg:estadisticas; 
	i: integer;
begin
	for i:=0 to filesize(arch)-1 do
		begin
			leer_registro_E (arch,reg,i);
			if documento=reg.dni then
			begin
				encon:=true;
				mostrar_registro_cargado_E(arch,reg, documento,i);
			end;
	end;
end;

// Procedimiento para cargar registros
procedure cargar_registro_I(var reg:infectados; var documento:string; var prov:byte;var ubic:integer);
var
	cantidad_provincias:byte;
	validar_fecha:boolean;
	ubicacion:integer;
	encontrado:boolean;
	aux_denominacion:string[30];
begin
	validar_fecha:=false;
	ubic:=-1;
	clrscr;
	plantilla;
	TextColor (10);
	gotoxy(1,24); 
	writeln ('Ingrese el DNI                                                                  ');
	gotoxy(8,4); 
	readln (documento);
	busqueda_binaria(archivo_I,documento,ubic);
	if ubic=-1 then
		begin
			with reg do
				begin 
					id:= filesize(archivo_I)+1;
					gotoxy(24,2);
					writeln (id);
					dni:=documento;
					gotoxy(1,24) ;
					writeln ('Ingrese el Apellido y Nombre                                                    ');
					gotoxy(23,5) ;
					readln(apellidoynombre);
					repeat
						gotoxy(1,24) ;
						writeln ('Ingrese el día de la Fecha de Nacimiento                                        ');
						readln(dia_nacimiento);
						gotoxy(1,25);
						writeln ('                                                                                ');
						gotoxy(1,24) ;
						writeln ('Ingrese el mes de la Fecha de Nacimiento                                        ');
						readln(mes_nacimiento);
						gotoxy(1,25);
						writeln ('                                                                                ');
						gotoxy(1,24) ;
						writeln ('Ingrese el anio de la Fecha de Nacimiento                                       ');
						readln(anio_nacimiento);
						gotoxy(1,25);
						writeln ('                                                                                ');
						fecha_correcta (dia_nacimiento,mes_nacimiento,anio_nacimiento,validar_fecha);
						if validar_fecha=true then
							comparar_fecha (dia_nacimiento,mes_nacimiento,anio_nacimiento,validar_fecha);
						if validar_fecha=false then
							begin
								gotoxy(1,24) ;
								writeln('la fecha ingresada es incorrecta                                                 ');
								readkey;
							end;
					until validar_fecha=true;
					gotoxy(24,6);
					writeln (dia_nacimiento,'/',mes_nacimiento,'/',anio_nacimiento);
					gotoxy(1,24) ;
					writeln ('Ingrese la calle                                                                ');
					gotoxy(10,10);
					readln(calle);
					gotoxy(1,24) ;
					writeln ('Ingrese la numeracion del domicilio                                             ');
					gotoxy(68,10);
					readln(numero);
					gotoxy(1,24) ;
					writeln ('Ingrese el piso                                                                 ');
					gotoxy(9,11);
					readln(piso);
					gotoxy(1,24) ;
					writeln ('Ingrese el departamento o nº de casa                                            ');
					gotoxy(68,11);
					readln(departamento);
					gotoxy(1,24) ;
					writeln ('Ingrese el código postal                                                        ');
					gotoxy(18,12);
					readln(cp);
					gotoxy(1,24) ;
					writeln ('Ingrese la ciudad                                                               ');
					gotoxy(11,13);
					readln(ciudad);
					repeat
						gotoxy(1,24) ;
						writeln ('Ingrese la provincia sugun las opciones: 1 - 2 - 3...                           ');
						writeln ('');
						assign(archivo_P, ruta_P); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
						reset(archivo_P); // reset: abre un fichero para lectura.
						listar_provincias(archivo_P);
						cantidad_provincias:=(filesize(archivo_P));
						gotoxy(14,14);
						readln(codigo_provincia);
						prov:=codigo_provincia;
					until (codigo_provincia >0) and (codigo_provincia <= cantidad_provincias);
					buscar_registro_P (archivo_P,registro_P,codigo_provincia,encontrado,ubicacion);
					mostrar_en_carga (archivo_P,registro_P,codigo_provincia,ubicacion,aux_denominacion);
					gotoxy (18,14);
					writeln (aux_denominacion);
					cerrar_archivo_P (archivo_P);
					gotoxy(1,24) ;
					writeln ('Ingrese el numero de telefono                                                   ');
					writeln ('                                                                                                                       ');
					writeln ('                                                                                                                       ');
					writeln ('                                                                                                                       ');
					writeln ('                                                                                                                       ');
					writeln ('                                                                                                                       ');
					gotoxy(13,15);
					readln(num_telefono);
					gotoxy(1,24) ;
					writeln ('Ingrese el correo electrónico                                                   ');
					gotoxy(11,16);
					readln(email);
					condicion:=true;
				end;
		end;
end;

// Procedimiento para cargar registros
procedure cargar_registro_E(var reg:estadisticas; documento:string; prov:byte;var seguir:char);
begin
	with reg do
		begin
			id:= filesize(archivo_E)+1;
			dni:=documento;
			codigo_provincia:=prov;
			repeat
				gotoxy(1,24) ;
				writeln ('Ingrese el estado del infeccion segun las opciones: 1 - 2 - 3                   ');
				writeln ('');
				writeln ('1 - ACTIVO, 2 - RECUPERADO, 3 - FALLECIDO                                       ');
				gotoxy(11,20);
				readln (estado);
			until estado in ['1'..'3']; // Se repite sino esta el las opciones
			repeat
				gotoxy(1,24) ;
				writeln ('Ingrese la forma de contagio segun las opciones: 1 - 2 - 3                      ');
				writeln ('');
				writeln ('1 - Contagio Directo, 2 - Transmisión Comunitaria, 3 - Desconocida              ');
				gotoxy(22,21);
				readln (formadecontagio);
			until formadecontagio in ['1'..'3']; // Se repite sino esta el las opciones
			condicion:=true;
		end;
	gotoxy(1,24) ;
	writeln ('desea ingresar otra persona? (S/N)                                              ');
	writeln ('                                                                                ');
	writeln ('                                                                                ');
	seguir:=(readkey);
	seguir:=upcase(seguir);
end;

// Procedimiento para modificar registros
procedure modificar_registro_I(var reg:infectados; var documento:string; var prov:byte; ubic:integer);
var
	cantidad_provincias:byte;
	validar_fecha:boolean;
	ubicacion:integer;
	encontrado:boolean;
	aux_denominacion:string[30];
begin
	validar_fecha:=false;
	clrscr;
	plantilla;
	TextColor (10);
	gotoxy(1,24); 
	writeln ('Ingrese el DNI                                                                  ');
	gotoxy(8,4); 
	readln (documento);
	with reg do
		begin 
			id:= ubic+1;
			gotoxy(24,2);
			writeln (id);
			dni:=documento;
			gotoxy(1,24) ;
			writeln ('Ingrese el Apellido y Nombre                                                    ');
			gotoxy(23,5) ;
			readln(apellidoynombre);
			gotoxy(1,24) ;
			repeat
				gotoxy(1,24) ;
				writeln ('Ingrese el día de la Fecha de Nacimiento                                        ');
				readln(dia_nacimiento);
				gotoxy(1,25);
				writeln ('                                                                                ');
				gotoxy(1,24) ;
				writeln ('Ingrese el mes de la Fecha de Nacimiento                                        ');
				readln(mes_nacimiento);
				gotoxy(1,25);
				writeln ('                                                                                ');
				gotoxy(1,24) ;
				writeln ('Ingrese el anio de la Fecha de Nacimiento                                       ');
				readln(anio_nacimiento);
				gotoxy(1,25);
				writeln ('                                                                                ');
				fecha_correcta (dia_nacimiento,mes_nacimiento,anio_nacimiento,validar_fecha);
				if validar_fecha=true then
					comparar_fecha (dia_nacimiento,mes_nacimiento,anio_nacimiento,validar_fecha);
				if validar_fecha=false then
					begin
						gotoxy(1,24) ;
						writeln('la fecha ingresada es incorrecta                                                 ');
						readkey;
					end;
			until validar_fecha=true;
			gotoxy(24,6);
			writeln (dia_nacimiento,'/',mes_nacimiento,'/',anio_nacimiento);
			gotoxy(1,24) ;
			writeln ('Ingrese la calle                                                                ');
			gotoxy(10,10);
			readln(calle);
			gotoxy(1,24) ;
			writeln ('Ingrese la numeracion del domicilio                                             ');
			gotoxy(68,10);
			readln(numero);
			gotoxy(1,24) ;
			writeln ('Ingrese el piso                                                                 ');
			gotoxy(9,11);
			readln(piso);
			gotoxy(1,24) ;
			writeln ('Ingrese el departamento o nº de casa                                            ');
			gotoxy(68,11);
			readln(departamento);
			gotoxy(1,24) ;
			writeln ('Ingrese el código postal                                                        ');
			gotoxy(18,12);
			readln(cp);
			gotoxy(1,24) ;
			writeln ('Ingrese la ciudad                                                               ');
			gotoxy(11,13);
			readln(ciudad);
			repeat
				gotoxy(1,24) ;
				writeln ('Ingrese la provincia sugun las opciones: 1 - 2 - 3...                           ');
				writeln ('');
				assign(archivo_P, ruta_P); // assign: es la orden que se encarga de asignar un nombre físico al fichero que acabamos de declarar.
				reset(archivo_P); // reset: abre un fichero para lectura.
				listar_provincias(archivo_P);
				cantidad_provincias:=(filesize(archivo_P));
				gotoxy(14,14);
				readln(codigo_provincia);
				prov:=codigo_provincia;
			until (codigo_provincia >0) and (codigo_provincia <= cantidad_provincias);
			buscar_registro_P (archivo_P,registro_P,codigo_provincia,encontrado,ubicacion);
			mostrar_en_carga (archivo_P,registro_P,codigo_provincia,ubicacion,aux_denominacion);
			gotoxy (18,14);
			writeln (aux_denominacion);
			cerrar_archivo_P (archivo_P);
			gotoxy(1,24) ;
			writeln ('Ingrese el numero de telefono                                                   ');
			writeln ('                                                                                                                       ');
			writeln ('                                                                                                                       ');
			writeln ('                                                                                                                       ');
			writeln ('                                                                                                                       ');
			writeln ('                                                                                                                       ');
			gotoxy(13,15);
			readln(num_telefono);
			gotoxy(1,24) ;
			writeln ('Ingrese el correo electrónico                                                   ');
			gotoxy(11,16);
			readln(email);
			condicion:=true;
		end;
	seek(archivo_I,ubic); // Se posiciona en el registro con posición pos
	write(archivo_I,reg);
end;

// Procedimiento para modificar registros
procedure modificar_registro_E(var reg:estadisticas; documento:string; prov:byte;ubic:integer);
begin
	with reg do
		begin
			id:= ubic+1;
			dni:=documento;
			codigo_provincia:=prov;
			repeat
				gotoxy(1,24) ;
				writeln ('Ingrese el estado del infeccion segun las opciones: 1 - 2 - 3                   ');
				writeln ('');
				writeln ('1 - ACTIVO, 2 - RECUPERADO, 3 - FALLECIDO                                       ');
				gotoxy(11,20);
				readln (estado);
			until estado in ['1'..'3']; // Se repite sino esta el las opciones
			repeat
				gotoxy(1,24) ;
				writeln ('Ingrese la forma de contagio segun las opciones: 1 - 2 - 3                      ');
				writeln ('');
				writeln ('1 - Contagio Directo, 2 - Transmisión Comunitaria, 3 - Desconocida              ');
				gotoxy(22,21);
				readln (formadecontagio);
			until formadecontagio in ['1'..'3']; // Se repite sino esta el las opciones
			condicion:=true;
		end;
	seek(archivo_E,ubic); // Se posiciona en el registro con posición pos
	write(archivo_E,reg);
	gotoxy(1,24) ;
	writeln ('Presione un tecla para volver al menu.                                          ');
	readkey;
end;

// Procedimiento del Menú ABMC
procedure menu_ABMC;
var
	opcion,ingresar:char;
	aux_dni:string[8];
	aux_condicion:boolean;
	aux_provincia:byte;
	ubicacion:integer;
begin
	repeat
		abrir_archivo_I (archivo_I); // abre el archivo
		abrir_archivo_E (archivo_E); // abre el archivo 
		orden_burbuja_I (archivo_I); // ordenda los registros por dni
		orden_burbuja_E (archivo_E); // ordenda los registros por dni
		cerrar_archivo_I (archivo_I); // cierra el archivo
		cerrar_archivo_E (archivo_E); // cierra el archivo

		TextColor(7); // Cambia color de Texto
		TextBackground(3); // Cambia color de Fondo

		aux_dni:='';
		aux_provincia:=0;
		aux_condicion:=false;
		ingresar:='s';
		ubicacion:=-1;

		clrscr; // Limpia la pantalla
		writeln ('------------------------------------------');
		writeln ('-               menu ABMC                -');
		writeln ('------------------------------------------');
		writeln ('- Elija una opción                       -');
		writeln ('------------------------------------------');
		writeln ('- 1 - Alta - ingresar a una persona      -');
		writeln ('- 2 - Baja - Borrar a una persona        -');
		writeln ('- 3 - Modificar                          -');
		writeln ('- 4 - Consulta - buscar una persona      -');
		writeln ('- 5 - Alta un dado de Baja               -');
		writeln ('------------------------------------------');
		writeln ('- 6 - Volver al Menu Principal           -');
		writeln ('------------------------------------------');
		opcion:= readkey; // Toma la opción con solo teclear 

		Case opcion of
			'1': begin // Alta de infectado y estadistica
					repeat
						abrir_archivo_I (archivo_I); // abre el archivo
						abrir_archivo_E (archivo_E); // abre el archivo 
						cargar_registro_I (registro_I,aux_dni,aux_provincia,ubicacion); // Carga los datos de un registro
						if ubicacion<>-1 then // si ya existe muestra los datos
							begin
								mostrar_registro_cargado_I (archivo_I,registro_I,aux_dni,ubicacion); // Procedimiento Para mostrar los datos
								mostrar_registro_cargado_E (archivo_E,registro_E,aux_dni,ubicacion); // Procedimiento Para mostrar los datos
								gotoxy(1,24) ;
								writeln ('Ese DNI ya está cargado, pulse para continuar              ');
								readkey;
								ingresar:='N';
							end;
						if ubicacion=-1 then // Si no existe sigue cargando los otros datos
							begin
								cargar_registro_E (registro_E,aux_dni,aux_provincia,ingresar); // Carga la parte de estadistica
								guardar_registro_I (archivo_I,registro_I); // Guarda el registro
								guardar_registro_E (archivo_E,registro_E); // Guarda el registro
							end;
						cerrar_archivo_I (archivo_I); // cierra el archivo
						cerrar_archivo_E (archivo_E); // cierra el archivo
					until ingresar <> 'S'; // Sale si es distinto de S
				end;
			'2': begin // Baja de infectado y estadistica, cambia la condición true a false
					clrscr; // Limpia la pantalla
					abrir_archivo_I (archivo_I); // abre el archivo
					abrir_archivo_E (archivo_E); // abre el archivo 
					Plantilla; // Procedimiento que dibuja la plantilla
					gotoxy(1,24);
					writeln ('Ingrese el DNI: ');
					gotoxy(8,4); 
					readln (aux_dni);
					busqueda_binaria (archivo_I,aux_dni,ubicacion); // Procedimiento de busqueda binaria
					if ubicacion = -1 then
						begin
							gotoxy(1,24); 
							writeln ('No se encuentra ninguna persona con ese DNI');
						end;
					if ubicacion <> -1 then
						begin
							gotoxy(1,24);
							writeln ('Dara de Baja a esta persona (S/N)');
							ingresar:= readkey; // Toma la opción con solo teclear 
							ingresar:=upcase(ingresar); // Pasa a mayúscula
							if Ingresar='S' then
								begin
									aux_condicion:=false;
									modificar_alta_baja_I (archivo_I,ubicacion,aux_condicion); // Cambia la condición true a false
									modificar_alta_baja_E (archivo_E,ubicacion,aux_condicion); // Cambia la condición true a false
								end;
						end;
					cerrar_archivo_I (archivo_I); // cierra el archivo
					cerrar_archivo_E (archivo_E); // cierra el archivo
				end;
			'3': begin // Modificación de infectado y estadistica
					clrscr; // Limpia la pantalla
					abrir_archivo_I (archivo_I); // abre el archivo
					abrir_archivo_E (archivo_E); // abre el archivo 
					Plantilla; // Procedimiento que dibuja la plantilla
					gotoxy(1,24);
					writeln ('Ingrese el DNI: ');
					gotoxy(8,4); 
					readln (aux_dni);
					busqueda_binaria (archivo_I,aux_dni,ubicacion); // Procedimiento de busqueda binaria
					if ubicacion = -1 then
						begin
							gotoxy(1,24); 
							writeln ('No se encuentra ninguna persona con ese DNI');
						end;
					if ubicacion <> -1 then
						begin
							gotoxy(1,24);
							writeln ('quiere modificar a esta persona (S/N)');
							ingresar:= readkey; // Toma la opción con solo teclear 
							ingresar:=upcase(ingresar); // Pasa a mayúscula
							if Ingresar='S' then
								begin
									modificar_registro_I (registro_I,aux_dni,aux_provincia,ubicacion); // Muestra los datos a modificar
									modificar_registro_E (registro_E,aux_dni,aux_provincia,ubicacion); // Muestra los datos a modificar
								end;
						end;
					cerrar_archivo_I (archivo_I); // cierra el archivo
					cerrar_archivo_E (archivo_E); // cierra el archivo
				end;
			'4': begin // Buscar un infectado y su estadistica
					clrscr; // Limpia la pantalla
					abrir_archivo_I (archivo_I); // abre el archivo
					abrir_archivo_E (archivo_E); // abre el archivo
					plantilla; // Procedimiento que dibuja la plantilla
					gotoxy(1,24);
					writeln ('Ingrese el DNI ');
					gotoxy(8,4); 
					readln (aux_dni);
					busqueda_binaria (archivo_I,aux_dni,ubicacion); // Procedimiento de busqueda binaria
					gotoxy(1,24);
					writeln ('                                               ');
					if ubicacion = -1 then
						begin
							gotoxy(1,24); 
							writeln ('No se encuentra ninguna persona con ese DNI');
						end;
					gotoxy(1,27); 
					writeln ('Presione un tecla para volver al menu.');
					cerrar_archivo_I (archivo_I); // cierra el archivo
					cerrar_archivo_E (archivo_E); // cierra el archivo
					readkey;
				end;
			'5': begin // Alta de infectado y estadistica que había sido dado de baja
					clrscr; // Limpia la pantalla
					abrir_archivo_I (archivo_I); // abre el archivo
					abrir_archivo_E (archivo_E); // abre el archivo 
					Plantilla; // Procedimiento que dibuja la plantilla
					gotoxy(1,24);
					writeln ('Ingrese el DNI: ');
					gotoxy(8,4); 
					readln (aux_dni);
					busqueda_binaria (archivo_I,aux_dni,ubicacion); // Procedimiento de busqueda binaria
					if ubicacion = -1 then
						begin
							gotoxy(1,26); 
							writeln ('No se encuentra ninguna persona con ese DNI');
						end;
					if ubicacion <> -1 then
						begin
							gotoxy(1,24);
							writeln ('Dara de Alta a esta persona (S/N)');
							ingresar:= readkey; // Toma la opción con solo teclear 
							ingresar:=upcase(ingresar); // Pasa a mayúscula
							if Ingresar='S' then
								begin
									aux_condicion:=true;
									modificar_alta_baja_I (archivo_I,ubicacion,aux_condicion); // Cambia la condición false a true
									modificar_alta_baja_E (archivo_E,ubicacion,aux_condicion); // Cambia la condición false a true
								end;
						end;
					cerrar_archivo_I (archivo_I); // cierra el archivo
					cerrar_archivo_E (archivo_E); // cierra el archivo
				end;
			'6': begin // Salir del Menu, vuelve al menu principal
				end;
			else
				begin
					clrscr; // Limpia la pantalla
					writeln ('Ingreso una opcion incorrecta, pulse una tecla para continuar');
					readkey;
				end;
			end;
	until (opcion= '6');
end;

begin
end.
