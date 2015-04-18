#!/usr/bin/vala
static void main(){
	string[] token="1 2 sqrt + 1 2 sqrt - * .".split(" ");
	Array<double?> resolveNumber=new Array<double?>();
	Array<string> resolveString=new Array<string>();
	for(int i=0;i<token.length;i++){
		string endptr;
		double d=token[i].to_double(out endptr);
		if(endptr==""){
			resolveNumber.append_val(d);
			resolveString.append_val(token[i]);
		}else if(token[i]=="sqrt"||token[i]=="."){
			if(resolveNumber.length<1){stdout.printf("stack few\n");return;}
			double d1=resolveNumber.index(resolveNumber.length-1);
			resolveNumber.remove_index(resolveNumber.length-1);
			string s1=resolveString.index(resolveString.length-1);
			resolveString.remove_index(resolveString.length-1);
			double ret=0;
			
			if(token[i]=="sqrt"){ret=Math.sqrt(d1);}
			else if(token[i]=="."){stdout.printf("%f\n",d1);}
			else{stdout.printf("unknown OP %s\n",token[i]);return;}
			
			if(token[i]!=".")resolveNumber.append_val(ret);
			resolveString.append_val(token[i]+"("+s1+")"); //this won't emit "optimized" expression. full of parens.
		}else{
			if(resolveNumber.length<2){stdout.printf("stack few\n");return;}
			double d2=resolveNumber.index(resolveNumber.length-1),d1=resolveNumber.index(resolveNumber.length-2);
			resolveNumber.remove_index(resolveNumber.length-1);
			resolveNumber.remove_index(resolveNumber.length-1);
			string s2=resolveString.index(resolveString.length-1),s1=resolveString.index(resolveString.length-2);
			resolveString.remove_index(resolveString.length-1);
			resolveString.remove_index(resolveString.length-1);
			double ret;
			
			if(token[i]=="+"){ret=d1+d2;}
			else if(token[i]=="-"){ret=d1-d2;}
			else if(token[i]=="*"){ret=d1*d2;}
			else if(token[i]=="/"){ret=d1/d2;}
			else if(token[i]=="%"){ret=d1%d2;}
			else if(token[i]=="**"){ret=Math.pow(d1,d2);}
			else{stdout.printf("unknown OP %s\n",token[i]);return;}
			
			resolveNumber.append_val(ret);
			resolveString.append_val("("+s1+token[i]+s2+")"); //this won't emit "optimized" expression. full of parens.
		}
		stdout.printf("[");
		for(int j=0;j<resolveNumber.length;j++){
			stdout.printf("%f",resolveNumber.index(j));
			if(j<resolveNumber.length-1)stdout.puts(", ");
		}
		stdout.puts("]\n");
	}
	//stdout.puts("Compiled into: "+resolveString.index(0)+"\n"); // .(((1+sqrt(2))*(1-sqrt(2))))
}