#import<locale.h>
#import<wchar.h>
int i,j;main(){setlocale(0,"");for(;i<26;i++)for(j=0;j<8;j++)putwchar(L"aAあアアあAa"[j]+i);}