using System;
using System.Linq;
using System.Collections.Generic;

class CodeIQInfiniteProductCS{
	static IEnumerable<List<T>> infinite_product_process<T>(List<IEnumerable<T>> iters,List<T> result,int cnt,int d){
		IEnumerator<T> enums_d=iters[d].GetEnumerator();
		for(int i=0;i<cnt+1;i++){
			if(enums_d.MoveNext()){
				result.Add(enums_d.Current);
				if(d<iters.Count-1){
					foreach(var e in infinite_product_process(iters,result,cnt-i,d+1))yield return e;
				}else if(i==cnt){
					yield return result;
				}
				result.RemoveAt(result.Count-1);
			}else{
				break;
			}
		}
	}

	static IEnumerable<List<T>> infinite_product<T>(List<IEnumerable<T>> iters){
		int cnt=0;
		bool iter_end=false;
		for(;!iter_end;){
			iter_end=true;
			foreach(var e in infinite_product_process(iters,new List<T>(),cnt,0)){
				iter_end=false;
				yield return e;
			}
			cnt+=1;
		}
	}

	//test code
	static IEnumerable<int> primes(){
		for(int i=2;;i++){
			int j=2;
			for(;i%j>0;j++);
			if(j==i)yield return i;
		}
	}
	static IEnumerable<int> nats(){
		for(int i=1;;i++)yield return i;
	}
	static IEnumerable<int> fib(){
		int a=0,b=1;
		for(;;){
			yield return b;
			int c=a+b;
			a=b;
			b=c;
		}
	}

	static bool compare<T>(T[][]a,T[][]b)where T: IComparable<T>{
		if(a.Length!=b.Length)return false;
		for(int i=0;i<a.Length;i++){
			if(a[i].Length!=b[i].Length)return false;
			for(int j=0;j<a[i].Length;j++)
				if(a[i][j].CompareTo(b[i][j])!=0)return false;
		}
		return true;
	}
	static T[][]toJagArray<T>(T[,]a){
		T[][]result=new T[a.GetLength(0)][];
		for(int i=0;i<a.GetLength(0);i++){
			result[i]=new T[a.GetLength(1)];
			for(int j=0;j<a.GetLength(1);j++){
				result[i][j]=a[i,j];
			}
		}
		return result;
	}

	static void Main(){
		bool ok=true;
		{
			var expected=toJagArray(new int[,]{
				{1},{1},{2},{3},{5},{8},{13},{21},{34},{55}
			});
			var result=infinite_product<int>(new List<IEnumerable<int>>{
				fib(),
			}).Take(expected.Length).Select(x=>x.ToArray()).ToArray();
			if(!compare(expected,result)){ok=false;Console.WriteLine("test_fib_only failed");}
		}
		{
			var expected=toJagArray(new int[,]{
				{1,1},
				{1,1},{2,1},
				{1,2},{2,1},{3,1},
				{1,3},{2,2},{3,1},{4,1},
				{1,5},{2,3},{3,2},{4,1},{5,1},
				{1,8},{2,5},{3,3},{4,2},{5,1},{6,1}
			});
			var result=infinite_product<int>(new List<IEnumerable<int>>{
				nats(),
				fib(),
			}).Take(expected.Length).Select(x=>x.ToArray()).ToArray();
			if(!compare(expected,result)){ok=false;Console.WriteLine("test_product_nats_fib failed");}
		}
		{
			var expected=toJagArray(new int[,]{
				{2,1,1},
				{2,1,1},{2,2,1},
				{3,1,1},
				{2,1,2},{2,2,1},{2,3,1},
				{3,1,1},{3,2,1},
				{5,1,1},
				{2,1,3},{2,2,2},{2,3,1},{2,4,1},
				{3,1,2},{3,2,1},{3,3,1},
				{5,1,1},{5,2,1},
				{7,1,1},
				{2,1,5},{2,2,3},{2,3,2},{2,4,1},{2,5,1},
				{3,1,3},{3,2,2},{3,3,1},{3,4,1},
				{5,1,2},{5,2,1},{5,3,1},
				{7,1,1},{7,2,1},
				{11,1,1}
			});
			var result=infinite_product<int>(new List<IEnumerable<int>>{
				primes(),
				nats(),
				fib(),
			}).Take(expected.Length).Select(x=>x.ToArray()).ToArray();
			if(!compare(expected,result)){ok=false;Console.WriteLine("test_product_primes_nats_fib failed");}
		}
		{
			var expected=toJagArray(new int[,]{
				{1,1},
				{1,2},{2,1},
				{1,3},{2,2},{3,1},
				{2,3},{3,2},{4,1},
				{3,3},{4,2},{5,1},
				{4,3},{5,2},{6,1}
			});
			var result=infinite_product<int>(new List<IEnumerable<int>>{
				nats(),
				new int[]{1,2,3},
			}).Take(expected.Length).Select(x=>x.ToArray()).ToArray();
			if(!compare(expected,result)){ok=false;Console.WriteLine("test_product_nats_1_3 failed");}
		}
		{
			var expected=toJagArray(new int[,]{
				{1,1},
				{1,2},{2,1},
				{1,3},{2,2},{3,1},
				{1,4},{2,3},{3,2},
				{1,5},{2,4},{3,3},
				{1,6},{2,5},{3,4}
			});
			var result=infinite_product<int>(new List<IEnumerable<int>>{
				new int[]{1,2,3},
				nats(),
			}).Take(expected.Length).Select(x=>x.ToArray()).ToArray();
			if(!compare(expected,result)){ok=false;Console.WriteLine("test_product_1_3_nats failed");}
		}
		{
			var expected=toJagArray(new int[,]{
				{1,1,1},
				{1,1,2},{1,2,1},{2,1,1},
				{1,2,2},{2,1,2},{2,2,1},
				{2,2,2}
			});
			var result=infinite_product<int>(new List<IEnumerable<int>>{
				new int[]{1,2},
				new int[]{1,2},
				new int[]{1,2},
			}).Select(x=>x.ToArray()).ToArray();
			if(!compare(expected,result)){ok=false;Console.WriteLine("test_product_1_2_x3 failed");}
		}
		{
			var expected=toJagArray(new int[,]{
				{1,1,1,1},
				{1,1,1,2},{1,1,2,1},{1,2,1,1},{2,1,1,1},
				{1,1,2,2},{1,2,1,2},{1,2,2,1},{2,1,1,2},{2,1,2,1},{2,2,1,1},
				{1,2,2,2},{2,1,2,2},{2,2,1,2},{2,2,2,1},
				{2,2,2,2}
			});
			var result=infinite_product<int>(new List<IEnumerable<int>>{
				new int[]{1,2},
				new int[]{1,2},
				new int[]{1,2},
				new int[]{1,2},
			}).Select(x=>x.ToArray()).ToArray();
			if(!compare(expected,result)){ok=false;Console.WriteLine("test_product_1_2_x4 failed");}
		}
		if(ok)Console.WriteLine("all tests done");
	}
}