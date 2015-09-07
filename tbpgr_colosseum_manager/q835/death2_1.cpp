#include<locale.h>
#include<wchar.h>
int x[]={97,65,12354,12450,12450,12354,65,97},i,j;main(){setlocale(0,"");for(;i<26;i++)for(j=0;j<8;j++)putwchar(x[j]+i);}