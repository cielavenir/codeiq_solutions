imports System
imports System.Linq
imports System.Collections.Generic

module CodeIQInfiniteProductVB
	iterator function infinite_product_process(of T)(ByVal iters as List(of IEnumerable(of T)),ByVal result as List(of T),ByVal cnt as integer,ByVal d as integer) as IEnumerable(of List(of T))
		dim enums_d as IEnumerator(of T)=iters(d).GetEnumerator()
		for i as integer=0 to cnt
			if enums_d.MoveNext()
				result.Add(enums_d.Current)
				if d<iters.Count-1
					for each e as List(of T) in infinite_product_process(iters,result,cnt-i,d+1)
						yield e
					next
				elseif i=cnt
					yield result
				end if
				result.RemoveAt(result.Count-1)
			else
				exit for
			end if
		next
	end function

	iterator function infinite_product(of T)(ByVal iters as List(of IEnumerable(of T))) as IEnumerable(of List(of T))
		dim cnt as integer=0
		dim iter_end as boolean=false
		while not iter_end
			iter_end=true
			for each e as List(of T) in infinite_product_process(iters,new List(of T),cnt,0)
				iter_end=false
				yield e
			next
			cnt+=1
		end while
	end function

	' test code
	iterator function primes() as IEnumerable(of integer)
		dim i as integer=2
		while true
			dim j as integer=2
			while i mod j>0
				j+=1
			end while
			if j=i
				yield i
			end if
			i+=1
		end while
	end function

	iterator function nats() as IEnumerable(of integer)
		dim i as integer=1
		while true
			yield i
			i+=1
		end while
	end function

	iterator function fib() as IEnumerable(of integer)
		dim a as integer=0
		dim b as integer=1
		while true
			yield b
			dim c as integer=a+b
			a=b
			b=c
		end while
	end function

	function compare(of T as IComparable)(ByVal a as T()(),ByVal b as T()()) as boolean
		if a.Length<>b.Length
			return false
		end if
		for i as integer=0 to a.Length-1

			if a(i).Length<>b(i).Length
				return false
			end if
			for j as integer=0 to a(i).Length-1
				if a(i)(j).CompareTo(b(i)(j))<>0
					return false
				end if
			next
		next
		return true
	end function

	function toJagArray(of T)(ByVal a as T(,)) as T()()
		dim result(a.GetLength(0)-1)() as T
		for i as integer=0 to a.GetLength(0)-1
			redim result(i)(a.GetLength(1)-1)
			for j as integer=0 to a.GetLength(1)-1
				result(i)(j)=a(i,j)
			next
		next
		return result
	end function

	sub Main()
		dim ok as boolean=true
		using nothing
			dim expected=toJagArray(new integer(,){
				{1},{1},{2},{3},{5},{8},{13},{21},{34},{55}
			})
			dim result=infinite_product(of integer)(new List(of IEnumerable(of integer)) from {
				fib()
			}).Take(expected.Length).Select(Function(x) x.ToArray()).ToArray()
			if not compare(expected,result)
				ok=false
				Console.WriteLine("test_fib_only failed")
			end if
		end using
		using nothing
			dim expected=toJagArray(new integer(,){
				{1,1},
				{1,1},{2,1},
				{1,2},{2,1},{3,1},
				{1,3},{2,2},{3,1},{4,1},
				{1,5},{2,3},{3,2},{4,1},{5,1},
				{1,8},{2,5},{3,3},{4,2},{5,1},{6,1}
			})
			dim result=infinite_product(of integer)(new List(of IEnumerable(of integer)) from {
				nats(),
				fib()
			}).Take(expected.Length).Select(Function(x) x.ToArray()).ToArray()
			if not compare(expected,result)
				ok=false
				Console.WriteLine("test_product_nats_fib failed")
			end if
		end using
		using nothing
			dim expected=toJagArray(new integer(,){
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
			})
			dim result=infinite_product(of integer)(new List(of IEnumerable(of integer)) from {
				primes(),
				nats(),
				fib()
			}).Take(expected.Length).Select(Function(x) x.ToArray()).ToArray()
			if not compare(expected,result)
				ok=false
				Console.WriteLine("test_product_primes_nats_fib failed")
			end if
		end using
		using nothing
			dim expected=toJagArray(new integer(,){
				{1,1},
				{1,2},{2,1},
				{1,3},{2,2},{3,1},
				{2,3},{3,2},{4,1},
				{3,3},{4,2},{5,1},
				{4,3},{5,2},{6,1}
			})
			dim result=infinite_product(of integer)(new List(of IEnumerable(of integer)) from {
				nats(),
				new integer(){1,2,3}
			}).Take(expected.Length).Select(Function(x) x.ToArray()).ToArray()
			if not compare(expected,result)
				ok=false
				Console.WriteLine("test_product_nats_1_3 failed")
			end if
		end using
		using nothing
			dim expected=toJagArray(new integer(,){
				{1,1},
				{1,2},{2,1},
				{1,3},{2,2},{3,1},
				{1,4},{2,3},{3,2},
				{1,5},{2,4},{3,3},
				{1,6},{2,5},{3,4}
			})
			dim result=infinite_product(of integer)(new List(of IEnumerable(of integer)) from {
				new integer(){1,2,3},
				nats()
			}).Take(expected.Length).Select(Function(x) x.ToArray()).ToArray()
			if not compare(expected,result)
				ok=false
				Console.WriteLine("test_product_1_3_nats failed")
			end if
		end using
		using nothing
			dim expected=toJagArray(new integer(,){
				{1,1,1},
				{1,1,2},{1,2,1},{2,1,1},
				{1,2,2},{2,1,2},{2,2,1},
				{2,2,2}
			})
			dim result=infinite_product(of integer)(new List(of IEnumerable(of integer)) from {
				new integer(){1,2},
				new integer(){1,2},
				new integer(){1,2}
			}).Select(Function(x) x.ToArray()).ToArray()
			if not compare(expected,result)
				ok=false
				Console.WriteLine("test_product_1_2_x3 failed")
			end if
		end using
		using nothing
			dim expected=toJagArray(new integer(,){
				{1,1,1,1},
				{1,1,1,2},{1,1,2,1},{1,2,1,1},{2,1,1,1},
				{1,1,2,2},{1,2,1,2},{1,2,2,1},{2,1,1,2},{2,1,2,1},{2,2,1,1},
				{1,2,2,2},{2,1,2,2},{2,2,1,2},{2,2,2,1},
				{2,2,2,2}
			})
			dim result=infinite_product(of integer)(new List(of IEnumerable(of integer)) from {
				new integer(){1,2},
				new integer(){1,2},
				new integer(){1,2},
				new integer(){1,2}
			}).Select(Function(x) x.ToArray()).ToArray()
			if not compare(expected,result)
				ok=false
				Console.WriteLine("test_product_1_2_x4 failed")
			end if
		end using
		if ok
			Console.WriteLine("all tests done")
		end if
	end sub
end module