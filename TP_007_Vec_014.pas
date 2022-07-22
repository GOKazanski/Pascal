{
14. Dado un texto que finaliza en punto, se pide:
a. la posición inicial de la palabra más larga,
b. la longitud del texto,
c. cuantas palabras con una longitud entre 8 y 16 caracteres poseen más de tres veces la vocal
“a”,
Nota:
Las palabras pueden estar separadas por uno o más espacios en blanco.
Puede haber varios espacios en blanco antes de la primera palabra y también después de la
última.
Se considera que una palabra finaliza cuando se encuentra un espacio en blanco o un signo
de puntuación.
}
program TP_007_Vec_014;
uses crt;

const 
r=10; 																	// Constante para la cantidad de vectores

type
	t_vector=array [1..r] of string[100];
	t_datos=string [100];
	subrango=0..r;
	
var
	vector, vector_copia:t_vector;
	limite:subrango;
	posicion_inicial, posicion_vector, palabra_maxima, cantidad_de_a:integer;
	opcion:char;
	
procedure inicializar(var vect:t_vector; var lim:subrango); 			// procedimiento para inicializar los vectores
var 
	j:subrango;
begin
    for j:=1 to r do
    begin 
		vect[j]:='';
    end;
    lim:=0;
end;

procedure cargar (var vect:t_vector; var lim:subrango);
var 
	aux:t_datos;
begin
	writeln ('Ingrese la primera oracion');
	readln (aux);
	while ((aux <>'.') and (lim<r))do
	begin
		inc(lim);
		vect[lim]:=aux;
		if lim < r then
		begin
			writeln ('Ingrese la oracion');
			readln (aux);
		end;
	end;
end;

procedure listar (var vect:t_vector; lim:subrango);
var 
	j:subrango;
begin
    for j:=1 to lim do
    begin 
		writeln (j,': ',vect[j]);
	end;
end;

procedure copiar (Var Vect, vect_copy:t_vector; lim:subrango);							
var 
	j:subrango;
begin
	For j:= 1 to lim do
    begin
		vect_copy:=Vect;
	end;	
end;

procedure largo_frase (var vect:t_vector; lim:subrango);
var
	j:subrango;
	largo:integer;
begin
	largo:=0;
	for j:=1 to lim do
	begin
		writeln ('la longitud de la oracion: ',j,' es: ',length(vect[j]));
		largo:=largo+length(vect[j]);
	end;
	writeln ('la cantidad total de caracteres es: ',largo);
end;

procedure palabras_larga (var vect:t_vector; lim:subrango; var pos_v, pos_ini, largo_max:integer);
var
	j,p:subrango;
	palabra:t_datos;
	cont_letras:integer;
begin
	largo_max:=0;
    for j:=1 to lim do
    begin
		palabra:=vect [j];
		cont_letras:=0;
		for p:=1 to length (palabra) do
		begin
			if (palabra [p] in ['a'..'z']) or (palabra [p] in ['A'..'Z'])then
			begin
				cont_letras:=cont_letras+1;
			end
			else
			begin
				cont_letras:=0;		
			end;					
			if cont_letras>largo_max then
			begin
				largo_max:= cont_letras;
				pos_v:=j;
				pos_ini:=p+1-largo_max
			end;
		end;	
	end;
end;

procedure buscar_a (var vect:t_vector; lim:subrango; var cont_palab:integer);
var
	j,p:subrango;
	palabra:t_datos;
	cont_letras, cont_a:integer;
	
begin
	cont_palab:=0;
    for j:=1 to lim do
    begin
		palabra:=vect [j];
		cont_letras:=0;
		cont_a:=0;
		for p:=1 to length (palabra) do
		begin
			if (palabra [p] in ['a'..'z']) or (palabra [p] in ['A'..'Z'])then
			begin
				inc (cont_letras);
				if (palabra [p]='a') or (palabra [p]='A') then
				begin
					inc (cont_a)
				end;
			end
			else
			begin
				if ((cont_letras>7) and (cont_letras<17)) and (cont_a>2) then
				begin
					inc (cont_palab);
				end;
				cont_letras:=0;
				cont_a:=0
			end;	
			if (p=length (palabra))and ((palabra [p] in ['a'..'z']) or (palabra [p] in ['A'..'Z']))then
			begin
				inc (cont_palab);
				cont_letras:=0;
				cont_a:=0
			end;
		end;	
	end;
end;

procedure menu (var opc:char);
BEGIN
	repeat
		clrscr;
		writeln ('*-----------------------------------------*');
		writeln ('*             Elija una opcion            *');
		writeln ('*-----------------------------------------*');
		writeln ('* 1 - Ingresar las oraciones              *');
		writeln ('* 2 - Listar                              *');
		writeln ('* 3 - Realizar copia                      *');	
		writeln ('* 4 - longitud de oracion                 *');
		writeln ('* 5 - Largo palabra                       *');
		writeln ('* 6 - buscar 3 "a" en palabras            *');
		writeln ('* 7 - Salir                               *');
		writeln ('*-----------------------------------------*');
		opc:=readkey;
		case opc of
			'1': begin
					cargar(vector,limite);
				end;
			'2': begin
					listar(vector,limite);	
				end;
			'3': begin
					copiar (vector, vector_copia, limite);
					listar (vector_copia,limite);
				end;		
			'4': begin
					largo_frase (vector,limite);
				end;
			'5': begin
					palabras_larga (vector,limite, posicion_vector, posicion_inicial, palabra_maxima);
					writeln ('la palabra mas larga esta en el renglon: ',posicion_vector, ' y comienza en la posicion: ', posicion_inicial );
					writeln ('la palabra es: ',copy (vector [posicion_vector], posicion_inicial, palabra_maxima));
				end;		
			'6': begin
					buscar_a (vector,limite, cantidad_de_a);
					writeln ('Cantidad de palabras largas que contienen 3 a son: ',cantidad_de_a);
				end;
			'7': writeln ('gracias por usar el sistema')
			else
				writeln ('eligio una opcion incorrecta');
			end;
			readkey;
	until (opc='7');		
END;

Begin
	inicializar (vector,limite);
	menu (opcion);
	readkey;
end.
