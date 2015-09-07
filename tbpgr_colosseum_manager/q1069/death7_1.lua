s="deathma colosseum"
for c in s:gmatch(".") do
io.write(">"..string.rep("+",string.byte(c))..".")
end