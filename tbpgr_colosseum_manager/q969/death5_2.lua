for i=1,50 do
io.write(i%5>0 and(i%3>0 and i or'fizz')or(i%3>0 and'buzz'or'FIZZBUZZ'))
end