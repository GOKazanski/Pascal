unit matrices;
 
 interface         { Parte "pública", que se exporta }
 uses crt;

 Const
 N=3;
 M=2;

Type
 matriz=array[1..N,1..M]of integer;

Procedure Inicializar_matriz (Var Mat:matriz);
Procedure Cargar_matriz (Var Mat:matriz);
Procedure Mostrar(Mat:matriz);

IMPLEMENTATION

Procedure Inicializar_matriz(Var Mat:matriz);
Var
 f:1..N;
 c:1..M;
 Begin
  for f:=1 to N do
  for C:=1 to M do
     Mat[f,c]:=0;
 End;

Procedure Cargar_matriz (Var Mat:matriz);
 Var
 f:1..N;
 c:1..M;
 Begin
 for f:=1 to N do
 for C:=1 to M do
   begin
      write('ingrese un valor: ');
      readln(Mat[f,c]);
   end;
End;

Procedure Mostrar(Mat:matriz);
Var
 f:1..N;
 c:1..M;
 Begin
 for f:=1 to N do
 begin
      for C:=1 to M do
          write(Mat[f,c],' ');
      writeln(**);
 end;
 END;

 Begin
 End.
