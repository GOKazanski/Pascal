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

}
unit matrices_009;
 interface { Parte "pública", que se exporta }
 uses crt;

Const
N=3;// N=250 ciudades
M=4; // categorias

Type
matriz=array[1..N,1..M]of integer;
t_vector= array [1..N] of integer;

Procedure Inicializar_matriz (Var Mat:matriz);
Procedure Cargar_matriz (Var Mat:matriz);
Procedure Mostrar(Mat:matriz);
procedure suma_ciudad (var Mat:matriz );
procedure suma_categoria (var Mat:matriz );
var 
notas:integer;

IMPLEMENTATION

Procedure Inicializar_matriz(Var Mat:matriz);
Var
f:1..N;
c:1..M;
begin
for f:=1 to N do
	for C:=1 to M do
		Mat[f,c]:=0;
end;

Procedure Cargar_matriz (Var Mat:matriz);
Var
f:1..N;
c:1..M;
aux, cant_pasaj,cant_pasaj_menor,cant_pasaj_mayor:integer;
aux_ciudad,aux_ciudad_mayor, aux_ciudad_menor:string;
categ:char;
begin
cant_pasaj_mayor:=0;
cant_pasaj_menor:=1000;
aux:=0;
for f:=1 to N do
	begin
		cant_pasaj:=0;
		writeln ('Ingrese la ciudad');
		readln (aux_ciudad);
			for C:=1 to M do
				begin
					if c=1 then
					categ:='A'
					else
					if c=2 then
					categ:='B'
					else
					if c=3 then
					categ:='C'
					else
					categ:='D';
					writeln('ingrese un valor para la ciudad: ',aux_ciudad, ' y para la categoria ', categ);
					readln (aux);
					Mat[f,c]:=aux;
					cant_pasaj:=cant_pasaj+aux;
	end;
	if cant_pasaj>cant_pasaj_mayor then
		begin
		aux_ciudad_mayor:=aux_ciudad;
		cant_pasaj_mayor:=cant_pasaj
		end;
	if cant_pasaj<cant_pasaj_menor then
		begin
		aux_ciudad_menor:=aux_ciudad;
		cant_pasaj_menor:=cant_pasaj
		end;
	end;
	writeln ('La ciudad con mayor cantidad de pasajeros es: ',aux_ciudad_mayor);
	writeln ('La ciudad con menor cantidad de pasajeros es: ',aux_ciudad_menor);
end;

Procedure Mostrar(Mat:matriz);
Var
f:1..N;
c:1..M;
begin
	for f:=1 to N do
		begin
			for C:=1 to M do
				write(Mat[f,c],' ');
		writeln(**);
	end;
end;
 
procedure suma_ciudad (var Mat:matriz );
var
f:1..N;
c:1..M;
aux:integer;
begin 
aux:=0;
	for f:=1 to N do
	begin
		for c:=1 to M do
			begin
				aux:=(aux+ mat[f,c]);
			end;
				writeln('ciudad: ',f, 'Cantidad de pasajeros: ',aux );
				aux:=0;
	end;
end;

procedure suma_categoria (var Mat:matriz);
var
f:1..N;
c:1..M;
aux:integer;
categ:char;
begin 
aux:=0;
	for c:=1 to M do
	begin
		for f:=1 to N do
			begin
				aux:=(aux+ mat[f,c]);
			end;
				if c=1 then
				categ:='A'
				else
				if c=2 then
				categ:='B'
				else
				if c=3 then
				categ:='C'
				else
				categ:='D';
				writeln('La categoria: ',categ, 'tiene la cantidad de pasajeros: ',aux );
				aux:=0;
	end;
end;

begin
 
end.
