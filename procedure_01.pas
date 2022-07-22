program procedure_001;
uses crt;
var 
	DiaFact, MesFact,DiaVenc, MesVenc, AnioFact, AnioVenc:integer;
	DateFact,DateVenc:Boolean;
	Mensaje:String;
	
procedure Fecha (DD,MM,AAAA:integer; Var Conffecha:boolean; var boxmensaje:string);
begin
Conffecha:=false;
	
if DD<1 and DD>31 then
	boxmensaje:='No hay tantos dias. '
else
	if MM<1 and MM>12 then
		boxmensaje:='No hay tantos meses                              '
	else
		if ((MM=4) or (MM=6) or (MM=9) or (MM=11) and (DD>30)) or ((MM=2) and (DD>29)) then
			boxmensaje:='No hay tantos dias                              '
		else 
			if ((AAAA mod 4)<>0) and ((MM=2) and (DD=29)) then
				boxmensaje:='No es anio bisiesto                             '
			else
				Conffecha:=true;
end;			

BEGIN
DateFact:=false;
DateVenc:=false;

repeat
	mensaje:='';
	writeln ('Ingrese el dia de facturacion                             ');
	readln (DiaFact);
	writeln ('Ingrese el Mes                                            ');
	read (MesFact);
	writeln ('Ingrese el Anio                                           ');
	read (AnioFact);
	Fecha (DiaFact,MesFact,AnioFact,DateFact,Mensaje);
	if dateFact=false Then
		begin
			writeln (Mensaje);
			readkey
		end;	
until DateFact=true;
writeln ('La fecha de Facturacion es: ',DiaFact,'/',MesFact,'/',AnioFact);


repeat
	mensaje:='';
	writeln ('Ingrese el dia de vencimiento                             ');
	readln (DiaVenc);
	writeln ('Ingrese el Mes                                            ');
	read (MesVenc);
	writeln ('Ingrese el Anio                                           ');
	read (AnioVenc);
	Fecha (DiaVenc,MesVenc,AnioVenc,DateVenc,Mensaje);
	if DateVenc=false Then
		begin
			writeln (Mensaje);
			readkey
		end;	
until DateVenc=true;
writeln ('La fecha de vencimiento es: ',DiaFact,'/',MesFact,'/',AnioFact);

END.

