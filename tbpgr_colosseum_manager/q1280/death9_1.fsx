open Printf
for i in 0..207 do printf"%c"(char (97+i%26-(8-i%8)/8*32))