#include <stdio.h>

/// dlfcn.h ///
#ifdef __cplusplus
extern "C"{
#endif
#if defined(WIN32) || (!defined(__GNUC__) && !defined(__clang__))
	void* LoadLibraryA(const char *x);
	void* GetProcAddress(void *x,const char *y);
	int   FreeLibrary(void *x);
#elif defined(__APPLE__)
	void* dlopen(const char *x,int y);
	void* dlsym(void *x,const char *y);
	int   dlclose(void *x);
	#define LoadLibraryA(s) dlopen(s,2)
	#define GetProcAddress dlsym
	#define FreeLibrary dlclose
#else
	void* __libc_dlopen_mode(const char *x,int y);
	void* __libc_dlsym(void *x,const char *y);
	int   __libc_dlclose(void *x);
	#define LoadLibraryA(s) __libc_dlopen_mode(s,2)
	#define GetProcAddress __libc_dlsym
	#define FreeLibrary __libc_dlclose
#endif
#ifdef __cplusplus
}
#endif

#if 0
#include "gmp.h"
#else
typedef char mpz_t[32];
#endif

typedef void (*type_mpz_init)(mpz_t);
typedef void (*type_mpz_clear)(mpz_t);
typedef void (*type_mpz_out_str)(FILE*,int,mpz_t);
typedef void (*type_mpz_set)(mpz_t,mpz_t);
typedef void (*type_mpz_set_str)(mpz_t,char*,int);
typedef void (*type_mpz_set_si)(mpz_t,long);
typedef int  (*type_mpz_cmp_si)(mpz_t,long);

typedef void (*type_mpz_add)(mpz_t,mpz_t,mpz_t);
typedef void (*type_mpz_sub)(mpz_t,mpz_t,mpz_t);
typedef void (*type_mpz_mul)(mpz_t,mpz_t,mpz_t);
typedef void (*type_mpz_tdiv_q)(mpz_t,mpz_t,mpz_t);
typedef void (*type_mpz_tdiv_r)(mpz_t,mpz_t,mpz_t);
typedef void (*type_mpz_add_ui)(mpz_t,mpz_t,long);
typedef void (*type_mpz_sub_ui)(mpz_t,mpz_t,long);
typedef void (*type_mpz_mul_ui)(mpz_t,mpz_t,long);
typedef void (*type_mpz_tdiv_q_ui)(mpz_t,mpz_t,long);
typedef void (*type_mpz_tdiv_r_ui)(mpz_t,mpz_t,long);

type_mpz_init mympz_init;
type_mpz_clear mympz_clear;
type_mpz_out_str mympz_out_str;
type_mpz_set mympz_set;
type_mpz_set_str mympz_set_str;
type_mpz_set_si mympz_set_si;
type_mpz_cmp_si mympz_cmp_si;

type_mpz_add mympz_add;
type_mpz_sub mympz_sub;
type_mpz_mul mympz_mul;
type_mpz_tdiv_q mympz_tdiv_q;
type_mpz_tdiv_r mympz_tdiv_r;
type_mpz_add_ui mympz_add_ui;
type_mpz_sub_ui mympz_sub_ui;
type_mpz_mul_ui mympz_mul_ui;
type_mpz_tdiv_q_ui mympz_tdiv_q_ui;
type_mpz_tdiv_r_ui mympz_tdiv_r_ui;

void mul(mpz_t a1,mpz_t b1,mpz_t c1,mpz_t d1,mpz_t a2,mpz_t b2,mpz_t c2,mpz_t d2){
	mpz_t a0,b0,c0,d0,t,u;
	mympz_init(a0);
	mympz_init(b0);
	mympz_init(c0);
	mympz_init(d0);
	mympz_init(t);
	mympz_init(u);

	mympz_mul(t,a1,a2);
	mympz_mul(u,b1,c2);
	mympz_add(a0,t,u);
	mympz_mul(t,a1,b2);
	mympz_mul(u,b1,d2);
	mympz_add(b0,t,u);
	mympz_mul(t,c1,a2);
	mympz_mul(u,d1,c2);
	mympz_add(c0,t,u);
	mympz_mul(t,c1,b2);
	mympz_mul(u,d1,d2);
	mympz_add(d0,t,u);

	mympz_set(a1,a0);
	mympz_set(b1,b0);
	mympz_set(c1,c0);
	mympz_set(d1,d0);

	mympz_clear(a0);
	mympz_clear(b0);
	mympz_clear(c0);
	mympz_clear(d0);
	mympz_clear(t);
	mympz_clear(u);
}

int main(){
	//MacPorts
	//void *H=LoadLibraryA("/opt/local/lib/libgmp.dylib");
	//ideone
	void *H=LoadLibraryA("/usr/lib/i386-linux-gnu/libgmp.so.10");
	//void *H=LoadLibraryA("/usr/lib/libgmp.so.3"); //objc
	//paiza.io/atcoder
	//void *H=LoadLibraryA("/usr/lib/x86_64-linux-gnu/libgmp.so.10");
	//wandbox/yukicoder
	//void *H=LoadLibraryA("/usr/lib64/libgmp.so.10");

	mympz_init=(type_mpz_init)GetProcAddress(H,"__gmpz_init");
	mympz_clear=(type_mpz_clear)GetProcAddress(H,"__gmpz_clear");
	mympz_out_str=(type_mpz_out_str)GetProcAddress(H,"__gmpz_out_str");
	mympz_set=(type_mpz_set)GetProcAddress(H,"__gmpz_set");
	mympz_set_str=(type_mpz_set_str)GetProcAddress(H,"__gmpz_set_str");
	mympz_set_si=(type_mpz_set_si)GetProcAddress(H,"__gmpz_set_si");
	mympz_cmp_si=(type_mpz_cmp_si)GetProcAddress(H,"__gmpz_cmp_si");

	mympz_add=(type_mpz_add)GetProcAddress(H,"__gmpz_add");
	mympz_sub=(type_mpz_sub)GetProcAddress(H,"__gmpz_sub");
	mympz_mul=(type_mpz_mul)GetProcAddress(H,"__gmpz_mul");
	mympz_tdiv_q=(type_mpz_tdiv_q)GetProcAddress(H,"__gmpz_tdiv_q");
	mympz_tdiv_r=(type_mpz_tdiv_r)GetProcAddress(H,"__gmpz_tdiv_r");

	mympz_add_ui=(type_mpz_add_ui)GetProcAddress(H,"__gmpz_add_ui");
	mympz_sub_ui=(type_mpz_sub_ui)GetProcAddress(H,"__gmpz_sub_ui");
	mympz_mul_ui=(type_mpz_mul_ui)GetProcAddress(H,"__gmpz_mul_ui");
	mympz_tdiv_q_ui=(type_mpz_tdiv_q_ui)GetProcAddress(H,"__gmpz_tdiv_q_ui");
	mympz_tdiv_r_ui=(type_mpz_tdiv_r_ui)GetProcAddress(H,"__gmpz_tdiv_r_ui");

	mpz_t a1,b1,c1,d1,a2,b2,c2,d2;
	mympz_init(a1);
	mympz_init(b1);
	mympz_init(c1);
	mympz_init(d1);
	mympz_init(a2);
	mympz_init(b2);
	mympz_init(c2);
	mympz_init(d2);

	mympz_set_si(a1,1);
	mympz_set_si(b1,0);
	mympz_set_si(c1,0);
	mympz_set_si(d1,1);
	mympz_set_si(a2,1);
	mympz_set_si(b2,1);
	mympz_set_si(c2,1);
	mympz_set_si(d2,0);
	
	int N;
	scanf("%d",&N);
	N=(N+3)/2*2;
	for(;N;N>>=1){
		if(N&1)mul(a1,b1,c1,d1,a2,b2,c2,d2);
		mul(a2,b2,c2,d2,a2,b2,c2,d2);
	}
	mympz_sub_ui(c1,c1,1);
	mympz_out_str(stdout,10,c1);
	puts("");

	mympz_clear(a1);
	mympz_clear(b1);
	mympz_clear(c1);
	mympz_clear(d1);
	mympz_clear(a2);
	mympz_clear(b2);
	mympz_clear(c2);
	mympz_clear(d2);

	FreeLibrary(H);
}