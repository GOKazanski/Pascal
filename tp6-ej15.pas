Program TP_006_15;

uses crt;

Var
    num_elegido,NumeroDeCartaLevantada,CartasLevantadas,AuxPalo:integer;
    palo_elegido,PaloDeCartaLevantada: String[10];
	TerminarCiclo:boolean;

BEGIN
	TerminarCiclo:=False;
	WriteLn('Seleccione el palo de la primer carta levantada del mazo:');
	WriteLn('Ingrese 1 para seleccionar Oro.');
	WriteLn('Ingrese 2 para seleccionar Basto.');
	WriteLn('Ingrese 3 para seleccionar Copa.');
	WriteLn('Ingrese 4 para seleccionar Espada.');
	ReadLn(AuxPalo);
	Case AuxPalo of
		1: palo_elegido:='Oro';
		2: palo_elegido:='Basto';
		3: palo_elegido:='Copa';
		4: palo_elegido:='Espada';
	else
	begin
		WriteLn('El numero seleccionado, no corresponde a una opcion valida.');
		WriteLn('El sistema ha seleccionado por usted: Oro.');
		palo_elegido:='Oro';
	end
	end;
	
	while TerminarCiclo<>true do //segundo ciclo
	begin //comienza el miemtras.
		Write('Ingrese el numero de la primer carta levantada del mazo: ');
		ReadLn(num_elegido);
		if (num_elegido>=1) and (num_elegido<=12) then
			TerminarCiclo:=true;
	end;
	TerminarCiclo:=false;
	writeln('La carta levantada(o elegida) es: ',num_elegido,' de ', palo_elegido);
	WriteLn('Seleccione el palo de la carta:');
	WriteLn('Ingrese 1 para seleccionar Oro.');
	WriteLn('Ingrese 2 para seleccionar Basto.');
	WriteLn('Ingrese 3 para seleccionar Copa.');
	WriteLn('Ingrese 4 para seleccionar Espada.');
	ReadLn(AuxPalo);
	Case AuxPalo of
		1: PaloDeCartaLevantada:='Oro';
		2: PaloDeCartaLevantada:='Basto';
		3: PaloDeCartaLevantada:='Copa';
		4: PaloDeCartaLevantada:='Espada';
	else
	begin
		WriteLn('El numero seleccionado, no corresponde a una opcion valida.');
		WriteLn('El sistema ha seleccionado por usted: Oro.');
		PaloDeCartaLevantada:='Oro';
	end
	end;
	while TerminarCiclo<>true do
	begin 
		Write('Ingrese el numero de su carta: ');
		ReadLn(NumeroDeCartaLevantada);
		if (NumeroDeCartaLevantada>=1) and (NumeroDeCartaLevantada<=12) then
			TerminarCiclo:=true;
	end;
	CartasLevantadas:= 1;
    while (PaloDeCartaLevantada<>palo_elegido) or (NumeroDeCartaLevantada<=num_elegido) do //primerciclo
        begin
			clrscr;
			AuxPalo:=0;
			TerminarCiclo:=False;
			writeln('La carta levantada(o elegida) es: ',num_elegido,' de ', palo_elegido);
			WriteLn('Seleccione el palo de la carta:');
			WriteLn('Ingrese 1 para seleccionar Oro.');
			WriteLn('Ingrese 2 para seleccionar Basto.');
			WriteLn('Ingrese 3 para seleccionar Copa.');
			WriteLn('Ingrese 4 para seleccionar Espada.');
			ReadLn(AuxPalo);
			Case AuxPalo of
				1: PaloDeCartaLevantada:='Oro';
				2: PaloDeCartaLevantada:='Basto';
				3: PaloDeCartaLevantada:='Copa';
				4: PaloDeCartaLevantada:='Espada';
			else
			begin
				WriteLn('El numero seleccionado, no corresponde a una opcion valida.');
				WriteLn('El sistema ha seleccionado por usted: Oro.');
				PaloDeCartaLevantada:='Oro';
            end
            end;
			while TerminarCiclo<>true do //segundo ciclo
			begin //comienza el miemtras.
				Write('Ingrese el numero de su carta: ');
				ReadLn(NumeroDeCartaLevantada);
				if (NumeroDeCartaLevantada>=1) and (NumeroDeCartaLevantada<=12) then
					TerminarCiclo:=true;
			end;
			inc(CartasLevantadas);

        end;

    writeln('la cantidad de cartas sacadas fueron: ',CartasLevantadas);
	readkey;
END.
