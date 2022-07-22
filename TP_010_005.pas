{
5. Se tiene una matriz de 150 filas y 12 columnas de celdas reales. 
Las filas representan 150 clientes y las columnas los 12 meses del año. 
Cada celda contiene el monto total facturado a cada cliente c/mes. 
Se pide: 
a- Mostrar el monto facturado al cliente 142 en el mes de Agosto.
b- Mostrar el Nº de cliente que registró el mayor monto de facturación mensual. 
c- Mostrar en que mes se registró la menor facturación mensual para un cliente


Tp en grupo

Burgos Gabriela
González Claudio
Kazanski Gabriel
Moran Joaquin
}
program TP_010_005;

Uses matrices_005,crt;
Var
Ma:matriz;

begin
Inicializar_matriz(Ma);
Cargar_matriz(Ma);
Mostrar(Ma);
MostrarClienteMes(Ma);
MayorVentaCliente(Ma);
MenorVentaCliente(Ma);
readkey;
end.
