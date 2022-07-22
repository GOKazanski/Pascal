{
2. Realizar la declaración de tipo registro para un automóvil: los campos son marca,
modelo, año, color, Nº de puertas y precio
   
}


unit UNit_autos;
 
interface         { Parte "pública", que se exporta }
uses crt;

Type
    t_cadena30=string[30];

   registro=record
        marca: t_cadena30;
        modelo:t_cadena30;
        anio:integer;
        color: t_cadena30;
        puertas:byte;
        Precio:real
        
    end;
 

Procedure Inicializar_registro (Var Reg: registro);
Procedure Cargar_registro (Var Reg: registro);
Procedure Mostrar(Var Reg: registro);


IMPLEMENTATION


Procedure Inicializar_registro (Var Reg: registro);
Begin
with reg do
     begin
			marca:='';
			modelo:='';
			anio:=0;
			color:='';
			puertas:=0;
			Precio:=0;
     end;
End;

Procedure Cargar_registro (Var Reg: registro);
Begin
with reg do
     begin
		write ('ingrese la marca: ');
		readln(marca); 	//reg.nombre
		write ('ingrese la modelo: '
		readln(modelo); 	//reg.nombre
		write ('ingrese el anio: ');
		readln(anio); 	//reg.nombre
		write ('ingrese el color: ');
		readln(color); 	//reg.nombre
		write ('ingrese la cantidad de puertas: ');
		readln(puertas); 	//reg.nombre
		write ('ingrese el valor en Pesos: ');
		readln(precio); 	//reg.nombre
     end;
End;

Procedure Mostrar(Var Reg: registro);
Begin
with reg do
     begin
		write ('la marca:, ');
		writeln(marca);
		write ('modelo: '
		writeln(modelo); 
		write (' el anio: ');
		writeln(anio);
		write ('el color: ');
		writeln(color); 
		write ('cantidad de puertas: ');
		writeln(puertas); 
		write ('valor en Pesos: ');
		writeln(precio); 
     end;
End;

Begin
End.
