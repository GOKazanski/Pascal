{	Gabriel Omar Kazanski
	gokazanski@gmail.com
	
1.	Escribir un procedimiento digito, que determine si un carácter es uno de los dígitos de 0 a 9.
}
program TP_007_11;

var caracter:char;
	res:boolean;

procedure digito(car:char; var resultado:boolean);
begin
	if car in ['0'..'9'] then
		resultado := true
end;

begin
res:=false;

	writeln('ingrese un caracter');
	readln(caracter);
	
	digito(caracter, res);
	
	if res then
		writeln('es un digito')
	else
		writeln('no es un digito');
	readln();
end.
