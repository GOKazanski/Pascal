Program Vectores;
Uses CRT;

Const																	//DEFINICIÓN DE CONSTANTES
N=5;

Type																	//DEFINICIÓN DE TIPOS DE DATOS DEFINIDOS POR EL USUARIO
T_vector=array[1..n] of integer;
subrango=1..N;
Var

i,limite:subrango;														//subrango
Vector_Numeros, Auxiliar:T_vector;

Procedure Inicializar_Vector(Var V:T_vector);							//Inicializa en el valor neutro cada posición del vector
Var
j:subrango;
Begin
For j:= 1 to N do
    V[j]:=0;
End;

Procedure Inicializar_Vector2(Var V:T_vector;Var lim:subrango);          //Inicializa en el valor neutro cada posición del vector  y el LIMITE
Var
j:subrango;
Begin
lim:=0;
For j:= 1 to N do
    V[j]:=0;
End;

Procedure Cargar_Vector(Var V:T_vector);								//Carga el vector elemento a elemento
Var
j:subrango;
Begin
For j:= 1 to N do
    Begin
          Writeln('Ingrese el valor de la posición ', j);
          Readln(V[j]);
    End;
End;

Procedure Cargar_Vector2(Var V:T_vector;Var lim:subrango);				//Carga el vector hasta que el usuario desea
Var
j:subrango;
aux:integer;
Begin
      Writeln('Ingrese un valor');
      Readln(aux);
      While ((aux<>0) and (lim<N)) do
    Begin
          inc(lim);
          V[lim]:=aux;
          Writeln('Ingrese un valor');
          Readln(aux);
    End;
End;

Procedure Listar_Vector(Var V:T_vector);								//Muestra por pantalla todos los elementos del vector
Var
j:subrango;
Begin
For j:= 1 to N do
     Writeln('el elemento ',j, '  es  ',V[j]);
End;

Procedure Copiar_Vector1(Var V, Aux:T_vector);							//Copia los elementos del Vector V en Aux, elemento a elemento
Var
j:subrango;

Begin
For j:= 1 to N do
     AUX[J]:=V[j];
End;

Procedure Copiar_Vector2(Var V, Aux:T_vector);							//Copia el Vector V en Aux (PARA ESTO LOS VECTORES DEBEN ESTAR DEFINIDOS EXACTAMENTE DEL MISMO TIPO)
Var
j:subrango;
Begin
For j:= 1 to N do
     AUX:=V;
End;

begin
CLRSCR;
Inicializar_Vector(Vector_Numeros);
Cargar_Vector(Vector_Numeros);
//Inicializar_Vector2(Vector_Numeros,limite);
//Cargar_Vector2(Vector_Numeros,limite);
Copiar_Vector1(Vector_Numeros,Auxiliar);
Copiar_Vector2(Vector_Numeros, Auxiliar);
Listar_Vector(Vector_Numeros);
READKEY;
end.
