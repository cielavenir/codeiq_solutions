do i=1,50
if(mod(i,15).eq.0)then
write (*,'(a)',advance='no')'FIZZBUZZ'
else if(mod(i,3).eq.0)then
write (*,'(a)',advance='no')'fizz'
else if(mod(i,5).eq.0)then
write (*,'(a)',advance='no')'buzz'
else
write (*,'(i0)',advance='no')i
endif
enddo
end