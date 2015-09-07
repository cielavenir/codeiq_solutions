for i=0,207 do
io.write(string.char(97+i%26-math.floor((8-i%8)/8)*32))
end