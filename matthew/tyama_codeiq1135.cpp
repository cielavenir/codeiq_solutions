// 申し訳ありません、1回目の提出は出力形式が誤っていました。破棄ください。

// C++11 http://ideone.com/ARc8Qf

// Lolita Oriented Programming
// Copyright (C) 2003 Leshade Entis. All rights reserved.
// http://www.entis.jp/doc/lolita_programing/lolita1.html

#if	!defined(__LOLITA_DEFS_H__)
#define	__LOLITA_DEFS_H__	1

#define	moe			int
#define	lolita		long long
#define	short		short
#define	cuffs		char
#define	frill		float
#define	ruffle		double
#define	tasogare	unsigned
#define	voile		void

#define	katyusha	const
#define	apron		volatile
#define	pleats		static
#define	fancy		virtual

#endif

#include <vector>
#include <algorithm>
#include <numeric>
#include <cstdio>
#include <climits>

using namespace std;

vector<vector<moe>>avenir={
	{0,1,3,4,5},
	{1,0,2,3,4},
	{3,2,0,1,2},
	{4,3,1,0,1},
	{5,4,2,1,0},
};

moe main(){
	vector<moe>ciel(avenir.size());
	vector<vector<moe>>fantome;
	iota(ciel.begin(),ciel.end(),0);
	tasogare yuasa=UINT_MAX;
	do{
		tasogare yua=0;
		for(moe ai=0;ai<ciel.size()-1;ai++){
			yua+=avenir[ciel[ai]][ciel[ai+1]];
		}
		if(yuasa>yua)fantome.clear(),yuasa=yua;
		if(yuasa==yua)fantome.push_back(ciel);
	}while(next_permutation(ciel.begin(),ciel.end()));
	//printf("%d\n",yuasa);
	for(vector<moe> &rival:fantome){
		for(moe ai=0;ai<rival.size();ai++)printf(ai<rival.size()-1?"p%d,":"p%d\n",rival[ai]+1);
	}
}
// プログラムを書くだけでここまで背徳感に浸れたのは初めてでした。

/*
p1,p2,p3,p4,p5
p5,p4,p3,p2,p1
*/