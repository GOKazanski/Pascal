program Dias;
uses crt;
var 
Dia, Mes : byte;
anio:integer;
Date: Boolean;

BEGIN
repeat
Date:=false;
			
			writeln ('Ingrese la el dia                                              ');
			readln (Dia);
			
			
			if Dia>31 then
				begin 
					writeln ('No hay tantos dias.                                         ')
				end
			else
				begin
					writeln ('Ingrese el Mes                                             ');
					read (Mes);
					if Mes > 12then
						begin	
							writeln ('No hay tantos meses                              ');
						end	
					else
						if ((Mes=4) or (Mes=6) or (Mes=9) or (Mes=11) and (Dia>30)) or ((Mes=2) and (Dia>29)) then
							begin
								writeln ('No hay tantos dias                              ');
							end	
						else 
							begin
								
								writeln ('Ingrese el Anio                                    ');
								read (Anio);
								
								
								if ((Anio mod 4)<>0) and ((Mes=2) and (Dia=29)) then
									begin
										
										writeln ('No es anio bisiesto                             ');
									end
								else
									Date:=true;
						end;			
				end;
until Date=true;
	writeln(Dia,Mes,Anio);
END.

