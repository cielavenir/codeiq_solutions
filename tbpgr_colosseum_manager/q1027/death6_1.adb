with Ada.Text_IO;
with Ada.Integer_Text_IO;
procedure z is
i,j:integer;
begin
for i in 2..999 loop
j:=2;
while i mod j>0 loop j:=j+1;end loop;
if j=i then
if i>2 then Ada.Text_IO.Put(":");end if;
Ada.Integer_Text_IO.Put(i,Width=>0);
end if;
end loop;
end;