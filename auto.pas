Program Registros_pruebaunit;
Uses UNit_registros,crt;
Var
Persona:registro;

begin
Inicializar_registro(Persona);
Cargar_registro (Persona);
Clrscr;
Mostrar(Persona);
readkey;
end.
