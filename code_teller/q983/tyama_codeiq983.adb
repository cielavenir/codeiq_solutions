with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Long_Long_Integer_Text_IO;
procedure codeiq983 is
n,digits0,expbase,x,num,starting,bse:long_long_integer;
i:integer;
begin
	starting:=5;
	bse:=10;
	while not Ada.Text_IO.End_Of_File loop
		Ada.Long_Long_Integer_Text_IO.Get(n);
		n:=n+starting-2;
		digits0:=1;
		expbase:=1;
		x:=bse-1;
		while x<=n loop
			n:=n-x;
			digits0:=digits0+1;
			expbase:=expbase*bse;
			x:=digits0*expbase*(bse-1);
		end loop;
		num:=expbase+n/digits0;
		for i in 1..(digits0-1-n mod digits0) loop
			num:=num/bse;
		end loop;
		Ada.Long_Long_Integer_Text_IO.Put(num mod bse,width=>1);
		Ada.Text_IO.New_line;
	end loop;
end codeiq983;