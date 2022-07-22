{
3. Dada una matriz de 5 filas y 10 columnas: 
a- Escribir el algoritmo necesario para cargar la matriz con valores. 
B- Determinar la sumatoria de c/u de las columnas.
C- Mostrar el mayor valor de c/u de sus columnas. 
D- Mostrar la posición (F,C) del menor valor de la matriz
}
program TP_010_003;

Uses matrices_003,crt;
Var
Ma:matriz;

begin
Inicializar_matriz(Ma);
Cargar_matriz(Ma);
Mostrar(Ma);
TotalColumna(Ma);
Mayor_columna(Ma);
Menor(Ma);
readkey;
end.
