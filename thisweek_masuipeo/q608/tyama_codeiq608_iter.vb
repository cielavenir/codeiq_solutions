imports System
imports System.Collections.Generic
module CodeIQRoute
	iterator function permutation(of T as IComparable)(ByVal x as List(of T),optional ByVal _n as integer?=Nothing) as IEnumerable(of List(of T))
		dim n as integer=if(_n.HasValue,_n,x.Count)
		if n<0 orelse x.Count<n
			return
		end If
		dim a as List(of T)=new List(of T)(x)
		a.Sort()
		dim i as integer
		while true
			yield a.GetRange(0,n)
			a.Reverse(n,a.Count-n)
			for i=a.Count-2 to 0 step -1
				if a(i).CompareTo(a(i+1))<0
					exit for
				end if
			next
			if i<0
				a.Reverse(0,a.Count)
				return
			end if
			dim k as integer=i
			for i=a.Count-1 to k+1 step -1
				if a(k).CompareTo(a(i))<0
					exit for
				end if
			next
			dim l as integer=i
			dim z as T=a(k):a(k)=a(l):a(l)=z
			a.Reverse(k+1,a.Count-(k+1))
		end while
	end function

	const N=6
	sub Main(ByVal args() as String)
		dim r,i as integer
		dim e0 as List(of integer)=new List(of integer)()
		dim f0 as List(of integer)=new List(of integer)()
		for i=0 to N-1
			e0.Add(0)
			f0.Add(0)
		next
		for i=0 to N-1
			e0.Add(1)
			f0.Add(1)
		next
		dim e as integer()=new integer(N*2){}
		dim f as integer()=new integer(N*2){}
		for each _e as List(of integer) in permutation(e0)
			for i=0 to N*2-1
				e(i+1)=e(i)+_e(i)
			next
			for each _f as List(of integer) in permutation(f0)
				for i=0 to N*2-1
					f(i+1)=f(i)+_f(i)
					if e(i)=f(i) andalso e(i+1)=f(i+1)
						exit for
					end if
				next
				if i=N*2
					r+=1
				end if
			next
		next
		Console.WriteLine(r)
	end sub
end module
