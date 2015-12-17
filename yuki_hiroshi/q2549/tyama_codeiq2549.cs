using System;
using System.Runtime.InteropServices;

class CodeIQ2549{
	const int bufsiz=32;

	//MacPorts
	//const string libgmp="/opt/local/lib/libgmp.dylib";
	//ideone
	const string libgmp="/usr/lib/i386-linux-gnu/libgmp.so.10";
	//paiza.io/atcoder
	//const string libgmp="/usr/lib/x86_64-linux-gnu/libgmp.so.10";
	//wandbox/yukicoder
	//const string libgmp="/usr/lib64/libgmp.so.10";
	//AOJ
	//const string libgmp="/usr/lib64/libgmp.so.3";

	[DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)]static extern int write(int x,string y,int z);
	[DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)]static extern IntPtr fopen(string x,string y);
	[DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)]static extern int fflush(IntPtr x);
	[DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)]static extern int puts(string x);
	[DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)]static extern int system(string x);

	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_init(IntPtr x);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_clear(IntPtr x);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_out_str(IntPtr x,int y,IntPtr z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_set_str(IntPtr x,string y,int z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_set(IntPtr x,IntPtr y);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_set_si(IntPtr x,long y);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern int  __gmpz_cmp_si(IntPtr x,long y);

	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_add(IntPtr x,IntPtr y,IntPtr z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_sub(IntPtr x,IntPtr y,IntPtr z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_mul(IntPtr x,IntPtr y,IntPtr z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_tdiv_q(IntPtr x,IntPtr y,IntPtr z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_tdiv_r(IntPtr x,IntPtr y,IntPtr z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_add_ui(IntPtr x,IntPtr y,long z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_sub_ui(IntPtr x,IntPtr y,long z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_mul_ui(IntPtr x,IntPtr y,long z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_tdiv_q_ui(IntPtr x,IntPtr y,long z);
	[DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)]static extern void __gmpz_tdiv_r_ui(IntPtr x,IntPtr y,long z);

	static void mul(IntPtr a1,IntPtr b1,IntPtr c1,IntPtr d1,IntPtr a2,IntPtr b2,IntPtr c2,IntPtr d2){
		IntPtr a0=Marshal.AllocHGlobal(bufsiz);__gmpz_init(a0);
		IntPtr b0=Marshal.AllocHGlobal(bufsiz);__gmpz_init(b0);
		IntPtr c0=Marshal.AllocHGlobal(bufsiz);__gmpz_init(c0);
		IntPtr d0=Marshal.AllocHGlobal(bufsiz);__gmpz_init(d0);
		IntPtr t=Marshal.AllocHGlobal(bufsiz);__gmpz_init(t);
		IntPtr u=Marshal.AllocHGlobal(bufsiz);__gmpz_init(u);

		__gmpz_mul(t,a1,a2);
		__gmpz_mul(u,b1,c2);
		__gmpz_add(a0,t,u);
		__gmpz_mul(t,a1,b2);
		__gmpz_mul(u,b1,d2);
		__gmpz_add(b0,t,u);
		__gmpz_mul(t,c1,a2);
		__gmpz_mul(u,d1,c2);
		__gmpz_add(c0,t,u);
		__gmpz_mul(t,c1,b2);
		__gmpz_mul(u,d1,d2);
		__gmpz_add(d0,t,u);

		__gmpz_set(a1,a0);
		__gmpz_set(b1,b0);
		__gmpz_set(c1,c0);
		__gmpz_set(d1,d0);

		__gmpz_clear(a0);Marshal.FreeHGlobal(a0);
		__gmpz_clear(b0);Marshal.FreeHGlobal(b0);
		__gmpz_clear(c0);Marshal.FreeHGlobal(c0);
		__gmpz_clear(d0);Marshal.FreeHGlobal(d0);
		__gmpz_clear(t);Marshal.FreeHGlobal(t);
		__gmpz_clear(u);Marshal.FreeHGlobal(u);
	}

	static void Main(){
		IntPtr stdout=fopen("/dev/stdout","w");

		IntPtr a1=Marshal.AllocHGlobal(bufsiz);__gmpz_init(a1);
		IntPtr b1=Marshal.AllocHGlobal(bufsiz);__gmpz_init(b1);
		IntPtr c1=Marshal.AllocHGlobal(bufsiz);__gmpz_init(c1);
		IntPtr d1=Marshal.AllocHGlobal(bufsiz);__gmpz_init(d1);
		IntPtr a2=Marshal.AllocHGlobal(bufsiz);__gmpz_init(a2);
		IntPtr b2=Marshal.AllocHGlobal(bufsiz);__gmpz_init(b2);
		IntPtr c2=Marshal.AllocHGlobal(bufsiz);__gmpz_init(c2);
		IntPtr d2=Marshal.AllocHGlobal(bufsiz);__gmpz_init(d2);

		__gmpz_set_si(a1,1);
		__gmpz_set_si(b1,0);
		__gmpz_set_si(c1,0);
		__gmpz_set_si(d1,1);
		__gmpz_set_si(a2,1);
		__gmpz_set_si(b2,1);
		__gmpz_set_si(c2,1);
		__gmpz_set_si(d2,0);

		int N=int.Parse(Console.ReadLine());
		N=(N+3)/2*2;
		for(;N>0;N>>=1){
			if((N&1)>0)mul(a1,b1,c1,d1,a2,b2,c2,d2);
			mul(a2,b2,c2,d2,a2,b2,c2,d2);
		}
		__gmpz_sub_ui(c1,c1,1);
		__gmpz_out_str(stdout,10,c1);
		fflush(stdout);
		puts("");
		fflush(stdout);

		__gmpz_clear(a1);Marshal.FreeHGlobal(a1);
		__gmpz_clear(b1);Marshal.FreeHGlobal(b1);
		__gmpz_clear(c1);Marshal.FreeHGlobal(c1);
		__gmpz_clear(d1);Marshal.FreeHGlobal(d1);
		__gmpz_clear(a2);Marshal.FreeHGlobal(a2);
		__gmpz_clear(b2);Marshal.FreeHGlobal(b2);
		__gmpz_clear(c2);Marshal.FreeHGlobal(c2);
		__gmpz_clear(d2);Marshal.FreeHGlobal(d2);
	}
}