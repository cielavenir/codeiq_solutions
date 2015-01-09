with Ada.Strings.Fixed;use Ada.Strings.Fixed;
with Ada.Text_IO;
procedure z is
i:integer;
begin
for i in 0..24 loop
Ada.Text_IO.Put(i*"A"&Character'Val(66+i)&(24-i)*"A");
Ada.Text_IO.new_line;
end loop;
end;