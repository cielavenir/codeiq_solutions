using System;
using System.Runtime.InteropServices;
 
class CodeIQ2812{
	[DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)]static extern int __popcountdi2(long n);
	[DllImport("msvcrt",CallingConvention=CallingConvention.Cdecl)]static extern int __sched_cpucount(int n, long[] a);

	static int popcount(long n){
		//return __popcountdi2(n);
		return __sched_cpucount(8,new long[]{n});
		//return n==0 ? 0 : popcount(n/2)+(int)(n%2);
	}
	static void Main(){
		int n=int.Parse(Console.ReadLine());
		Console.WriteLine(1<<popcount(n));
	}
}