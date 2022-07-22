Program asteriscos;
Var
Cant:integer;

procedure EscribirAsteriscos( cantidad: integer );
var
 i: byte; //Variable local
begin // Escribimos N asteriscos
 for i := 1 to cantidad do write('*');
end;
(* Cuerpo del programa *)
begin
 writeLn( 'Ingrese la cantidad de asteriscos que desea imprimir en pantalla' );
 readln (cant); // falto read (cant)
 EscribirAsteriscos(cant);
 //EscribirAsteriscos(18);
end.
