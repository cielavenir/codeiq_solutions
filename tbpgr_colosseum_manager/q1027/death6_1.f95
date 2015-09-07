do i=2,999
j=2
do while(mod(i,j).gt.0)
j=j+1
enddo
if(j.eq.i)then
write(*,'('//'":",i0)'(i/(i-1)*4-3:),advance='no')i
endif
enddo
end