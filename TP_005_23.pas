//Gabriel Omar Kazanski
//gokazanski@gmail.com
program Tp_005_23;
uses crt;
//23. Un depósito de golosinas cuenta con 100 pedidos minoristas que debe preparar en el día. 
//De cada pedido se conoce: número de pedido, código de golosina (1 al 150), descripción, cantidad de unidades pedidas y precio por unidad. Se pide informar:
//a- Cantidad de pedidos con el código de golosina N° 26.
//b- Mostrar por cada pedido: el número del mismo, descripción de la golosina e importe, realizando un descuento del 5% si la cantidad de unidades solicitadas supera las 100.
//c- Cantidad de pedidos a los que se les hizo descuento.

var
	i, j, NumPedido, CodGolosina, Cant26: byte;
	CantU, SumaPedDesc: integer;
	Descripcion : string;
	Precio, TotalComp: Real;
BEGIN

	Cant26:=0;
	NumPedido:=0; // número de pedido
	SumaPedDesc:=0; // cantidad de pedidos con descuento
	
	Writeln ('Ingrese la Cantidad de pedidos');
	Readln (j);
	
	For i:=1 to j do
	Begin
		NumPedido:= (NumPedido+1);
		Writeln ('Ingrese los datos para el pedido N: ',NumPedido);
		Writeln ('Ingrese el Codigo de la golosina del 1 al 150');
		Readln (CodGolosina);
		case CodGolosina of
			1..25: ;
			26: Cant26:=(Cant26 + 1);
			27..150: ;	
		Else
			writeln ('Ingreso un codigo incorrecto');
		End;
		If (CodGolosina>=1) and (CodGolosina<=150) then
			Begin 
				writeln ('Ingrese la Descripcion del Producto');
				readln (Descripcion);
				writeln ('Ingrese El valor por unidad');
				readln (Precio);
				writeln ('Ingrese la cantidad');
				readln (CantU);
				TotalComp:= (Precio * CantU);
				If (CantU>100) then
					Begin 
						SumaPedDesc:=(SumaPedDesc+1);
						TotalComp:=(TotalComp-(TotalComp*0.05));
					end;
				Begin	
				Writeln ('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
				Writeln ('X   N de Pedido: ', NumPedido);
				Writeln ('X   La Golosina: ', CodGolosina);
				Writeln ('X   Descripcion: ', Descripcion);
				Writeln ('X       Importe: ', Precio:0:2);
				Writeln ('X         Total: ', Precio * CantU:0:2);
				Writeln ('X Con descuento: ', TotalComp:0:2);
				Writeln ('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
				Readkey;
				Clrscr;
				End
			end
		Else
			Begin
				writeln ('La orden quedo vacia.');
				NumPedido:= (NumPedido-1);
				Readkey;
				Clrscr;
			End;
	End;
	Writeln (' La cantidad de pedidos con la golosina N 26 son: ', Cant26);	
	Writeln (' La cantidad de pedidos con descuento del 5% son: ', SumaPedDesc);
	Readkey;
END.
