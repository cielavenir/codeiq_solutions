#!/usr/bin/env julia

function reverse(a,start::Int,size::Int)
	local end_=start+size-1
	while start<end_
		local z=a[start]
		a[start]=a[end_]
		a[end_]=z
		end_-=1
		start+=1
	end
end

function next_permutation(a0,n::Int)
	local ch = Channel{typeof(a0)}(8)
	function _producer()
		if n<0||length(a0)<n
			close(ch)
			return
		end
		local a=a0[:]
		while true
			put!(ch,a[1:n])
			reverse(a,n+1,length(a)-n)
			local i=length(a)-1
			while i>0
				if a[i]<a[i+1]
					break
				end
				i-=1
			end
			if i<=0
				#reverse(a,1,length(a))
				break
			end
			local k=i
			i=length(a)
			while i>=k
				if a[k]<a[i]
					break
				end
				i-=1
			end
			local l=i
			local z=a[k]
			a[k]=a[l]
			a[l]=z
			reverse(a,k+1,length(a)+1-(k+1))
		end
		close(ch)
	end
	@async _producer()
	return ch
end

Base.@ccallable function julia_main(args::Vector{String})::Cint
	local N=6
	local e0=Array{Int}(undef,N*2)
	local f0=Array{Int}(undef,N*2)
	local i=1
	local r=0
	while i<=N
		e0[N+i]=1
		f0[N+i]=1
		i+=1
	end
	sort!(e0)
	sort!(f0)
	local e=Array{Int}(undef,N*2+1)
	local f=Array{Int}(undef,N*2+1)
	for e_ in next_permutation(e0,length(e0))
		for i in 1:N*2
			e[i+1]=e[i]+e_[i]
		end
		for f_ in next_permutation(f0,length(f0))
			i=1
			while i<=N*2
				f[i+1]=f[i]+f_[i]
				if e[i]==f[i]&&e[i+1]==f[i+1]
					break
				end
				i+=1
			end
			if i>N*2
				r+=1
			end
		end
	end
	println(r)
	return 0
end

if get(ENV, "COMPILE_STATIC", "false") == "false"
    julia_main(ARGS)
end
