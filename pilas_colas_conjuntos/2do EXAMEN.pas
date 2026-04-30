PROGRAM EXAMEN;
USES UPILA,UCOLA, Uconjunto;
FUNCTION SUMARPILA(P:pILA):INTEGER;
VAR
   s:INTEGER;
BEGIN
     s:=0;
     WHILE NOT PILAVACIA(P) DO
     BEGIN
          s:= s + CIMA(P);
          DESAPILAR(p);
     end;
      SUMARPILA:=s;
END;
//pregunta 1 son iguales o no en boolean  (dos pilas)
{function iguales(var p,p2:pila):boolean;
var
     //aux,aux2:pila;
     n,n2:integer;
begin
   if (PilaVacia(p) <> PilaVacia(p2)) then
       iguales:=false
   else
   begin
        while (not PILAVACIA(P) and not PILAVACIA(P2)) do
        begin
             //n:= cima(P);
             //n2:= cima(P2);
             if  ( cima(P) = cima(P2)) then
                 iguales:=true
             else
             begin
                 iguales:=false;
                 break;
             end;
             DESAPILAR(p);
             DESAPILAR(p2);
        end;
        iguales:=false;
   end;
end;}
//pregunta 2 funcion  devuelvala operacion union excluida
{function UnionExcluida(A,B:conjunto):conjunto;
var
     cA,R:conjunto;
     E:integer;
begin
   if ( ConjuntoVacio(A)) then
       write('conjunto +A+ ya excluido')
   else
   begin
       CrearConjunto(R);
       cA:=COPIAR(A);
       while Not conjuntovacio(CA) do
       begin
           E:=Primero(A1);
           if not(Existe(B,E)) then
               Insertar(R,E);
           Eliminarprimero(ca);
       end;
       UnionExcluida:= R;
   end;
end;}

(*=============================MAIN============================================*)
VAR
  P, p2:PILA;
  //SUMA:INTEGER;
BEGIN
    CREARPILA(p);
    APILAR(P,2);
    APILAR(P,5);
    APILAR(p,6);
    APILAR(P,8);
    MOSTRARPILA(p);

    CREARPILA(p2);
    APILAR(P2,2);
    APILAR(P2,5);
    APILAR(p2,6);
    APILAR(P2,8);
    MOSTRARPILA(p2);


    //iguales(p,p2);

    SUMA:= SUMARPILA(P);
    WRITELN('LA SUMA DE TODA LA PILA ES :',SUMA);
    READLN;
END.
