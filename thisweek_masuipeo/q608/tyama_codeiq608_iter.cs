using System;
using System.Collections.Generic;
class CodeIQRoute{
	static IEnumerable<List<T>> Permutation<T>(List<T> x,int? _n=null) where T : IComparable<T>{
		int n=_n ?? x.Count;
		if(n<0||x.Count<n)yield break;
		List<T> a=new List<T>(x);
		a.Sort();
		for(;;){
			yield return a.GetRange(0,n);
			int i;
			a.Reverse(n,a.Count-n);
			for(i=a.Count-2;i>=0;i--)if(a[i].CompareTo(a[i+1])<0)break;
			if(i<0){
				//a.Reverse(0,a.Count);
				/*yield*/ break;
			}
			int k=i;
			for(i=a.Count-1;i>=k+1;i--)if(a[k].CompareTo(a[i])<0)break;
			int l=i;
			T z=a[k];a[k]=a[l];a[l]=z;
			a.Reverse(k+1,a.Count-(k+1));
		}
	}
	const int N=6;
	static void Main(){
		int r=0,i;
		List<int>e0=new List<int>(),f0=new List<int>();
		for(i=0;i<N;i++){e0.Add(0);f0.Add(0);}
		for(i=0;i<N;i++){e0.Add(1);f0.Add(1);}
		int[] e=new int[N*2+1];
		int[] f=new int[N*2+1];
		foreach(List<int> _e in Permutation(e0)){
			for(i=0;i<N*2;i++)e[i+1]=e[i]+_e[i];
			foreach(List<int> _f in Permutation(f0)){
				for(i=0;i<N*2;i++){
					f[i+1]=f[i]+_f[i];
					if(e[i]==f[i]&&e[i+1]==f[i+1])break;
				}
				if(i==N*2)r++;
			}
		}
		Console.WriteLine(r);
	}
}
