implicit none
integer(8)::starting,bse,n,digits,expbase,x,num,d;
integer::i;
starting=5
bse=10
do while(.true.)
	read(*,*,iostat=i) n
	if(i/=0) then
		exit
	endif
	n=n+starting-2
	digits=1
	expbase=1
	x=bse-1
	do while(x.le.n)
		n=n-x
		digits=digits+1
		expbase=expbase*bse
		x=digits*expbase*(bse-1)
	enddo
	num=expbase+n/digits
	d=digits-1-mod(n,digits)
	do i=1,d
		num=num/bse
	enddo
	write(*,"(i0)") mod(num,bse)
enddo
end