var i:integer;
begin for i:=0 to 207 do write(chr(97+i mod 26-(8-i mod 8)div 8*32));end.