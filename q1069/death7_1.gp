r(s,n)={if(n,Str(r(s,n-1),s),"")}
apply(x->print1(Str(">",r("+",x),".")),Vec(Vecsmall("deathma colosseum")))