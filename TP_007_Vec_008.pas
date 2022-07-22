{
8. Imprimir la media de los elementos que se encuentran en las posiciones pares y la media de
los elementos que se encuentran en las posiciones impares de un vector numérico
}
program TP_007_Vec_008;
uses crt;

const N=10; 															// Constante para la cantidad de vectores

type
t_vector = array [1..n] of integer; 									// limita el conjunto del 1 a la constante
t_dato = integer;
t_prom = real;

var
v:t_vector;
par:t_prom;
imp:t_prom;

procedure inicializar(var vect:t_vector); 								// procedimiento para inicializar los vectores
var j:t_dato;
begin
     for j:=1 to n do
     vect[j]:=0;
end;

procedure cargar(var vect:t_vector); 									// procedimiento para ir cargando los vectores
var j:t_dato;
begin
     for j:=1 to n do
     begin
          writeln('ingrese un numero');
          readln(vect[j]);
     end;
end;

procedure promedio(var vect:t_vector; var pro_par,pro_imp:t_prom);		// procedimiento para operar los vectores
var 
j:t_dato;
pares, impares:t_dato;
C_par,C_imp:t_dato;

begin
    pares:=0;
    impares:=0;
    c_par:=0;
    c_imp:=0;
    for j:=1 to n do
		begin
			if (j mod 2)=0 then
				begin
					pares:=pares+vect[j];
					inc (c_par)
				end
			else
				begin
				impares:=impares+vect[j];
				inc (C_imp)
				end;	
		end;
    //writeln (c_par);
    //writeln (pares);
    //writeln (c_imp);
    //writeln (impares);  
	pro_par:=(pares/c_par);
	pro_imp:=(impares/c_imp);
end;


BEGIN
	inicializar(v); 													// llama al procedimiento inicializar
	cargar(v); 															// llama al procedimiento cargar
	promedio (v,par,imp);
	writeln('La media de los numeros de posicion par es: ',par:2:2);
	writeln('La media de los numeros de posicion impar es: ',imp:2:2);
	readkey;
END.
