const s='deathma colosseum';
var i,j:integer;
begin for i:=1 to 17 do begin
	write('>');
	for j:=1 to ord(s[i]) do write('+');
	write('.');
end;
end.