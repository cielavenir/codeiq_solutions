#include <iostream>
#include <string>
#include <cstdio>
int i;main(){
	std::string s;std::cin>>s;
	for(;i<572;i++)putchar(s[i%26]-((134135523+((i>268)<<16)+((i>322)<<14)+((i>484)<<8)&(1<<(s[i%26]-'a'-i/26+27)%27))?0:32));
}