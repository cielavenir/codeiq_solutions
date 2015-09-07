var i,j:integer;
begin for i:=0 to 24 do begin
	for j:=1 to i do write('A');
	write(chr(66+i));
	for j:=1 to 24-i do write('A');
	writeln('');
end;
end.