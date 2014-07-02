do J=1,8
do I=0,40/J
write (*,'(a)',advance='no')char(36+I*J*2)
enddo
enddo
end