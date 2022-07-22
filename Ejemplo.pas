Program Paralelo_edades; {El siguiente programa captura 10 edades y nombres por medio de
arrays paralelos y los muestra ordenados en forma ascendente}
Uses Crt;
Const
 MaxPersonas = 5;
Var
edades :array [1..MaxPersonas] of byte;
nombres :array [1..MaxPersonas] of string [10];
aux_nom :string[10];
i,j,aux_edad :byte;
begin
 ClrScr;
 {lectura de arrays paralelos de manera simultánea}
	 for i:=1 to MaxPersonas do
		 begin
			 gotoxy(10,4);
			 ClrEol;
			 Write(i,'.- Nombre : ','Edad : ');
			 gotoxy(23,5);ReadLn(nombres[i]) ;
			 gotoxy(48,5);ReadLn(edades[i])
		 end;
	{ordenación}
	 for i:=1 to MaxPersonas-1 do
		begin
			for j:=i+1 to MaxPersonas do
				begin
					if edades[i]>edades[j] then
						begin
							 aux_edad :=edades[i];
							 edades[i] :=edades[j];
							 edades[j] :=aux_edad;
							 aux_nom :=nombres[i];
							 nombres[i]:=nombres[j];
							 nombres[j]:=aux_nom
						 end
				end;
			WriteLn(nombres[i]:10,' ',edades[i]:3) 
		{escritura de los arrays paralelos}
		end;
 Readkey
end. 
