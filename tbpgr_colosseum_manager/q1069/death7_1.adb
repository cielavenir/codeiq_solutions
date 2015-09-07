with Ada.Strings.Fixed;use Ada.Strings.Fixed;
with Ada.Text_IO;
procedure z is
s:String:="deathma colosseum";
i,j:integer;
begin
for i in 1..17 loop
Ada.Text_IO.Put(">"&Character'Pos(s(i))*"+"&".");
end loop;
end;