io.write(2)
for i=3,999 do
j=2
while i%j>0 do j=j+1 end
if j==i then io.write(':'..i) end
end