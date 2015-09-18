{$apptype console} //Delphi
program StepUpSum;
var n,r,i,x:int64;
begin
	while(true) do begin
		if(eof(input)) then break;
		readln(n);
		if(n=0) then break;
		r:=0;
		i:=2;
		while(true) do begin
			x:=n-(i*(i-1) div 2);
			if(x<i) then break;
			if(x mod i=0) then r:=r+(x div i);
			i:=i+1;
		end;
		writeln(r);
	end;
end.