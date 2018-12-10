program composite;
var i,s,n,cnt: integer;

function isPrime(i: integer): boolean;
var
	j: integer;
begin
	isPrime:=true;
	for j:=2 to i-1 do begin
		if(i mod j < 1) then
			isPrime:=false;
	end;
end;

begin
	read(n);
	i:=2;
	cnt:=0;
	s:=0;
	while(cnt<n) do begin
		if(not isPrime(i)) then begin
			s:=s + i;
			cnt:=cnt + 1;
		end;
		i:=i + 1;
	end;
	writeln(s);
end.
