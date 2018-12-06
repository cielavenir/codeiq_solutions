#!/usr/bin/env fan
class CodeIQ983{
	static Void main(){
		Int starting:=5
		Int base:=10
		for(;;){
			Str? s:=Env.cur.in.readLine
			if(s==null)break
			Int n:=s.toInt+starting-2
			Int digits:=1
			Int expbase:=1
			Int x
			for(;(x=digits*expbase*(base-1))<=n;n-=x){
				digits+=1
				expbase*=base
			}
			Int num:=expbase+n/digits
			Int d:=digits-1-n%digits
			for(;d>0;d--)num/=base
			echo(num%base)
		}
	}
}