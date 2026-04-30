PROGRAM ListaDobles;
uses crt;
type 
   PnodoD = ^NodoD;
   NodoD = Record
     Ele: Integer;
     Sig,ant: PnodoD;
  end ;
//01 CREAR LISTA
procedure CrearLista_D(var L:PnodoD);
    begin
        L:=Nil;
    end;
//02 ES VACIA 
function EsVacia_D(L: PnodoD): Boolean;
begin
  if L=nil then
     Esvacia_D:=true
  else
     EsVacia_D:= false;
end;
//03 INSERTAR PRIMERO 
procedure InsertarPrimero_D(var L: PnodoD; E: Integer);
var
  N: PnodoD;
begin
    if(esvacia_d(l))then
    begin
        New(N);
        N^.Ele := E;
        N^.Sig := NIL;
        N^.ant := nil;
        L := N;
    end
    else
    begin
        New(N);
        N^.Ele := E;
        N^.Sig := NIL;
        N^.ant := nil;
        N^.sig := l;
        L^.ant := n;
        L := N;
    end;
end;
//04 mostrar lista
procedure MostrarLista_D(l:PnodoD);
var
    aux:PnodoD;
begin
    if  EsVacia_D(l)then
        write('lista vacia.')
    else
    begin
        aux:=l;
        write('L-->');
        while(aux<>nil)do
        begin
            write(aux^.ele,'-->');
            aux:=aux^.sig;
        end;
        writeln('nil')
    end;
end;
//05 cantidad de elementos
function CantidadElementos_d(L: Pnodod): Integer;
var
  Aux: Pnodod;
  c: Integer;
begin
    if EsVacia_d(L) then
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
    CantidadElementos_d := c;
end;
//06 insertar ultimo
procedure InsertarUltimo_d(var L: Pnodod; E: Integer);
var
    N, Aux: Pnodod;
begin
    New(N);
    N^.Ele := E;
    N^.Sig := nil;
    N^.ant := nil;
    if EsVacia_d(L) then
        L := N
    else
    begin
        Aux := L;
        while Aux^.Sig <> nil do
            Aux := Aux^.Sig;
        Aux^.Sig := N;
        N^.ant:=aux;
    end;
end;
//07 eliminar Elemento
procedure EliminarElemento_dl(var L:PnodoD; E:integer);
var antE, aux, post:PnodoD;
begin
    if EsVacia_D(L) then
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
            while (aux<>nil)and(Aux^.ele<>E) do//esto funcionara hasta encontrar al nodo
                aux:=aux^.sig;
            ante:=aux^.sig;
            if aux^.ele =E then
            begin
                ante^.sig:=aux^.sig;
                post^.ant:=ante;
            end
            else
                writeln('El dato seleccionadono no existe en la lista.');
        end;
    end;
end;
procedure EliminarElemento_d(var L: PnodoD; E: Integer);
var
  aux: PnodoD;
begin
  if EsVacia_D(L) then
    writeln('Lista vacía, nada para eliminar.')
  else
  begin
    aux := L;
    // Buscar el nodo con el elemento E
    while (aux <> nil) and (aux^.Ele <> E) do
      aux := aux^.Sig;

    if aux = nil then
      writeln('El elemento no existe en la lista.')
    else
    begin
      // Si es el primer nodo
      if aux = L then
      begin
        L := aux^.Sig;
        if L <> nil then
          L^.Ant := nil;
      end
      else
      begin
        aux^.Ant^.Sig := aux^.Sig;
        if aux^.Sig <> nil then
          aux^.Sig^.Ant := aux^.Ant;
      end;
      Dispose(aux);
      writeln('Elemento eliminado.');
    end;
  end;
end;

(*=================================MAIN˜========================================*)
VAR
    L,L2:PnodoD;
    c: Integer;
BEGIN
    CrearLista_D(L);
    InsertarPrimero_D(L,1);
    InsertarPrimero_D(L,5);
    InsertarPrimero_D(L,7);
    InsertarPrimero_D(L,2);
    MostrarLista_D(l);
    InsertarUltimo_d(l,77);
    Writeln('ultimo.');
    MostrarLista_D(l);
    write('eliminaelemento');
    EliminarElemento_d(L,5);
    MostrarLista_D(l);
    readln;
END.            


{//08 eliminar en posición
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
//09 Insertar en posición
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
end;}
