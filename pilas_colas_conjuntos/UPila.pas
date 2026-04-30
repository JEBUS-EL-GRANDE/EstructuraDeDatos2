//llamamos las funciones y procedimientos de la UlistaE  (pero esto de aqui no se puede compilar)
//asi que lo llamamos desde otro archivo para poder compilarlo  (principalPILA)
unit UPila;
interface 
  uses UListaE;
type
  Pila = Pnodo;
//******************************************************************************
procedure CrearPila(var P: Pila);                           //01
function PilaVacia(P: Pila): Boolean;                       //02
procedure Apilar(var P: Pila; E: Integer);                  //03
function Desapilar(var P: Pila):integer;                    //04
procedure MostrarPila(P: Pila);                             //05
function Cima(P: Pila): Integer;                            //06
function Base(P: Pila): Integer;                            //07
implementation //***************************************************************
(*en una pila el primero elemento en entrar es el ultimo en salir*)
//01 CREAR PILA
procedure CrearPila(var P: Pila);
begin
  CrearLista(P);
end;
//02  pila vacia
function PilaVacia(P: Pila): Boolean;
begin
  PilaVacia := EsVacia(P);
end;
//03 va metiendo
procedure Apilar(var P: Pila; E: Integer);
begin
  InsertarPrimero(P, E);
end;
//04 saca el dato que haya entrado mas reciente
function Desapilar(var P: Pila):integer;
var
  n:integer;
begin
  n:=Primero(P);
  EliminarPrimero(P);
  desapilar:= n;
end;
//05 muestrar pila
procedure MostrarPila(P: Pila);
begin
  mostrarListavertical(P);
end;
//06 obtenemos el dato que este en la cima
function Cima(P: Pila): Integer;
begin
  Cima := Primero(P);
end;
//07 obtenemos el dato que esta en la base
function Base(P: Pila): Integer;
begin
  Base := Ultimo(P);
end;

begin
end.
