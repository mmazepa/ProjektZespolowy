program silnia_liczby;
var 
  n: integer;

function silnia(n: integer): integer;
begin
  if n = 0 then 
    silnia := 1
  else 
    silnia := n * silnia(n-1);
end;

begin
  writeln('Program oblicza silnię z dowolnej liczby');
  write('Podaj liczbę: ');
  readln(n);
  writeln(n,'! = ',silnia(n));
end.
