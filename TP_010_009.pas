{
9. Una empresa de transporte de pasajeros de larga distancia posee micros de 4 categorías y
viaja a 250 localidades de zonas turísticas del país. 
No necesariamente todas las temporadas se habilitan las 4 categorías, 
ni hay viajes a todas las localidades posibles.
a- Se dispone de un registro de todos los pasajes vendidos en una temporada consistente en: 
código de categoría (a, b, c, d y código de destino (1 a 250) y de un listado ordenado
por código del nombre de cada localidad de destino.
Se pide informar:
a- La cantidad de pasajeros por localidad, por categoría.
b- El nombre de la localidad a la que viajó la mayor cantidad de pasajeros.
c- El nombre de la localidad a la que viajó la menor cantidad de pasajeros.

Tp en grupo

}
program TP_010_009;

Uses matrices_009,crt;
Var
Ma:matriz;


begin
Inicializar_matriz(Ma);
Mostrar(Ma);
Cargar_matriz (Ma);
suma_ciudad (Ma);
suma_categoria (Ma);
mostrar (Ma);

readkey;
end.
