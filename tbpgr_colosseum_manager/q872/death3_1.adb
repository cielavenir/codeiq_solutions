with Ada.Text_IO;
procedure i is
i:integer;
begin
for i in 65..122 loop
Ada.Text_IO.Put(Character'Val(i));
end loop;
end;