#!/usr/bin/env fan
class StepUpSum{
	static Void main(){
		for(;;){
			Str? s:=Env.cur.in.readLine
			if(s==null)break
			Int n:=s.toInt
			if(n==0)break
			Int r:=0
			Int i:=2
			for(;;i++){
				Int x:=n-i*(i-1)/2
				if(x<i)break
				if(x%i==0)r+=x/i
			}
			echo(r)
		}
	}
}