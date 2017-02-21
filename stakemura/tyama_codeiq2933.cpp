#include <iostream>
#include <iomanip>
#include <sstream>
#include <string>
#include <vector>
#include <algorithm>
#include <cassert>
using namespace std;
vector<string> split(string &str, const char *delim){
	vector<string> result;
	int cutAt;
	while( (cutAt = str.find_first_of(delim)) != str.npos ){
		if(cutAt > 0){
			result.push_back(str.substr(0, cutAt));
		}
		str = str.substr(cutAt + 1);
	}
	if(str.length() > 0){
		result.push_back(str);
	}
	return result;
}
string twenty[20]={
	"zero","one","two","three","four","five","six","seven","eight","nine",
	"ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen",
};
string ty[10]={
	"","","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety",
};
string convert(const vector<string>&a,int start,int end){
	int size=end-start,i,r1=0,r2=0;
	if(size>1&&a[start+1]=="hundred"){
		for(i=0;i<10;i++){
			if(a[start]==twenty[i]){
				r1=i;
				start+=2;
				size-=2;
				break;
			}
		}
		assert(i<10);
	}
	for(;start<end;start++){
		for(i=0;i<20;i++)if(a[start]==twenty[i])r2+=i;
		for(i=2;i<10;i++)if(a[start]==ty[i])r2+=10*i;
	}
	ostringstream ss;
	ss<<setfill('0')<<setw(3)<<(r1*100+r2);
	return ss.str();
}
int perform(const vector<string> &a,int start,int aend){
	string result;
	int end,billion=0,million=0,thousand=0,sign=1;
	if(a[0]=="negative"){
		sign=-1;
		start++;
	}
	for(end=start;end<aend;end++){
		if(a[end]=="billion"){
			billion=1;
			result+=convert(a,start,end);
			start=end+1;
		}
		if(a[end]=="million"){
			million=1;
			result+=convert(a,start,end);
			start=end+1;
		}
		if(a[end]=="thousand"){
			if(billion&&!million)result+="000";
			thousand=1;
			result+=convert(a,start,end);
			start=end+1;
		}
	}
	if(billion&&!million&&!thousand)result+="000000";
	if(million&&!thousand)result+="000";
	result+=convert(a,start,end);
	for(start=0;start<result.size();start++)if(result[start]!='0')break;
	result=result.substr(start);
	if(result=="")result="0";
	return sign*stoi(result);
}

/// above is from my codeeval110 solution ///

template<typename T>
int find_index(const vector<T> &a,const T &x){
	auto it=find(a.begin(),a.end(),x);
	return it==a.end() ? -1 : distance(a.begin(),it);
}
int main(){
	int idx;
	string s;
	getline(cin,s);
	vector<string>a=split(s," ");
	for(int i=a.size()-1;i>=0;i--){
		if(a[i]=="and")a.erase(a.begin()+i);
	}
	if(a[0]=="add"){
		idx=find_index(a,string("to"));
		cout<<perform(a,1,idx)+perform(a,idx+1,a.size())<<endl;
	}else if(a[0]=="subtract"){
		idx=find_index(a,string("from"));
		cout<<perform(a,idx+1,a.size())-perform(a,1,idx)<<endl;
	}else if(a[0]=="twice"){
		cout<<2*perform(a,1,a.size())<<endl;
	}else if(a[0]=="divide"){
		idx=find_index(a,string("by"));
		cout<<perform(a,1,idx)/perform(a,idx+1,a.size())<<endl;
	}else if(a[0]=="half"){
		idx=find_index(a,string("to"));
		cout<<perform(a,1,a.size())/2<<endl;
	}else if((idx=find_index(a,string("added")))>=0){
		cout<<perform(a,0,idx)+perform(a,idx+2,a.size())<<endl;
	}else if((idx=find_index(a,string("minus")))>=0){
		cout<<perform(a,0,idx)-perform(a,idx+1,a.size())<<endl;
	}else if((idx=find_index(a,string("times")))>=0){
		cout<<perform(a,0,idx)*perform(a,idx+1,a.size())<<endl;
	}else if((idx=find_index(a,string("multiplied")))>=0){
		cout<<perform(a,0,idx)*perform(a,idx+2,a.size())<<endl;
	}else if((idx=find_index(a,string("divides")))>=0){
		cout<<perform(a,idx+1,a.size())/perform(a,0,idx)<<endl;
	}
}