i=0
do while(i.lt.25)
write(*,"(a)")repeat("A",i)//char(i+66)//repeat("A",24-i)
i=i+1
enddo
end