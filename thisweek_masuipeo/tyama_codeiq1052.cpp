#include <cstdio>
#include <vector>
int main(){
	int N;
	scanf("%d",&N); //11
	std::vector<std::vector<int> >m(N);
	m[0].resize(N);
	m[0][0]=1;
	for(int i=1;i<N;i++){
		m[i].resize(N);
		for(int j=N-1;j>0;j--){
			for(int k=1;k<=4&&j-k>=0;k++)m[i][j]+=m[i-1][j-k];
		}
	}
	int r=0;
	for(int i=0;i<N;i++)for(int j=0;j<N;j++)r+=m[i][j]*m[i][N-1-j];
	printf("%d\n",r);
}