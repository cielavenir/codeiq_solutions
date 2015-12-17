open System
open System.Runtime.InteropServices

let bufsiz=32

[<Literal>]
//MacPorts
//let libgmp="/opt/local/lib/libgmp.dylib"
//ideone
let libgmp="/usr/lib/i386-linux-gnu/libgmp.so.10"
//let libgmp="/usr/lib/libgmp.so.3"
//paiza.io/atcoder
//let libgmp="/usr/lib/x86_64-linux-gnu/libgmp.so.10"
//wandbox/yukicoder
//let libgmp="/usr/lib64/libgmp.so.10"
//AOJ
//let libgmp="/usr/lib64/libgmp.so.3"

module libc=
 [<DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)>]extern int write(int x,int y,int z)
 [<DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)>]extern IntPtr fopen(string x,string y)
 [<DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)>]extern int fflush(IntPtr x)
 [<DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)>]extern int puts(string x)
 [<DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)>]extern int system(string x)

module gmp=
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_init(IntPtr a)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_clear(IntPtr a)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_out_str(IntPtr a,int b,IntPtr c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_set(IntPtr a,IntPtr b)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_set_str(IntPtr a,string b,int c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_set_si(IntPtr a,int64 b)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern int __gmpz_cmp_si(IntPtr a,int64 b)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern int64 __gmpz_get_si(IntPtr a)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_abs(IntPtr a,IntPtr b)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_add(IntPtr a,IntPtr b,IntPtr c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_add_ui(IntPtr a,IntPtr b,int64 c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_mul(IntPtr a,IntPtr b,IntPtr c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_mul_si(IntPtr a,IntPtr b,int64 c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_mul_ui(IntPtr a,IntPtr b,int64 c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_sub(IntPtr a,IntPtr b,IntPtr c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_sub_ui(IntPtr a,IntPtr b,int64 c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_ui_sub(IntPtr a,int64 b,IntPtr c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_tdiv_q(IntPtr a,IntPtr b,IntPtr c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_tdiv_r(IntPtr a,IntPtr b,IntPtr c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_tdiv_q_ui(IntPtr a,IntPtr b,int64 c)
 [<DllImport(libgmp,CallingConvention=CallingConvention.Cdecl)>]extern void __gmpz_tdiv_r_ui(IntPtr a,IntPtr b,int64 c)

let mul(a1:IntPtr,b1:IntPtr,c1:IntPtr,d1:IntPtr,a2:IntPtr,b2:IntPtr,c2:IntPtr,d2:IntPtr) =
 let a0=Marshal.AllocHGlobal(bufsiz)
 gmp.__gmpz_init(a0)
 let b0=Marshal.AllocHGlobal(bufsiz)
 gmp.__gmpz_init(b0)
 let c0=Marshal.AllocHGlobal(bufsiz)
 gmp.__gmpz_init(c0)
 let d0=Marshal.AllocHGlobal(bufsiz)
 gmp.__gmpz_init(d0)
 let t=Marshal.AllocHGlobal(bufsiz)
 gmp.__gmpz_init(t)
 let u=Marshal.AllocHGlobal(bufsiz)
 gmp.__gmpz_init(u)

 gmp.__gmpz_mul(t,a1,a2)
 gmp.__gmpz_mul(u,b1,c2)
 gmp.__gmpz_add(a0,t,u)
 gmp.__gmpz_mul(t,a1,b2)
 gmp.__gmpz_mul(u,b1,d2)
 gmp.__gmpz_add(b0,t,u)
 gmp.__gmpz_mul(t,c1,a2)
 gmp.__gmpz_mul(u,d1,c2)
 gmp.__gmpz_add(c0,t,u)
 gmp.__gmpz_mul(t,c1,b2)
 gmp.__gmpz_mul(u,d1,d2)
 gmp.__gmpz_add(d0,t,u)

 gmp.__gmpz_set(a1,a0)
 gmp.__gmpz_set(b1,b0)
 gmp.__gmpz_set(c1,c0)
 gmp.__gmpz_set(d1,d0)

 gmp.__gmpz_clear(a0);Marshal.FreeHGlobal(a0)
 gmp.__gmpz_clear(b0);Marshal.FreeHGlobal(b0)
 gmp.__gmpz_clear(c0);Marshal.FreeHGlobal(c0)
 gmp.__gmpz_clear(d0);Marshal.FreeHGlobal(d0)
 gmp.__gmpz_clear(t);Marshal.FreeHGlobal(t)
 gmp.__gmpz_clear(u);Marshal.FreeHGlobal(u)


let stdout=libc.fopen("/dev/stdout","w")
let a1=Marshal.AllocHGlobal(bufsiz)
gmp.__gmpz_init(a1)
let b1=Marshal.AllocHGlobal(bufsiz)
gmp.__gmpz_init(b1)
let c1=Marshal.AllocHGlobal(bufsiz)
gmp.__gmpz_init(c1)
let d1=Marshal.AllocHGlobal(bufsiz)
gmp.__gmpz_init(d1)
let a2=Marshal.AllocHGlobal(bufsiz)
gmp.__gmpz_init(a2)
let b2=Marshal.AllocHGlobal(bufsiz)
gmp.__gmpz_init(b2)
let c2=Marshal.AllocHGlobal(bufsiz)
gmp.__gmpz_init(c2)
let d2=Marshal.AllocHGlobal(bufsiz)
gmp.__gmpz_init(d2)

gmp.__gmpz_set_si(a1,1L)
gmp.__gmpz_set_si(b1,0L)
gmp.__gmpz_set_si(c1,0L)
gmp.__gmpz_set_si(d1,1L)
gmp.__gmpz_set_si(a2,1L)
gmp.__gmpz_set_si(b2,1L)
gmp.__gmpz_set_si(c2,1L)
gmp.__gmpz_set_si(d2,0L)

let mutable N=int(Console.ReadLine())
N<-((N+3)/2)*2
while N>0 do
 if N%2>0 then
  mul(a1,b1,c1,d1,a2,b2,c2,d2)
 mul(a2,b2,c2,d2,a2,b2,c2,d2)
 N<-N/2

gmp.__gmpz_sub_ui(c1,c1,1L)
gmp.__gmpz_out_str(stdout,10,c1)
libc.fflush(stdout)
libc.puts("")
libc.fflush(stdout)

gmp.__gmpz_clear(a1);Marshal.FreeHGlobal(a1)
gmp.__gmpz_clear(b1);Marshal.FreeHGlobal(b1)
gmp.__gmpz_clear(c1);Marshal.FreeHGlobal(c1)
gmp.__gmpz_clear(d1);Marshal.FreeHGlobal(d1)
gmp.__gmpz_clear(a2);Marshal.FreeHGlobal(a2)
gmp.__gmpz_clear(b2);Marshal.FreeHGlobal(b2)
gmp.__gmpz_clear(c2);Marshal.FreeHGlobal(c2)
gmp.__gmpz_clear(d2);Marshal.FreeHGlobal(d2)