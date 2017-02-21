upper(N)={
	zi=0;
	zx=0;
	d=1;
	for(i=1,999999,
		x=floor(N*i);
		y=x+1;
		if(x>=1000000,break);
		if(N*i-x < d,d=N*i-x;zi=i;zx=x);
		if(y-N*i < d,d=y-N*i;zi=i;zx=y)
	);
	print1(zx);
	print1(" ");
	print(zi)
}
lower(N)={
	zi=0;
	zx=0;
	d=1;
	for(i=1,999999,
		x=floor(i/N);
		y=x+1;
		if(x>=1000000,break);
		if(i/N-x < d,d=i/N-x;zi=i;zx=x);
		if(y-i/N < d,d=y-i/N;zi=i;zx=y)
	);
	print1(zi);
	print1(" ");
	print(zx)
}
f()={
	N=input();
	if(N>=1,uper(N),lower(N))
}
f()