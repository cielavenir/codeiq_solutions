// CodeIQ 'Reduce conditional branches'
// 解答言語：C
#include <stdio.h>
// xとyの差の絶対値がe未満か
int f(int x, int y, int e) {
	x-=y;
	unsigned int val=((x>>31)|1)*x - e;
	return val>>31;
	//return ((x>y) ? (x-y) : (y-x))<e;
}
int main() {
	printf("%d %d %d\n", f(2, 4, 2), f(2, 4, 1), f(6, 3, 4));
	return 0;
}