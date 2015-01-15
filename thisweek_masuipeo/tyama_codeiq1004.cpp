/*
手元で試してみましたが、増井さんが示してくださった、
	vector<string>v={
		"######",
		"#    #",
		"#  # #",
		"#   ##",
		"#    #",
		"######",
	};
については出会いませんでした
(Aさんがゴールした7手目で終わりになったからだと思われます)。
しかし、その点対称である
	vector<string>v={
		"######",
		"#    #",
		"##   #",
		"# #  #",
		"#  X #",
		"######",
	};
については上図のXで出会ってしまいました。
m1.ok()とm2.ok()の両方が偽である必要があるという点を直しました。
*/

#include <cstdio>
#include <string>
#include <queue>
#include <map>
using namespace std;
const int D[4][2]={ //Right,Up,Left,Down
	{0,1},
	{-1,0},
	{0,-1},
	{1,0},
};

class Maze{
	const vector<string> &v;
	const int gx,gy;
	int x,y,d;
public:
	Maze(int _x,int _y,int _gx,int _gy,int _d,const vector<string>&_v)
		: x(_x),y(_y),gx(_gx),gy(_gy),d(_d),v(_v){}
	bool ok(){return x==gx && y==gy;}
	bool same(Maze& other){return x==other.x && y==other.y;}
	void move(){
		int d_orig=(d+3)%4,i=0;
		for(;i<4;i++){
			d=(d_orig+i)%4;
			if(v[y+D[d][0]][x+D[d][1]]!='#')break;
		}
		y=y+D[d][0];
		x=x+D[d][1];
		//printf("%d %d %d\n",x,y,d);
	}
};

bool solvable(int _x,int _y,int _gx,int _gy,const vector<string>&v){
	if(v[_y][_x]=='#' || v[_gy][_gx]=='#')return false;
	typedef pair<int,int> pii;
	queue<pii>q;
	map<pii,pii>back;
	q.push(make_pair(_x,_y));
	back[make_pair(_x,_y)]=make_pair(_x,_y);
	for(;!q.empty();){
		pii p=q.front();q.pop();
		int x=p.first,y=p.second;
		for(int d=0;d<4;d++){
			if(v[y+D[d][0]][x+D[d][1]]!='#'){
				pii _p=make_pair(x+D[d][1],y+D[d][0]);
				if(_p==make_pair(_gx,_gy))return true;
				if(back.find(_p)==back.end())back[_p]=p,q.push(_p);
			}
		}
	}
	return false;
}

int main(){
	const int N=5;
	const int power=N*N;
	vector<string>v(N+2);
	v[0]=v[N+1]=string(N+2,'#');
	for(int i=1;i<=N;i++){
		v[i]=string(1,'#')+string(N,' ')+'#';
	}
	/*
	vector<string>v={
		"######",
		"#    #",
		"##   #",
		"# #  #",
		"#    #",
		"######",
	};
	*/
	int r=0;
	for(int i=0;i<(1<<power);i++){
		for(int j=0;j<power;j++)v[j/N+1][j%N+1]=(i&(1<<j)) ? '#' : ' ';
		if(!solvable(1,1,N,N,v))continue;
		Maze m1(1,1,N,N,3,v);
		Maze m2(N,N,1,1,1,v);
		for(;!m1.ok()&&!m2.ok();){
			m1.move();
			m2.move();
			if(m1.same(m2)){
				r++;
				//for(int k=0;k<N+2;k++)printf(v[k].c_str()),printf(",");puts("");
				//puts("OK!");
				break;
			}
		}
	}
	printf("%d\n",r); //660148
}