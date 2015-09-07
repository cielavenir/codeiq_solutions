do i=0,25
write (*,'(a)',advance='no')char(97+i)//char(65+i)//char(227)//char(129)//char(130+i)//char(227)//char(130)//char(162+i)
write (*,'(a)',advance='no')char(227)//char(130)//char(162+i)//char(227)//char(129)//char(130+i)//char(65+i)//char(97+i)
enddo
end