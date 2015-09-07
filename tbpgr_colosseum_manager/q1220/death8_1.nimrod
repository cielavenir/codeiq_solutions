import strutils
for i in 0..24:echo(repeatChar(i,'A')&chr(66+i)&repeatChar(24-i,'A'))