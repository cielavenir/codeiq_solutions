do i=0,207
write (*,'(a)',advance='no')char(97+mod(i,26)-(8-mod(i,8))/8*32)
enddo
end