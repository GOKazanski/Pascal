{
2. Una empresa con 20 sucursales que vende distintos tipos de artículos (30). Se desea acumular
cantidad de ventas por sucursal y por artículo.
}
program TP_010_002;

Uses matrices_002,crt;
Var
Ma:matriz;

begin
Inicializar_matriz(Ma);
Cargar_matriz(Ma);
Mostrar(Ma);
TotalSucusal(Ma);
TotalProdunto(Ma);
readkey;
end.
