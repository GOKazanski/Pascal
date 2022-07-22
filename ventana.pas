 {--------------------------} 
 {  Ejemplo en Pascal:      } 
 {                          } 
 {    Ventanas de texto     } 
 {    en Turbo Vision - 1   } 
 {    VENT1.PAS             } 
 {                          } 
 {  Este fuente procede de  } 
 {  CUPAS, curso de Pascal  } 
 {  por Nacho Cabanes       } 
 {                          } 
 {  Comprobado con:         } 
 {    - Free Pascal 2.2.0w  }
 {    - Turbo Pascal 7.0    } 
 {--------------------------}
 program Vent1;
 uses App, Objects, Menus, Drivers, Views;
 const 
   cmVentana = 100;   { La orden que vamos a crear }
 type Programa = object (TApplication) 
     procedure InitStatusLine; virtual; 
     procedure HandleEvent(var Suceso: TEvent); virtual; 
     procedure Ventana; 
   end;
 procedure Programa.InitStatusLine; 
 var 
   R: TRect;               { Rectángulo de pantalla } 
 begin 
   GetExtent(R);           { Miramos cuando ocupa } 
   R.A.Y := R.B.Y - 1;     { Nos quedamos la línea inferior } 
   New(StatusLine, Init(R, 
     NewStatusDef(0, $FFFF, 
       NewStatusKey('~Alt-S~ Salir', kbAltS, cmQuit, 
       NewStatusKey('~Alt-V~ Ventana', kbAltV, cmVentana, 
       nil)), 
     nil))); 
 end;
 procedure Programa.HandleEvent(var Suceso: TEvent); 
 var 
   R: TRect; 
 begin 
   inherited HandleEvent(Suceso);       { Primero que mire el "padre" } 
   if Suceso.What = evCommand then      { Si es una orden } 
     case Suceso.Command of             { Miramos qué orden es } 
       cmVentana: Ventana; 
     end; 
 end;
 procedure Programa.Ventana; 
 var 
   R: TRect;                            { El "rectángulo" que ocupará } 
   W: PWindow;                          { La ventana en si } 
 begin 
   R.Assign(10,10,40,20);               { Definimos el tamaño } 
   W := New(PWindow,                    { Inicializamos: nueva ventana } 
     Init(R, 'Prueba',                  {   en la zona R, título Prueba } 
     wnNoNumber));                      {   y sin número de ventana } 
   InsertWindow(W);                { La insertamos en nuestro programa } 
 end;
 var Prog: Programa;
 begin 
   Prog.Init; 
   Prog.Run; 
   Prog.Done; 
 end. 
