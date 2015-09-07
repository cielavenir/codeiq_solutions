with Ada.Text_IO;
procedure z is
I,J:integer;
begin
FOR J IN 1..8 LOOP
for I in 0..40/J loop
Ada.Text_IO.Put(Character'Val(36+I*J*2));
end loop;
END LOOP;
end;