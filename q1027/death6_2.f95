write(*,'(i0)',advance='no')2
do i=3,999
j=2
do while(mod(i,j).gt.0)
j=j+1
enddo
if(j.eq.i)then
write(*,'(":",i0)',advance='no')i
endif
enddo
end