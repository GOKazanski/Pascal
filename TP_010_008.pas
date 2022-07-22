{
8. Sumar los elementos que están en la diagonal principal de una matriz dada.
}
program TP_010_001;

Uses matrices_001,crt;
Var
Ma:matriz;
total:integer;

begin
Inicializar_matriz(Ma);
Cargar_matriz (Ma);
Mostrar(Ma);
suma (Ma,total);
//mostrar2(Ma);
readkey;
end.
