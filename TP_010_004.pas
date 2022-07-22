{
4. Dada una matriz rectangular realizar un programa que devuelva el mayor de los elementos
contenidos en ella, considerando solamente aquellos en los cuales la suma de sus subíndices
es par. Es decir [1,1], [1,3], [1,5] [2,2], etc.

Tp en grupo

Burgos Gabriela
González Claudio
Kazanski Gabriel
Moran Joaquin 
}
program TP_010_004;

Uses matrices_004,crt;
Var
Ma:matriz;

begin
Inicializar_matriz(Ma);
Cargar_matriz (Ma);
Mostrar(Ma);
Mayor(Ma);
Pares(Ma);
readkey;
end.
