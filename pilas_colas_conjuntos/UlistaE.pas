(*este archivo es para heredar a otros archivos las funciones
y procedimientos de esta forma nos evitamos escribir mas codigo,
y usar el que ya tenemos y aplicarlo en PILAS, COLAS Y CONJUNTOS*)
unit UlistaE;
interface
type 
   Pnodo = ^Nodo;//se puso Pnodo porque encontrar el signo de ^ es dificil asi que se lo represento con otra variable
   Nodo = Record
     Ele: Integer;
     Sig: Pnodo;
  end ;
//********************implementaciones******************************************
procedure CrearLista(var L: Pnodo);                       //01
function EsVacia(L: Pnodo): Boolean;                      //02
procedure InsertarPrimero(var L: Pnodo; E: Integer);      //03
procedure MostrarLista(L: Pnodo);                         //04
function CantidadElementos(L: Pnodo): Integer;            //05
procedure InsertarUltimo(var L: Pnodo; E: Integer);       //06
procedure EliminarPrimero(var L: Pnodo);                  //07
procedure EliminarElemento(var L: Pnodo; E: Integer);     //08
procedure eliminarPos(var L:Pnodo; pos:integer);          //09
procedure InsertarPosicion(var L: Pnodo; E, pos: Integer);//10
procedure MostrarListaVertical(L: Pnodo);                 //11
function Primero(L: Pnodo): Integer;                      //12
function Ultimo(L: Pnodo): Integer;                       //13
function Existe(L: Pnodo; E: Integer): Boolean;           //14
procedure InsertarEnOrden(var L: Pnodo; E: Integer);      //15
FUNCTION COPIAR(L:pnodo):Pnodo;                           //16
implementation//****************************************************************
//01 CREAR LISTA
procedure CrearLista (var L:Pnodo);
    begin
        L:=Nil;
    end;
//02 ES VACIA 
function EsVacia(L: Pnodo): Boolean;
begin
  if L=nil then
     Esvacia:=true
  else
     EsVacia := false;
end;
//03 INSERTAR PRIMERO 
procedure InsertarPrimero(var L: Pnodo; E: Integer);
var
  N: Pnodo; 
begin
  New(N);
  N^.Ele := E;
  N^.Sig := L;
  L := N;
end;
//04 MOSTRAR LISTA 
procedure MostrarLista(L: Pnodo);
var
  Aux: Pnodo;
begin
  if EsVacia(L) then
    writeln('LISTA VACIA')
  else
  begin
    Aux := L;
    write('L--');
    while Aux <> nil do
    begin
      write(Aux^.Ele, '-->');
      Aux := Aux^.Sig;
    end;
    writeln('nil');

  end;
end;
//05 cantidad de elementos 
function CantidadElementos(L: Pnodo): Integer;
var
  Aux: Pnodo;
  c: Integer;
begin
    if EsVacia(L) then
        Writeln('La lista esta vacia.')
    else
    begin
        aux:=L;
        c:=0;
        while (aux<>nil) do
        begin
            c:=c+1;
            aux:=aux^.sig;
        end;
    end;
    CantidadElementos := c;
end;
//06 insertar ultimo
procedure InsertarUltimo(var L: Pnodo; E: Integer);
var
  N, Aux: Pnodo;
begin
  New(N);
  N^.Ele := E;
  N^.Sig := nil;
  if EsVacia(L) then
    L := N
  else
  begin
    Aux := L;
    while Aux^.Sig <> nil do
      Aux := Aux^.Sig;
    Aux^.Sig := N;
  end;
end;
//07 eliminar el primer elemento
procedure EliminarPrimero(var L: Pnodo);
var
  Aux: Pnodo;
begin
  if not EsVacia(L) then
  begin
    Aux := L;
    L := L^.Sig;
    Dispose(Aux);
  end;
end;
//08 eliminar Elemento
procedure EliminarElemento(var L:Pnodo ; E:integer);
var ant, aux:Pnodo;
begin
    if EsVacia(L) then
        writeln('Lista vacia, nada para eliminar.')
    else
    begin
        if (L^.ele=E) then
        begin
            L:=L^.sig;
            writeln('Elemento Cabeza eliminado');
        end
        else
        begin
            aux:=L;
            while (aux<>nil)and(Aux^.ele<>E) do
            begin//esto funcionara hasta encontrar al nodo
                ant:=aux;
                aux:=aux^.sig;
            end;
            if aux^.ele =E then
                ant^.sig:=aux^.sig
            else
                writeln('El dato seleccionadono no existe en la lista.');
        end;
    end;
end;
//09 eliminar en posicion
procedure eliminarPos(var L:Pnodo; pos:integer);
var
    ant, aux:Pnodo;
    c:integer;//c=contador
begin
    if Esvacia(L) then
        write('La lista esta vacia, no hay nada para eliminar.')
    else
    begin
        if (pos=1) then
        begin
            L:=L^.Sig;
            write('Nodo eliminado.');
        end
        else
        begin
            aux:=L;
            c:=1;
            while ((aux<>nil)and(c<pos)) do
            begin
                ant:=aux;
                aux:=aux^.Sig;
                c:=c+1;
            end;
            if(aux=nil)then
                write('posicion no valida.')
            else
                ant^.Sig:=aux^.sig;
        end;
    end;
end;
//10 Insertar en posicion
procedure InsertarPosicion(var L: Pnodo; E, pos: Integer);
var
    N, Ant, Aux: Pnodo;
    x: Integer;
begin
    if (EsVacia(L) or (pos <= 1)) then//si la lista  esta vasia el pos se va a ir de primero
        InsertarPrimero(L, E)
    else
    begin
        if pos > CantidadElementos(L) then//el nodo ingresado es mas grande que la lista
            InsertarUltimo(L, E)
        else
        begin
            Aux := L;
            x := 1;
            while x < pos do//aqui localizamos al nodo 
            begin
                Ant := Aux;
                Aux := Aux^.Sig;
                x := x + 1;
            end;
            New(N);//creamos un nodo con el dato introducido
            N^.Ele := E;
            Ant^.Sig := N;
            N^.Sig := Aux;//y lo fusionamos en la lista
        end;
    end;
end;
//11 muestra la lista de manera vertical
procedure MostrarListaVertical(L: Pnodo);
var
  Aux: Pnodo;
begin
  if not EsVacia(L) then
  begin
    Aux := L;
    while Aux <> nil do
    begin
      writeln(Aux^.Ele);
      Aux := Aux^.Sig;
    end;
  end;
end;
//12 muestra el primer elemento de la lista
function Primero(L: Pnodo): Integer;
begin
  if not EsVacia(L) then
    Primero := L^.Ele;
end;
//13 muestra el ultimo elemento de la lista
function Ultimo(L: Pnodo): Integer;
var
  Aux: Pnodo;
begin
  if not EsVacia(L) then
  begin
    Aux := L;
    while Aux^.Sig <> nil do
      Aux := Aux^.Sig;
    Ultimo := Aux^.Ele;
  end;
end;
//14 comprueba que un elemento exista
function Existe(L: Pnodo; E: Integer): Boolean;
var
  Aux: Pnodo;
begin
  Aux := L;
  while (Aux <> nil) and (Aux^.Ele <> E) do
  begin
    Aux := Aux^.Sig;
  end;
  Existe := Aux <> nil;
end; 
//15 va insertando elementos a la lista en orden y sin repetir
procedure InsertarEnOrden(var L: Pnodo; E: Integer);
var
  Nuevo, Ant, Act: Pnodo;
begin
  New(Nuevo);
  Nuevo^.Ele := E;
  Nuevo^.Sig := nil;
if not Existe(L,E)then
    begin 
      if EsVacia(L) or (L^.Ele >= E) then
        begin
           Nuevo^.Sig := L;
          L := Nuevo;
        end
     else
       begin
         Ant := L;
         Act := L^.Sig;
         while (Act <> nil) and (Act^.Ele < E) do
           begin
             Ant := Act;
             Act := Act^.Sig;
           end;
           Nuevo^.Sig := Act;
           Ant^.Sig := Nuevo;
       end;
   end;
end;
//16 copia una lista
FUNCTION COPIAR(L:pnodo):Pnodo;
var
    N,aux:pnodo;
begin
    aux:=L;
    CREARLISTA(N);
    while aux<> nil do
       begin
          insertarultimo(N,AUX^.ELE);
          aux:= aux^.sig;
       end;
    copiar:= N;
end;

END.   
