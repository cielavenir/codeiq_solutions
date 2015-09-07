var i,j:integer;
begin for i:=2 to 999 do begin
j:=2;
while i mod j>0 do j:=j+1;
if j=i then begin
if i>2 then write(':');
write(i);
end;end;
end.