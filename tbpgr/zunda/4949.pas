program sksk;
var i,n,cnt: integer;

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

function is4949(i: integer): boolean;
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
