for i=0,24 do
print(string.rep("A",i)..string.char(i+66)..string.rep("A",24-i))
end