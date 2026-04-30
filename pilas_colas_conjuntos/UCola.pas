
unit UCola;
interface
  uses UListaE;
type
  COLA = Pnodo;
//******************************************************************************
procedure CrearCola(var C: COLA);                         //01
procedure Acolar(var C: COLA; E: Integer);                //02
FUNCTION Desacolar(var C: COLA):INTEGER;                  //03
procedure MostrarCola(C: COLA);                           //04
function Frente(C: COLA): Integer;                        //05
function Atras(C: COLA): Integer;                         //06
function ColaVacia(C: COLA): Boolean;                     //07
implementation//****************************************************************
(*en una cola el primero en entrar es el primero en salir*)
//01 creamos una cola
procedure CrearCola(var C: COLA);
begin
  CrearLista(C);
end;
//02 introducimos un dato
procedure Acolar(var C: COLA; E: Integer);
begin
  InsertarUltimo(C, E);
end;
//03 eliminamos el dato en cabeza
FUNCTION Desacolar(var C: COLA):INTEGER;
VAR
 AUX:INTEGER;
begin
  AUX:= FRENTE(C);
  EliminarPrimero(C);
  Desacolar:=AUX;
end;
//04 mostrar cola
procedure MostrarCola(C: COLA);
begin
  mostrarlista(C);
end;
//05 muestra el primer elemento
function Frente(C: COLA): Integer;
begin
  Frente := Primero(C);
end;
//06  muestra el primer elemento
function Atras(C: COLA): Integer;
begin
  Atras := Ultimo(C);
end;
//07 lista vacia
function ColaVacia(C: COLA): Boolean;
begin
  ColaVacia := EsVacia(C);
end;

begin
end.
