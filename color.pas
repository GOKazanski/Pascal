program untitled;

uses crt;
const n=15;
var i,j: integer;

BEGIN
 writeln ('Escala de colores');
 
    for j:=0 to n do
    begin
		TextBackground (j);
		for i:=0 to n do
		begin
			TextColor (i);
			gotoxy (1+7*i,2+j);
			writeln(' T ',i,' ');
		end;
    end;   

END.

{Black 0 Negro
Blue 1 Azul
Green 2 Verde
Cyan 3 Cyan
Red 4 Rojo
Magenta 5 Magenta
Brown 6 Marrón
Light Gray 7 Gris claro
Dark gray 8 Gris oscuro
Light Blue 9 Azul claro
Light Green 10 Verde claro
Light Cyan 11 Cyan claro
Light Red 12 Rojo claro
Light Magenta 13 Magenta claro
Yellow 14 Amarillo
White 15 Blanco
Blink 128 Parpadeo}
