cat(2)
for(i in 3:999){
j=2
while(i%%j)j=j+1
if(j==i){cat(':');cat(i)}
}