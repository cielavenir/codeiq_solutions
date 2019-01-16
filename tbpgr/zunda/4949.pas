program sksk;
var i,n,cnt: longint;

function isqrt(n: longint): longint;
var
	x: longint;
	y: longint;
begin
	if(n<=0) then
		isqrt:=0
	else if(n<4) then
		isqrt:=1
	else begin
		x:=0;
		y:=n;
		while((x<>y) and (x+1<>y)) do begin
			x:=y;
			y:=(n div y+y) div 2;
		end;
		isqrt:=x;
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

function is4949(i: longint): boolean;
begin
	if(i <= 0) then
		is4949:=false
	else if( (i mod 10 = 4)or(i mod 10 = 9) ) then
		is4949:=true
	else
		is4949:=is4949(i div 10);
end;

begin
	read(n);
	i:=2;
	cnt:=0;
	while(cnt<n) do begin
		if(is4949(i) and isPrime(i)) then begin
			write(i);
			if(cnt < n - 1) then
				write(',')
			else
				writeln();
			cnt:=cnt + 1;
		end;
		i:=i + 1;
	end;
end.
