// C++11 http://ideone.com/hxYfTq

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
#include <cstdio>
using namespace std;

moe main(){
	vector<pair<cuffs,moe>>avenir={
		{'A',88},
		{'B',92},
		{'C',78},
		{'D',83},
		{'E',91},
	};
	//sort(avenir.begin(),avenir.end(),[](const pair<cuffs,moe> &x,const pair<cuffs,moe> &y){return x.second<y.second;});
	for(int ai=0;ai<avenir.size()-1;ai++){
		for(int mai=0;mai<avenir.size()-1-ai;mai++){
			if(avenir[mai].second>avenir[mai+1].second){
				swap(avenir[mai],avenir[mai+1]);
			}
		}
	}
	for(pair<cuffs,moe> &ciel:avenir){
		printf("%c:%d\n",ciel.first,ciel.second);
	}
}
// プログラムを書くだけでここまで背徳感に浸れたのは初めてでした。

/*
C:78
D:83
A:88
E:91
B:92
*/