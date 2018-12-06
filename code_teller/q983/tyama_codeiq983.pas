{$apptype console} //Delphi
program CodeIQ983;
var n,digits0,expbase,x,num,starting,bse:int64;
var i:integer;
begin
	starting:=5;
	bse:=10;
	while(true) do begin
		if(eof(input)) then break;
		readln(n);
		n:=n+starting-2;
		digits0:=1;
		expbase:=1;
		x:=bse-1;
		while(x<=n) do begin
			n:=n-x;
			digits0:=digits0+1;
			expbase:=expbase*bse;
			x:=digits0*expbase*(bse-1);
		end;
		num:=expbase+n div digits0;
		for i:=1 to (digits0-1-n mod digits0) do begin
			num:=num div bse;
		end;
		writeln(num mod bse);
	end;
end.