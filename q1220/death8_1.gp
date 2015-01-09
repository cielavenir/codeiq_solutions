r(s,n)={if(n,Str(r(s,n-1),s),"")}
for(i=0,24,print(Str(r("A",i),Strprintf("%c",66+i),r("A",24-i))))