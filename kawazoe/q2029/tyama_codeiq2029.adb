with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Long_Long_Integer_Text_IO;
procedure stepupsum is
n,r,i,x:long_long_integer;
begin
	while not Ada.Text_IO.End_Of_File loop
		Ada.Long_Long_Integer_Text_IO.Get(n);
		if n=0 then
			exit;
		end if;
		r:=0;
		i:=2;
		while true loop
			x:=n-i*(i-1)/2;
			if x<i then
				exit;
			end if;
			if x mod i=0 then
				r:=r+x/i;
			end if;
			i:=i+1;
		end loop;
		Ada.Long_Long_Integer_Text_IO.Put(r,width=>1);
		Ada.Text_IO.New_line;
	end loop;
end stepupsum;