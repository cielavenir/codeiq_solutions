var i:integer;
begin for i:=1 to 50 do
if i mod 15=0 then write('FIZZBUZZ')
else if i mod 3=0 then write('fizz')
else if i mod 5=0 then write('buzz')
else write(i);
end.