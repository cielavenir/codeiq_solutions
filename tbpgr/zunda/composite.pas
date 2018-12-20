program composite;
var i,s,n,cnt: longint;

function isqrt(n: longint): longint;
var
	y: longint;
begin
	if(n<=0) then
		isqrt:=0
	else if(n<4) then
		isqrt:=1
	else begin
		isqrt:=0;
		y:=n;
		while((isqrt<>y) and (isqrt+1<>y)) do begin
			isqrt:=y;
			y:=(n div y+y) div 2;
		end;
	end;
end;

function isPrime(i: longint): boolean;
var
	j: longint;
begin
	isPrime:=true;
	if i<2 then isPrime:=false;
	for j:=2 to isqrt(i) do begin
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
