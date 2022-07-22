{
1. Hacer un algoritmo que:
Lea una lista de números de teclado que culmina con uno negativo.
Los ordene en forma creciente y Visualice la lista ordenada.
Buscar si existe el Nº 27 en la lista
   
}
program TP_009_Vec_001;
uses crt;
const
cant=10;

type
	t_vector=array [1..cant] of integer;
	t_datos=integer;
	
var
	vect_numeros: t_vector;
	limite:t_datos;

procedure inicializar (var vec:t_vector; var lim:t_datos);
var
	j:t_datos;
begin
	lim:=0;
	for j:=1 to cant do
		begin
		vec[j]:=0
		end;
end;	

procedure cargar (var vect:t_vector; var lim:t_datos);
var 
	aux:t_datos;
begin
	writeln ('Ingrese un numero');
	readln (aux);
	while aux >= 0 do
	begin
		inc(lim);
		vect[lim]:=aux;
		if lim < cant then
		begin
			writeln ('Ingrese un numero');
			readln (aux);
		end;
	end;
end;	

procedure seleccion (var vect:t_vector; lim:t_datos);
var aux,i,j,min:integer;
begin
     for i:=1 to lim-1 do     // Recorre el vector
     begin
          min:=i;
          for  j:=i+1 to lim do   //busca el elemento menor del vector
          begin
               if vect[min]>vect[j] then       //se pregunta si es menor
               min:=j;                         // si se cumple se guarda la posición del elemento menor
          end;
          aux:=vect[min];                      //Realiza intercambio
          vect[min]:=vect[i];                  //
          vect[i]:=aux;
     end;
end;

procedure listar (vect:t_vector; lim:t_datos);
var j:integer;
begin
    for j:=1 to lim do
    begin 
		writeln (j, ' es: ',vect[j]);
		
	end;
end;

procedure buscar (vect:t_vector; lim:t_datos);
var j:integer;
begin
    for j:=1 to lim do
    begin 
		if vect [j]=27 then
			writeln ('Buscado esta en: ',j, ' es: ',vect[j]);
		
	end;
end;

BEGIN
inicializar (vect_numeros, limite);	
cargar (vect_numeros,limite);														// llama al procedimiento cargar
seleccion (vect_numeros, limite);	
listar (vect_numeros, limite);
Buscar (vect_numeros, limite);
END.
