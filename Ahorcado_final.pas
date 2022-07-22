{Deberán simular el juego del ahorcado utilizando un vector de caracteres.
En principio serán palabras relacionadas a la materia.
El programa deberá tener un menú donde permita arriesgar letras o palabras, si arriesga una palabra y falla pierde.
El programador deberá indicar la cantidad de aciertos que puede realizar el usuario del juego.
Además, deberá reflejar en pantalla guiones para que el usuario esté en conocimiento de la longitud de la palabra, y las letras que va acertando. 
Puede utilizar estructuras auxiliares. 
Deberá además diseñar un elemento para indicar intentos disponibles de falla.
El juego deberá ser presentado en clase, en grupo. 
Deberán explicar el código del ejercicio y el funcionamiento del mismo. Grupos de hasta 5 personas.
Opcionalmente podrán jugar con nombres de películas.

Tp en grupo

Burgos Gabriela
González Claudio
Kazanski Gabriel
Moran Joaquin
}

program Ahorcado_final;
uses crt;
type
	cadena=string[25];
var
	palabra, auxiliar, rayitas, jugador_1, jugador_2 : cadena;
	letra, opcion: char;
	cant_letras, posicion, vidas: integer;

// mensaje para 1 jugador
procedure menu_1_Jugador(var pal:cadena);
var
azar:integer;
begin
azar:= random (10); // toma un valor al azar
	Case azar of
	0: pal:='Acoplamiento';
	1: pal:='Compilacion';
	2: pal:='Depurador';
	3: pal:='Encapsulamiento';
	4: pal:='Programacion';
	5: pal:='Parametro';
	6: pal:='Sentencia';
	7: pal:='ordenamiento';
	8: pal:='Diagrama';
	9: pal:='Biblioteca';
	end;
	writeln (pal);
end;

// mensaje para 2 jugadores
procedure menu_2_Jugador(var pal:cadena; jug1,jug2:cadena);
begin
	clrscr;
	writeln (jug2,'!!!! Date vuelta o cerra los ojos');
	writeln ('');
	writeln (jug1,'!!!! Asegurate que no haga trampa');
	writeln ('');
	writeln ('Escribe la palabra que tendra que adivinar:');
	readln(pal);
	clrscr;
end;

// procedimiento para cambiar las letras por rayas
procedure encripta (var pal, aux_pal, raya:cadena; var c_let:integer);
var
i: integer;
begin
	pal:=upcase(pal); // Cambia toda la palabra a mayúscula 
	c_let:=length (pal); // Con esto tenemos la longitud de la palabra
	aux_pal:= pal; // Asignamos a un auxiliar el valor para no perder el dato
	raya[0]:=chr (c_let); // Indica posición de las letras
	for i:= 1 to c_let do // va pasando por cada posición del tamaño de la palabra
	raya [i]:= '_'; // Asignamos a cada letra el valor de _
	clrscr;
end;

// procedimiento para eliminar las letras de un auxiliar
procedure emboco(aux_pal:cadena; var posic:integer; let:char);
var
j:integer;
begin
	delete(aux_pal,1,posic); // borra del auxiliar solo la poción de la letra
	j:=posic;
	posic:=pos(let,aux_pal); // verifica si hay de la misma letra
	if posic<>0 then
		posic:=posic+j; // si hay otra la cambia
end;

// procedimiento para ir mostrando el dibujo
procedure hombre(var vid:integer);
begin
{
1234567890
                    
------*
A     *      
H     O    
O   \/|\/
R     | 
C    / \
A   /   \
D
O 
}

case vid of // segun la cantidad de vidas restantes hace el hombrecito

	1 : begin
			gotoxy (1,10);
			writeln ('------*');
			writeln ('A     *');
			writeln ('H     O');
			writeln ('O   \/|\/');
			writeln ('R     | ');
			writeln ('C    / \');
			writeln ('A   /   \');
			writeln ('D');
			writeln ('O');
		end;
	2 : begin
			gotoxy(7,12);
			write ('O');
		end;
	3 : begin
			gotoxy(8,13);
			write ('\/');
		end;
	4 : begin
			gotoxy(5,13);
			write ('\/');
		end;
	5 : begin
			gotoxy(7,13);
			write ('|');
			gotoxy(7,14);
			write ('|');
		end;
	6 : begin
			gotoxy(6,15);
			write ('/');
			gotoxy(5,16);
			write ('/');
		end;
	7 : begin
			gotoxy(8,15);
			write ('\');
			gotoxy(9,16);
			write ('\');
		end;
	end;
end;

// procedimiento donde va compararando las letras
procedure ingresa_letra (var let:char; var raya:cadena; var posic, vid, posusada :integer);
begin
if posic <>0 then // si no es un error sigue buscando
	repeat
		raya[posic]:=let; // si la letra tiene valor dentro de la palabra cambia el valor de lo encriptado
		gotoxy(1,5);
		write (raya);
		emboco (auxiliar,posicion,letra);
	until posic=0
		else // si es un error
			begin
				gotoxy(1,20);
				writeln('Letras utilizadas que estan erradas:');
				gotoxy(1+posusada,22);
				write(let); //Muestra las letras erroneas
				posusada:= (posusada+2); //ubica las letras erroneas
				hombre(vidas); //
				vid:=vid-1;
				gotoxy(1,24);
				writeln ('Vidas restantes: ',vid);
			end;
end;

//procedimiento para arriesgar la palabra
procedure arriesgar (var pal, raya:cadena; jug2:cadena; var vid:integer);
begin
	gotoxy (1,7);
	writeln ('Arriesgue la palabra                                     ');
	readln (raya);
	raya:= upcase (raya); // pasa a mayúscula
	if raya <> pal then
		vid:= 0;
end;

//procedimiento para el ingreso de teclado
procedure juego (var pal, raya:cadena; var let:char;var posic, vid:integer);
var
posicion_de_usadas: integer;// es para ubicar las letras erroneas
begin
posicion_de_usadas:=0;
repeat
	gotoxy(1,7);
	writeln ('Ingrese una Letra o un Numero para arriesgar palabra');
	let:=readkey; // con pulsar la tecla ya la toma
	let:= upcase (let); // pasa a mayúscula la letra
	if (let in ['A'..'Z'] )then // Pasa por acá solo las letras
		begin
			posic:=pos(letra,palabra); // ubica la posición de la letra dentro de la palabra
			ingresa_letra (letra,rayitas,posicion,vidas,posicion_de_usadas)
		end
	else
		if (let in ['0'..'9']) then // pasa por aca solo los numeros
			arriesgar (palabra,rayitas,jugador_2,vidas)
		else
			writeln ('Ingreso una opcion incorrecta'); // si colocó un caracter especial
until (raya=pal) or (vid=0); // sale si se cumple que acertó o que perdió
	if raya=pal then // Si ganó
		begin
			gotoxy (1,25);
			writeln (jugador_2,' Ganaste!!!!')
		end
		else // Si perdió
		begin
			gotoxy (1,25);
			writeln (jugador_2,'!! Lo lamento, has perdido');
			writeln ('');
			writeln ('La palabra era: ',pal);
		end;
	readkey;
	clrscr;
end;

//Menú de opciones para el juegos
procedure menu (var opc:char);
begin
repeat
	vidas:=7;
	writeln ('---------------------------------------');
	writeln ('--------------Bienvenido---------------');
	writeln ('-------Vamos a Jugar al Ahorcado-------');
	writeln ('--Elija una de las opciones del menu---');
	writeln ('---------------------------------------');
	writeln ('1--------------1 Jugador---------------');
	writeln ('2-------------2 Jugadores--------------');
	writeln ('3----------------Salir-----------------');
	writeln ('---------------------------------------');
	opc:= readkey; // con pulsar la tecla ya la toma
	Case opc of
	'1': begin
			writeln('Ingrese su nombre');
			readln (jugador_2);
			jugador_2 := upcase (jugador_2); // pasa a mayúscula en nombre
			menu_1_Jugador (palabra);
			encripta (palabra, auxiliar, rayitas, cant_letras);
			writeln ('La palabra tiene: ', cant_letras, ' letras.');
			writeln ('');
			writeln ('Tienes 7 vidas, no las malgastes!');
			writeln ('');
			writeln (rayitas);
			juego (palabra,rayitas,letra,posicion,vidas);
		end;
	'2': begin
			writeln('Ingrese el nombre del Jugador N 1');
			readln (jugador_1);
			jugador_1 := upcase (jugador_1); // pasa a mayúscula en nombre
			writeln('Ingrese el nombre del Jugador N 2');
			readln (jugador_2);
			jugador_2 := upcase (jugador_2); // pasa a mayúscula en nombre
			menu_2_Jugador (palabra,jugador_1,jugador_2);
			encripta (palabra, auxiliar, rayitas, cant_letras);
			writeln ('La palabra tiene: ', cant_letras, ' letras.');
			writeln ('');
			writeln ('Tienes 7 vidas, no las malgastes!');
			writeln ('');
			writeln (rayitas);
			juego (palabra,rayitas,letra,posicion,vidas);
		end;
	'3': begin 
		writeln ('Gracias por jugar con nosotros');
		writeln ('');
		writeln ('G. Burgos - C. Gonzalez - G. Kazanski - J. Moran');
		end;
	else
		writeln ('Ingreso una opcion incorrecta');
		clrscr;
	end;
until (opc= '3');
end;

// Cuerpo principal
BEGIN
Randomize;
menu (opcion);
readkey;
END.
