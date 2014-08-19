for i=1,50 do
io.write(i%15>0 and(i%5>0 and(i%3>0 and i or'fizz')or'buzz')or'FIZZBUZZ')
end