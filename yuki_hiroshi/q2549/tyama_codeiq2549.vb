imports System
imports System.Runtime.InteropServices

module CodeIQ2549
	const bufsiz as integer=32

	'MacPorts
	'const libgmp as string="/opt/local/lib/libgmp.dylib"
	'ideone
	'const libgmp as string="/usr/lib/i386-linux-gnu/libgmp.so.10"
	const libgmp as string="/usr/lib/libgmp.so.3"
	'paiza.io/atcoder
	'const libgmp as string="/usr/lib/x86_64-linux-gnu/libgmp.so.10"
	'wandbox/yukicoder
	'const libgmp as string="/usr/lib64/libgmp.so.10"
	'AOJ
	'const libgmp as string="/usr/lib64/libgmp.so.3"

	<DllImport("msvcrt",CallingConvention:=CallingConvention.Cdecl)>shared function write(x as integer,y as string,z as integer) as integer
	end function
	<DllImport("msvcrt",CallingConvention:=CallingConvention.Cdecl)>shared function fopen(x as string,y as string) as IntPtr
	end function
	<DllImport("msvcrt",CallingConvention:=CallingConvention.Cdecl)>shared function fflush(x as IntPtr) as integer
	end function
	<DllImport("msvcrt",CallingConvention:=CallingConvention.Cdecl)>shared function puts(x as string) as integer
	end function
	<DllImport("msvcrt",CallingConvention:=CallingConvention.Cdecl)>shared function system(x as string) as integer
	end function

<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_init(a as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_clear(a as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_out_str(a as IntPtr,b as integer,c as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_set(a as IntPtr,b as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_set_str(a as IntPtr,b as string,c as integer)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_set_si(a as IntPtr,b as long)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared function __gmpz_cmp_si(a as IntPtr,b as long) as integer
end function
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared function __gmpz_get_si(a as IntPtr) as long
end function
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_abs(a as IntPtr,b as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_add(a as IntPtr,b as IntPtr,c as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_add_ui(a as IntPtr,b as IntPtr,c as long)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_mul(a as IntPtr,b as IntPtr,c as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_mul_si(a as IntPtr,b as IntPtr,c as long)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_mul_ui(a as IntPtr,b as IntPtr,c as long)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_sub(a as IntPtr,b as IntPtr,c as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_sub_ui(a as IntPtr,b as IntPtr,c as long)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_ui_sub(a as IntPtr,b as long,c as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_tdiv_q(a as IntPtr,b as IntPtr,c as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_tdiv_r(a as IntPtr,b as IntPtr,c as IntPtr)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_tdiv_q_ui(a as IntPtr,b as IntPtr,c as long)
end sub
<DllImport(libgmp,CallingConvention:=CallingConvention.Cdecl)>shared sub __gmpz_tdiv_r_ui(a as IntPtr,b as IntPtr,c as long)
end sub

	sub mul(a1 as IntPtr,b1 as IntPtr,c1 as IntPtr,d1 as IntPtr,a2 as IntPtr,b2 as IntPtr,c2 as IntPtr,d2 as IntPtr)
		dim a0 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(a0)
		dim b0 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(b0)
		dim c0 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(c0)
		dim d0 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(d0)
		dim t as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(t)
		dim u as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(u)

		__gmpz_mul(t,a1,a2)
		__gmpz_mul(u,b1,c2)
		__gmpz_add(a0,t,u)
		__gmpz_mul(t,a1,b2)
		__gmpz_mul(u,b1,d2)
		__gmpz_add(b0,t,u)
		__gmpz_mul(t,c1,a2)
		__gmpz_mul(u,d1,c2)
		__gmpz_add(c0,t,u)
		__gmpz_mul(t,c1,b2)
		__gmpz_mul(u,d1,d2)
		__gmpz_add(d0,t,u)

		__gmpz_set(a1,a0)
		__gmpz_set(b1,b0)
		__gmpz_set(c1,c0)
		__gmpz_set(d1,d0)

		__gmpz_clear(a0):Marshal.FreeHGlobal(a0)
		__gmpz_clear(b0):Marshal.FreeHGlobal(b0)
		__gmpz_clear(c0):Marshal.FreeHGlobal(c0)
		__gmpz_clear(d0):Marshal.FreeHGlobal(d0)
		__gmpz_clear(t):Marshal.FreeHGlobal(t)
		__gmpz_clear(u):Marshal.FreeHGlobal(u)
	end sub

	sub Main()
		dim stdout as IntPtr=fopen("/dev/stdout","w")

		dim a1 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(a1)
		dim b1 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(b1)
		dim c1 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(c1)
		dim d1 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(d1)
		dim a2 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(a2)
		dim b2 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(b2)
		dim c2 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(c2)
		dim d2 as IntPtr=Marshal.AllocHGlobal(bufsiz):__gmpz_init(d2)

		__gmpz_set_si(a1,1)
		__gmpz_set_si(b1,0)
		__gmpz_set_si(c1,0)
		__gmpz_set_si(d1,1)
		__gmpz_set_si(a2,1)
		__gmpz_set_si(b2,1)
		__gmpz_set_si(c2,1)
		__gmpz_set_si(d2,0)

		dim N as integer=int(Console.ReadLine())
		N=((N+3)\2)*2
		while N>0
			if (N mod 2)>0
				mul(a1,b1,c1,d1,a2,b2,c2,d2)
			end if
			mul(a2,b2,c2,d2,a2,b2,c2,d2)
			N\=2
		end while
		__gmpz_sub_ui(c1,c1,1)
		__gmpz_out_str(stdout,10,c1)
		fflush(stdout)
		puts("")
		fflush(stdout)

		__gmpz_clear(a1):Marshal.FreeHGlobal(a1)
		__gmpz_clear(b1):Marshal.FreeHGlobal(b1)
		__gmpz_clear(c1):Marshal.FreeHGlobal(c1)
		__gmpz_clear(d1):Marshal.FreeHGlobal(d1)
		__gmpz_clear(a2):Marshal.FreeHGlobal(a2)
		__gmpz_clear(b2):Marshal.FreeHGlobal(b2)
		__gmpz_clear(c2):Marshal.FreeHGlobal(c2)
		__gmpz_clear(d2):Marshal.FreeHGlobal(d2)
	end sub
end module