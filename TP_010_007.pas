{
7. Sumar los elementos que están por encima de la diagonal principal de una matriz dada
}

program TP_010_007;

Uses matrices_007,crt;
Var
Ma:matriz;
total:integer;

begin
Inicializar_matriz(Ma);
Cargar_matriz (Ma);
Mostrar(Ma);
suma (Ma,total);
readkey;
end.
