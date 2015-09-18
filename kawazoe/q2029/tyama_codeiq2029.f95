implicit none
integer(8)::n,r,i,x;
integer::err
do while(.true.)
	read(*,*,iostat=err) n
	if(err/=0) then
		exit
	endif
	if(n.eq.0) then
		exit
	endif
	r=0
	i=2
	do while(.true.)
		x=n-i*(i-1)/2
		if(x.lt.i) then
			exit
		endif
		if(mod(x,i).eq.0) then
			r=r+x/i
		endif
		i=i+1
	enddo
	write(*,"(i0)") r
enddo
end