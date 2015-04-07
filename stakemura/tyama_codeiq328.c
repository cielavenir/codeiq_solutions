//ideone C http://ideone.com/CyWujY
#define cross(x,y,X,Y) ((x)*(Y)-(y)*(X))
double x[99],y[99],S,s,sx,sy;
i,n;main(){
	for(;~scanf("%lf,%lf\n",x+n,y+n);n++);
	x[n]=x[0],y[n]=y[0];
	for(;i<n;i++){
		//X軸（右方向＋）、Y軸（下方向＋）すなわち数学的には右回りとなる。
		s=cross(x[i],y[i],x[i+1],y[i+1])/2;
		S+=s;
		sx+=s*(x[i]+x[i+1])/3;
		sy+=s*(y[i]+y[i+1])/3;
	}
	printf("%f %f\n",sx/S,sy/S); //(X座標)719.100508 (Y座標)613.996922
	exit(0);
}