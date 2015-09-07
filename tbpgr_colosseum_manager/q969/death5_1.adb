with Ada.Text_IO;
with Ada.Integer_Text_IO;
procedure z is
i:integer;
begin
for i in 1..50 loop
if i mod 15=0 then Ada.Text_IO.Put("FIZZBUZZ");
elsif i mod 3=0 then Ada.Text_IO.Put("fizz");
elsif i mod 5=0 then Ada.Text_IO.Put("buzz");
else Ada.Integer_Text_IO.Put(i,Width=>0);
end if;
end loop;
end;