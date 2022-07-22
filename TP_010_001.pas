{
Calcular el promedio de notas de una lista de veinticinco alumnos de la carrera Licenciatura en
Sistemas de Información con notas en ocho materias.
}
program TP_010_001;

Uses matrices_001,crt;
Var
Ma:matriz;

begin
Inicializar_matriz (Ma);
Cargar_matriz (Ma);
Mostrar(Ma);
MostrarPromedio(Ma);
readkey;
end.
