{
En grupo deberán evaluar los distintos métodos de ordenamiento vistos
en clase con distintos elementos (Indicar la cantidad que utilizaron). 
Para esto deberán medir el tiempo que demora en ordenar cada algoritmo y compararlos. 
(Utilizar la función predefinida gettime de Pascal).

Tp en grupo

Burgos Gabriela
González Claudio
Kazanski Gabriel
Moran Joaquin
}

program ejemplo_tiempos;
uses crt,dos;
const n = 65000;

type 
    
vec = array[1..n] of word;
dato= word;

procedure inicializar(var v:vec);
var 
j:dato;
begin
	for j:=1 to n do
	begin
		v[j] := 0;
	end;
end;
  
procedure cargar(var v:vec);
var 
j:dato;
begin
    for j:=1 to n do
    begin
        v[j] := random(10000);
    end;
end;
  
procedure listado(var v:vec; lim:dato);
var 
j : dato;
begin
    for j:=1 to lim do
    begin
        writeln('Valor: ', v[j]);
    end;
end;

Procedure Burbuja(var v:vec; lim:dato);
var i,j,aux:dato;
begin
	For i:=1 to lim - 1 do 												//Recorre el vector
	begin
		For j:=1 to lim - i do 											//Recorre el vector ordenando
		begin
			if v[j] > v[j+1] Then
			begin
				aux:=v[j];
				v[j]:=v[j+1];
				v[j+1]:=aux;
			end;
		end;
	end;
end;

procedure burbuja_mejorado(var v:vec; lim:dato);
var orden:boolean;
j,aux:dato;
begin
     orden:=false;  													// suponemos que la primera vez no esta ordenada
     while orden<>true do
     begin
          orden:=true;
          for j:=1 to lim-1 do    										// recorre vector ordenado
          begin
               if v[j]>v[j+1] then     									//compara elementos
               begin
                    orden:=false;            							// como hay intercambio la variable orden pasa a false,
                    aux:=v[j];            								//  porque esta desordenado el vector
                    v[j]:=v[j+1];
                    v[j+1]:=aux;
               end;
          end;
     end;
end;

procedure seleccion (var v:vec; lim:dato);
var aux,i,j,min:dato;
begin
     for i:=1 to lim-1 do     											// Recorre el vector
     begin
          min:=i;
          for  j:=i+1 to lim do   										//busca el elemento menor del vector
          begin
               if v[min]>v[j] then      								//se pregunta si es menor
               min:=j;                         							// si se cumple se guarda la posición del elemento menor
          end;
          aux:=v[min];                      							//Realiza intercambio
          v[min]:=v[i];                  
          v[i]:=aux;
     end;
end;

procedure insercion (var v:vec; lim:dato);
var i,j,aux:dato;
begin
     for i:=2 to lim do      											//recorre el vector
     begin
          j:=i-1;
          aux:=v[i];
          while (j>0) and (v[j]>aux) do      							//evalúa dos elementos del vector
          begin                                 						// para saber si el que esta antes es menor.
               v[j+1]:=v[j];              								// en esta línea desplaza el numero que es mayor hacia
               j:=j-1;                          						// una posición mas del vector
          end;                                  
          v[j+1]:=aux;                       
     end;
end;

procedure tiempo (var hr,mn,sg,csg,t:word);
var
hri,mni,sgi:word;
ti, tf: word;
// final  18:03:12:050	18:03:12:050
// inicio 17:59:59:049	17:04:13:060
// resto  00:03:13:001	00:58:59:090

begin
writeln ('Inicio H:',hr,' M:',mn,' S:',sg,' M:',csg);					
hri:=hr*3600;
mni:=mn*60;
sgi:=sg;
ti :=(hri+mni+sgi);

gettime(hr,mn,sg,csg);
writeln ('Final  H:',hr,' M:',mn,' S:',sg,' M:',csg);
tf :=(hr*3600+mn*60+sg);

hr:=(hr*3600)-hri;
mn:=(mn*60)-mni;
sg:=(sg-sgi);

t:= (tf-ti);
end;


var
v : vec;  
limite : dato;
hora,minu,segu,mile,tardo: word;

begin

	limite:=n;
    randomize;
    
    inicializar(v);
    cargar(v);
    writeln ('comienza ordenamiento burbuja para: ',n,' datos');
    gettime(hora,minu,segu,mile);
    burbuja (v, limite);
    writeln ('Fin del ordenamiento burbuja');
    tiempo (hora,minu,segu,mile, tardo);
    writeln ('tiempo transcurrido: ', tardo,' segundos');
    writeln ();
 
    inicializar(v);
    cargar(v);
    writeln ('comienza ordenamiento burbuja mejorado para: ',n,' datos');
    gettime(hora,minu,segu,mile);
    burbuja_mejorado (v, limite);
    writeln ('Fin del ordenamiento burbuja mejorado');
    tiempo (hora,minu,segu,mile, tardo);
    writeln ('tiempo transcurrido: ', tardo,' segundos');
    writeln ();
   
    inicializar(v);
    cargar(v);
    writeln ('comienza ordenamiento seleccion para: ',n,' datos');
    gettime(hora,minu,segu,mile);
    seleccion (v, limite);
    writeln ('Fin del ordenamiento seleccion');
    tiempo (hora,minu,segu,mile, tardo);
    writeln ('tiempo transcurrido: ', tardo,' segundos');
    writeln ();
    
    inicializar(v);
    cargar(v);
    writeln ('comienza ordenamiento insercion para: ',n,' datos');
    gettime(hora,minu,segu,mile);
    insercion (v, limite);
    writeln ('Fin del ordenamiento insercion');
    tiempo (hora,minu,segu,mile, tardo);
    writeln ('tiempo transcurrido: ', tardo,' segundos');
    writeln ();
   
    readkey; 
    
end.


