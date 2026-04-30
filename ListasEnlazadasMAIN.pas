PROGRAM ListaEnlazada;
uses crt;
type 
   Pnodo = ^Nodo;//se puso Pnodo porque encontrar el signo de ^ es dificil asi que se lo represento con otra variable
   Nodo = Record
     Ele: Integer;
     Sig: Pnodo;
  end ;
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
//07 eliminar Elemento 
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
//08 eliminar en posicion
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
//09 Insertar en posicion
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
(*==================================PRACTICAS MIAS===================================*)
//01 devolver el maximo valor de la lista           3-->1-->8-->6-->nil
function MaximoValorDeUnaLista(L:Pnodo):integer;
var
    aux:Pnodo;
    num:integer;
begin
    if Esvacia(L) then
        write('La lista esta vacia, no hay valores.')
    else 
    begin
        aux:=L;
        num:=0;
        while(aux<>nil)do
        begin
            if(aux^.ele>num) then
            begin
                num:=aux^.ele;
            end;
            aux:=aux^.Sig;
        end;
        MaximoValorDeUnaLista:=num;
    end;
end;
//02 invertir completamente una lista   EJEMPLO  L-->2-->7-->5-->1-->nil    invertida L-->1-->5-->7-->2-->nil
procedure invertir(var L:Pnodo);//Si necesitas modificar la lista original (usa el  var)
var
    aux,l2:Pnodo;
    num:integer;
begin
    if Esvacia(L) then
        write('La lista esta vacia, nada para invertir')
    else
    begin
        if (L^.Sig = nil) then
            write('La lista tiene un nodo, no se puede invertir.')
        else
        begin
            aux:=L;
            L2:=nil;
            while(aux<>nil)do
            begin
                num:=aux^.ele;
                InsertarPrimero(L2,num);
                
                aux:=aux^.Sig;
            end; 
        end;
    end;
    L:=L2;
end;
//3 sumar toda la lista 
function SumarLista(L:Pnodo):integer;
var
    aux:Pnodo;
    sn:integer;
begin
    if Esvacia(L) then
        write('La lista esta vacia, nada para sumar.')
    else 
    begin
        aux:=L;
        sn:=0;
        while aux<> nil do
        begin
            sn:=sn+ aux^.ele;
            
            aux:=aux^.Sig;
        end;
        SumarLista:=sn;
    end;
end;
//04 intercalar dos listas 
procedure intercalar(var L:Pnodo;L2:Pnodo);
var
    aux,aux2,L3:Pnodo;
    n:integer;
begin
    if (esvacia(l)and esvacia(l2)) then
        write('Ambas o una de las dos listas estan vacias, nada para  fusionar')
    else
    begin
        aux:=l;
        aux2:=L2;
        l3:=nil;
        while(aux<>nil)and(aux2<>nil)do
        begin
            n:=aux^.ele;
            InsertarUltimo(l3,n);
            n:=aux2^.ele;
            InsertarUltimo(l3,n);
            
            aux:=aux^.Sig;
            aux2:=aux2^.Sig;
        end;
        if(aux=nil)then
        begin
            while(aux2<>nil)do
            begin
                InsertarUltimo(l3,aux2^.ele);
                
                aux2:=aux2^.Sig;
            end;
        end
        else
        begin
            while(aux<>nil)do
            begin
                InsertarUltimo(l3,aux^.ele);
                
                aux:=aux^.Sig;
            end;
        end;
        l:=l3;
    end;
end;
//05 hacer que dos listas  se fucionen
procedure fusionarLista(var L:Pnodo;L2:Pnodo);
var
    aux:Pnodo;
begin
    if (esvacia(l)and esvacia(l2)) then
        write('Ambas listas estan vacias, o una de las dos listas esta vacia.')
    else
    begin
        if(L=nil)then// Si L está vacía, el resultado es L2
            l:=l2
        else
        begin
            aux:=L;
            while(aux^.sig<>nil)do
                aux:=aux^.Sig;
            aux^.sig:=l2;
        end;
    end;
end;
//06 sumar todos los numeros pares
function SumarPares(l:Pnodo):integer;
var
    aux:Pnodo;
    n,s:integer;
begin
    if esvacia(l) then
        writeln('La lista está vacía')
    else
    begin
        s:=0;
        aux:=l;
        while(aux<>nil)do
        begin
            n:=aux^.ele;
            if(n mod 2=0)then
            begin
                s:=s+n
            end;
            
            aux:=aux^.Sig;
        end;
        SumarPares:=s;
    end;
end;
//07 sumar todos los pares e impares y devolver ambos resultados a la vez
procedure sumaParEimpar(L:Pnodo);
var
    aux:Pnodo;
    n,sp,si:integer;
begin
    if (EsVacia(l)) then 
        write('La lista esta vacia,  nada para sumar')
    else
    begin
        aux:=l;
        n:=0;
        sp:=0;
        si:=0;
        while (aux <>nil) do
        begin
            n:=aux^.ele;
            if (n mod 2=0)then 
                sp:=sp+n
            else
                si:=si+n;
            
            aux:=aux^.Sig;
        end;
        writeln('la suma par es:',sp);
        write('la suma inpar es:',si);
    end;
end;
//08 eliminar todos los elementos repetidos de la lista
//L-->4-->7-->2-->4-->8-->6-->2-->4-->nil         resultado  L-->4-->7-->2-->8-->6-->nil
procedure eliminarRepetidos(var L: Pnodo);
var
  aux, ant, aux2: Pnodo;
  valor: Integer;
begin
  aux := L;
  while aux <> nil do
  begin
    valor := aux^.Ele;
    ant := aux;
    aux2 := aux^.Sig;
    while aux2 <> nil do
    begin
      if aux2^.Ele = valor then
      begin
        ant^.Sig := aux2^.Sig;
        dispose(aux2);
        aux2 := ant^.Sig;
      end
      else
      begin
        ant := aux2;
        aux2 := aux2^.Sig;
      end;
    end;
    aux := aux^.Sig;
  end;
end;

//09 isertar Lista en pos
procedure insertarListaEnPos(var L:Pnodo; L2:Pnodo; pos:integer);
var
    aux, ant, ultimoL2: Pnodo;
    contador: integer;
begin
    if EsVacia(L2) then
        writeln('La lista L2 esta vacia, nada que insertar.')
    else if EsVacia(L) then
        L := L2
    else if pos <= 1 then
    begin
        // Insertar al inicio
        ultimoL2 := L2;
        while ultimoL2^.Sig <> nil do
            ultimoL2 := ultimoL2^.Sig;
        ultimoL2^.Sig := L;
        L := L2;
    end
    else
    begin
        // Buscar la posición en L
        aux := L;
        contador := 1;
        while (aux <> nil) and (contador < pos) do
        begin
            ant := aux;
            aux := aux^.Sig;
            contador := contador + 1;
        end;

        // Enlazar L2 en la posición encontrada
        if aux = nil then
        begin
            // Insertar al final
            ant^.Sig := L2;
        end
        else
        begin
            // Insertar en medio
            ultimoL2 := L2;
            while ultimoL2^.Sig <> nil do
                ultimoL2 := ultimoL2^.Sig;
            ultimoL2^.Sig := aux;
            ant^.Sig := L2;
        end;
    end;
end;
(*=================================MAIN========================================*)
VAR
  L,L2:Pnodo;
BEGIN //L-->4-->7-->2-->4-->8-->6-->2-->4-->nil        resultado  L-->4-->7-->2-->8-->6-->nil
    CrearLista(L);
    InsertarPRIMERO(L,4);
    InsertarPRIMERO(L,2);
    InsertarPRIMERO(L,6);
    InsertarPRIMERO(L,8);
    InsertarPRIMERO(L,4);
    InsertarPRIMERO(L,2);
    InsertarPRIMERO(L,7);
    InsertarPRIMERO(L,4);
    //InsertarPRIMERO(L,3);
    MostrarLista(l);
    
    eliminarRepetidos(l);
    MostrarLista(l);
    
    sumaParEimpar(l);
    
    readln;
END.   
