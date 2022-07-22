{
Grupo BacKGaMmon
				-Gabriela Burgos
				-Claudio Gonzalez
				-Gabriel Kazanski
}

unit Fecha_BacKGaMmon;
{$codepage utf8}

interface // Parte pública, que se comparte

uses
	crt,dos;

const
	Valor_dia:array[0..6] of string[10]=('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado');
	Valor_mes:array[1..12] of string[10]=('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');

var
	dd,mm,aaaa,dia_semana:word;

procedure fecha_correcta (f_d,f_m,f_a:word; var resul:boolean);
procedure comparar_fecha (f_d,f_m,f_a:word; var resul:boolean);
procedure calcular_edad (f_d,f_m,f_a:word; var ed:word);
procedure fecha_de_hoy (var hoy:string);

implementation // Parte privada de la unit

// Procedimiento que muestra la fecha de hoy
procedure fecha_de_hoy (var hoy:string);
var
	hoy_dia,hoy_mes,hoy_anio,hoy_dia_valor,hoy_mes_valor:string;
begin
	GetDate(aaaa,mm,dd,dia_semana);
	hoy_dia_valor:=Valor_dia[dia_semana];
	str(dd,hoy_dia); // Pasa el número a texto
	hoy_mes_valor:=Valor_mes[mm];
	str(mm,hoy_mes); // Pasa el número a texto
	str(aaaa,hoy_anio); // Pasa el número a texto
	hoy:=('Hoy es: '+ hoy_dia_valor + ', ' + hoy_dia + ' / ' + hoy_mes_valor + ' / ' + hoy_anio);
end;

// procedimiento que verifica si la fecha ingresada es correcta
procedure fecha_correcta (f_d,f_m,f_a:word; var resul:boolean);
begin
	case f_m of // opciones según el mes ingresado
	1,3,5,7,8,10,12: 	begin
							if(f_d in [1..31]) then // Los días tienen que estar dentro del grupo
								resul:=true
							else
							resul:=false;
						end;
			4,6,9,11:	begin 
							if(f_d in [1..30]) then // Los días tienen que estar dentro del grupo
							resul:=true
							else
							resul:=false;
						end;
				2:		begin
							if(f_d in [1..28]) then // Los días tienen que estar dentro del grupo
								resul:=true
								else // Si el día es 29 y el año bisiesto
								if ((((f_a mod 4) = 0) and ((f_a mod 100) <> 0)) or ((f_a mod 400) = 0))and (f_d=29) then
									resul:=true
									else
							resul:=false;
						end;
	end;
end;

// Compara la fecha ingresada para que no sea posterior a hoy
procedure comparar_fecha (f_d,f_m,f_a:word; var resul:boolean);
begin
	GetDate(aaaa,mm,dd,dia_semana);
	if (f_a > aaaa) or (f_a < aaaa-110) then // La fecha No puede ser mayor al Año actual ni que la persona tenga más 110 años
		resul:=false
	else
		if (f_a = aaaa) and (f_m > mm ) then // Si el año es igual el mes No puede ser superior
			resul:=false
		else
			if (f_a = aaaa) and (f_m = mm ) and (f_d > dd ) then // Si el año y el mes es igual el día No puede ser superior
				resul:=false
			else
				resul:=true;
end;

// Procedimiento para calcular la edad
procedure calcular_edad (f_d,f_m,f_a:word; var ed:word);
begin
	GetDate(aaaa,mm,dd,dia_semana); // Da la fecha de hoy

	ed:=aaaa-f_a; // Realiza el calculo restando el año de hoy con la fecha ingresada
	if f_m > mm then
		ed:=ed-1 // Si el mes de la fecha ingresada es mayor todavía no cumplió años
	else
		if (f_m = mm) and (f_d > dd) then
			ed:=ed-1; // Si el mes es igual de la fecha ingresada pero el día es mayor todavía no cumplió años
end;

begin
end.

