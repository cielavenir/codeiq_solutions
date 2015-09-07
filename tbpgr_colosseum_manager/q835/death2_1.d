import std.c.locale,core.stdc.wchar_;
int[] x=[97,65,12354,12450,12450,12354,65,97];
int main(){setlocale(0,"");for(int i=0;i<26;i++)for(int j=0;j<8;j++)putwchar(x[j]+i);return 0;}