unit UNit_registros;
 
interface         { Parte "pública", que se exporta }
uses crt;

Type
    t_cadena30=string[30];

   registro=record
        nombre: t_cadena30;
        edad:byte;
    end;
 

Procedure Inicializar_registro (Var Reg: registro);
Procedure Cargar_registro (Var Reg: registro);
Procedure Mostrar(Var Reg: registro);


IMPLEMENTATION


Procedure Inicializar_registro (Var Reg: registro);
Begin
with reg do
     begin
          nombre:='';
          edad:=0;
     end;
End;

Procedure Cargar_registro (Var Reg: registro);
Begin
with reg do
     begin
          write ('ingrese su nombre: ');
          readln(nombre);                     //reg.nombre
          write ('ingrese su edad: ');
          readln(edad);                       //reg.edad
     end;
End;

Procedure Mostrar(Var Reg: registro);
Begin
with reg do
     begin
          write ('El nombre es:  ');
          writeln(nombre);
          write ('Su edad es:  ');
          writeln(edad);
     end;
End;

Begin
End.
