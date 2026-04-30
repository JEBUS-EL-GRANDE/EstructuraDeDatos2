program PrincipalPIla;
uses Upila;
//01 sumar toda la pila
Function SUMARPILA(P:pILA):INTEGER;
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

(*=====================================MAIN=====================================*)
var
 P:Pila;
 n,s:integer;
begin
    CrearPila(P);
    WRITELN('PILA');
    Apilar(P,4);
    Apilar(P,6);
    Apilar(P,8);
    apilar(P,14);
    Apilar(P,5);
    Apilar(P,7);

    MostrarPila(P);
    writeln('Desapilar');
    n:=desapilar(P);
    writeln('El elemento desapilado fue :',n);
    writeln('PILA');
    MostrarPila(P);

    writeln('El elemento de la cima es :',Cima(P));
    Writeln('El elemento de la base es:',Base(P));

    s:=SUMARPILA(p);
     Writeln('La suma de la pila es:',s);
    readln;
end.
