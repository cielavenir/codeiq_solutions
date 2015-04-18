#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <algorithm>
#include <cmath>
using namespace std;

int reversepoland(string exp){
	int i;
	
	vector<string> token;
	{
		istringstream ss(exp);
		string s;
		for(;ss>>s;)token.push_back(s);
	}
	vector<double> resolveNumber;
	vector<string> resolveString;
	for(i=0;i<token.size();i++){
		char *p=NULL;
		double d=strtod(token[i].c_str(),&p);
		if(p-token[i].c_str()==token[i].size()){
			resolveNumber.push_back(d);
			resolveString.push_back(token[i]);
		}else if(token[i]=="sqrt"||token[i]=="."){
			if(resolveNumber.size()<1){printf("stack few\n");return 0;}
			double d1=resolveNumber[resolveNumber.size()-1];
			resolveNumber.pop_back();
			string s1=resolveString[resolveString.size()-1];
			resolveString.pop_back();
			double ret;
			
			if(token[i]=="sqrt"){ret=sqrt(d1);}
			else if(token[i]=="."){printf("%f\n",d1);}
			else{printf("unknown OP %s\n",token[i].c_str());return 0;}
			
			if(token[i]!=".")resolveNumber.push_back(ret);
			resolveString.push_back(token[i]+"("+s1+")"); //this won't emit "optimized" expression. full of parens.
		}else{
			if(resolveNumber.size()<2){printf("stack few\n");return 0;}
			double d2=resolveNumber[resolveNumber.size()-1],d1=resolveNumber[resolveNumber.size()-2];
			resolveNumber.pop_back(),resolveNumber.pop_back();
			string s2=resolveString[resolveString.size()-1],s1=resolveString[resolveString.size()-2];
			resolveString.pop_back(),resolveString.pop_back();
			double ret;
			
			if(token[i]=="+"){ret=d1+d2;}
			else if(token[i]=="-"){ret=d1-d2;}
			else if(token[i]=="*"){ret=d1*d2;}
			else if(token[i]=="/"){ret=d1/d2;}
			//else if(token[i]=="%"){ret=d1%d2;}
			else if(token[i]=="**"){ret=pow(d1,d2);}
			else{printf("unknown OP %s\n",token[i].c_str());return 0;}
			
			resolveNumber.push_back(ret);
			resolveString.push_back("("+s1+token[i]+s2+")"); //this won't emit "optimized" expression. full of parens.
		}
		printf("[");
		for(int j=0;j<resolveNumber.size();j++)printf(j<resolveNumber.size()-1?"%f, ":"%f",resolveNumber[j]);
		puts("]");
	}
	//if(resolveNumber.size()!=1){printf("result stack not 1");return 0;}
	//printf("%s\n",resolveString[0].c_str());
	return 1;
}

int main(){
	reversepoland("1 2 sqrt + 1 2 sqrt - * .");
}