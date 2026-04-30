UNIT uconjunto;
INTERFACE
  uses UlistaE;
  type
      Conjunto=Pnodo ;
//******************************************************************************
    PROCEDURE CREARCOnJUNTO(VAR Con:Conjunto);                    //01
 	function ConjuntoVacio(con:conjunto):boolean;                 //02
	Procedure INSERTAR(var con:conjunto;E:integer);               //03
    procedure MostrarConjunto(con:conjunto);                      //04
	Procedure ELIMINAR(var con:conjunto;E:integer);               //05
    FUNCTION Sacar(con:conjunto):integer;                         //06
	function INTERSECCION (A,B:conjunto): conjunto;               //07
	function UNION (A,B:conjunto):conjunto;                       //08
	function DIFERENCIA(A,B:Conjunto):conjunto;                   //09
    function DISJUNTO(A,B:Conjunto):boolean;                      //10
IMPLEMENTATION//****************************************************************
(*conjuntos*)
//01 crear conjunto
PROCEDURE CREARCOnJUNTO(VAR Con:Conjunto);
BEGIN
     CREARLISTA(Con);
END;
//02 conjunto vacio
function ConjuntoVacio(con:conjunto):boolean;
begin
     if Esvacia(con) then
         Conjuntovacio:= true
     else
         Conjuntovacio:= false;
end;
//03 creamos un  conjunto (en orden y no repetidos)
Procedure INSERTAR(var con:conjunto;E:integer);
begin
     InsertarenOrden(con,E);
end;
//04 mostrar conjunto
procedure MostrarConjunto(con:conjunto);
begin
     MostrarLista(con);
end;
//05 eliminamos un elemento del conjunto
Procedure ELIMINAR(var con:conjunto;E:integer);
begin
     EliminarElemento(con,E);
end;
//06 eliminar un dato en
FUNCTION Sacar(con:conjunto):integer;
var
   aux:integer;
begin
     if Not conjuntovacio(con) then
     begin
        aux:=Primero(con);
        EliminarPrimero(con);
        Sacar:=aux;
     end;
end;
//07 A=[123789]  y  B=[367] el conjunto resultante es R=[37]
function INTERSECCION (A,B:conjunto): conjunto;
var
   A1,Resultado :conjunto;
   E:integer;
begin
   CrearConjunto(Resultado);
   A1:=COPIAR(A);
   while Not conjuntovacio(A1) do
   begin
        E:=Primero(A1);
        if Existe(B,E) then
        Insertar(Resultado,E);
        Eliminarprimero(A1);
   end;
   INTERSECCION := Resultado;
end;
//08 A=[1289]  y  B=[367] el conjunto resultante es R=[1236789]
function UNION (A,B:conjunto):conjunto;
var
   B1,Resultado:conjunto;
   E:integer;
begin
   Resultado:=Copiar(A);
   B1:= COPIAR(B);
   while Not Conjuntovacio(B1) do
   begin
        E:= Primero(B1);
        INsertar(Resultado,E);
        EliminarPrimero(B1);
   end;
   Union:= Resultado;
end;
//09 A=[1234]  y  B=[23] el conjunto resultante es R=[14]
function DIFERENCIA(A,B:Conjunto):conjunto;
var
    A1,Resultado:conjunto;
    E:integer;
begin
    CrearConjunto(Resultado);
    A1:=COPIAR(A);
    While not conjuntovacio(A1) do
    begin
        E:=primero(A1);
        if Not Existe(B,E) then
            Insertar(Resultado,E);
        Eliminarprimero(A1);
    end;
    DIFERENCIA:= Resultado;
end;
//10
function DISJUNTO(A,B:Conjunto):boolean;
var
    Resultado:conjunto;
begin
    crearconjunto(Resultado);
    Resultado:=Interseccion(A,B);
    IF CONJUNTOVACIO(Resultado) then
        Disjunto:= true
    else
        Disjunto:= false;
end;
END.
