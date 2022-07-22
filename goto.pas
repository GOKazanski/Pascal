program EjemplosGoToXY;

uses crt;

var
	i : byte;
	PosicionEnX,PosicionEnY,ContadorDeY:integer;

BEGIN
//Inicializamos variables que usaremos a futuro.
PosicionEnX:=0;
PosicionEnY:=0;
ContadorDeY:=2;

{Go To X,Y (GoToXY)
* Gotoxy es un comando que permite posicionar el puntero de la pantall
* en un punto de X e Y que nosotros le pasemos.
* Los elementos que mostramos en pantalla, si no utilizamos gotoxy, siempre
* inician en X=1 e Y=1 (es decir, la esquina superior izq).
* Y, los elementos consecutivos a este, se iran mostando
* a continuacion de los anteriores.
* 
* Utilizando gotoxy nosotros podemos desplzasar el punto a la posicion
* que nosotros querramos.
* 
* A continuacion veremos distintos ejemplos.
* }

//GoToXY clasico.
//Ejemplo 1.
delay(500); //Un pequeño delay para que veamos lo qu sucede.
gotoxy(10,1); 	//El siguiente comando que pongamos a continuacion 
				//Aparecera en X=10 e Y=1
Write('Este texto arranca en x=10 e y=1');
//Ejemplo 2.
delay(500); //Otro pequeño delay para que veamos lo qu sucede.
gotoxy(1,10); 	//El siguiente comando que pongamos a continuacion 
				//Aparecera en X=1 e Y=10
Write('Este texto arranca en x=1 e y=10');

//Luego de 4 segundos se limpiara la pantalla.
delay(4000);
clrscr;
//Descripcion del ejemplo 3.
writeln('Ahora usaremos GoToXY pero remplazaremos el valor de x y el valor de y');
Writeln('Por dos variables a las cuales les asignaremos valor.');
Writeln('Y te permitiremos ingresar la posicion del proximo texto.');
Write('Por favor oprima enter para limpiar la pantalla y continuar.');
Readkey;
clrscr;

//Ejemplo 3.
Write('Ingrese la posicion en x: ');
readln(PosicionEnX);
Clrscr;
Write('Ingrese la posicion en Y: ');
readln(PosicionEnY);
clrscr;
//Resultado del ejemplo 3.
gotoxy(PosicionEnX, PosicionEnY);
Writeln('Este texto arranca en x=',PosicionEnX,' e y=',PosicionEnY);
Write('Por favor oprima enter para limpiar la pantalla y continuar.');
readkey;
clrscr;
//Ejemplo 4, gotoxy en un Para/For.
//En este caso utilizaremos la variable i, del ciclo para, para desplazar
//verticalmente, los elementos impresos en pantalla.
for i:=1 to 50 do
begin
	gotoxy(1,i);
	write('Este texto comenzo a imprimirse en pantalla en x=1 e y=',i,'.');
	delay(350);
end;
clrscr;
Writeln('Ahora ejecutaremos el mismo codigo que en el ejemplo anterior, pero poniendo un valor maximo a los valores del eje Y.');
write('Por favor, oprima enter para limpiar la pantalla y continuar.');
readkey;
clrscr;
//Ejemplo 5.
//Como vimos en el ejemplo anterior si imprimimos demaciadas cosas en pnatalla
//es posibles que, la terminal de windows, interprete mal la pos de los elementos
//en pantalla. Para solucionar eso, utilizaremos un contador de Y y una
//validacion para solucionar la misma.
for i:=1 to 100 do
begin
	gotoxy(1,1);
	write('Ciclo numero: ',i,' de 100.');
	gotoxy(1,ContadorDeY); //En este caso en Y utilizaremos un contador que se incrementara en cada ciclo.
	write('Este texto comenzo a imprimirse en pantalla en x=1 e y=',ContadorDeY,'.');
	delay(100);
	ContadorDeY:=(ContadorDeY+1); //Incrementamos el contador.
	//Como, en mi pantalla, los elementos se comienzana ver mal a partir de Y=19.
	if (ContadorDeY>=18) theN	//Antes de reiniciar el ciclo verificamos si el 
	begin						//Contador de Y esta proximo a 30
		ContadorDeY:=2;			//De ser asi, reiniciamos el contador en 1.
		clrscr;					//Y limpiamos la pantalla.
	end;
	
	if (i=100) then				//Esto solo lanza un mensaje al final del para. 
	begin						
		Write('Por favor oprima enter para limpiar la pantalla y continuar.');
		clrscr;
	end;
end;
		gotoxy(15,7);
		WriteLn('Espero que te haya sido de ayuda!.');
		gotoxy(5,8);
		Write('Si aun estas con dudas puedes consultar por slack o el grupo de whatsapp.');
readkey;
END.
