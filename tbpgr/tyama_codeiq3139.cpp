#include <iostream>
#include <string>
int main(){
	std::string s;
	for(;std::getline(std::cin,s);){
		s[s.size()/2]&=0xdf;
		std::cout<<s<<std::endl;
	}
}
