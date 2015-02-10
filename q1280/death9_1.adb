with Ada.Text_IO;
procedure i is
i:integer;
begin
for i in 0..207 loop
Ada.Text_IO.Put(Character'Val(97+i mod 26-(8-i mod 8)/8*32));
end loop;
end;