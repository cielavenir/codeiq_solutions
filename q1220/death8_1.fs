for i=0 to 24 do printf"%s%c%s\n"(String.replicate i "A")(char(66+i))(String.replicate(24-i)"A")