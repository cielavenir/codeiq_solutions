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

function next_permutation(a,n::Int)
	if n<0||length(a)<n
		return false
	end
	reverse(a,n+1,length(a)-n)
	local i=length(a)-1
	while i>0
		if a[i]<a[i+1]
			break
		end
		i-=1
	end
	if i<=0
		reverse(a,1,length(a))
		return false
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
	return true
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
	while true
		while true
			local flg=0
			local zero1=0
			local zero2=N
			local one1=0
			local one2=N
			for i in 1:N*2
				if e0[i]==0
					zero1+=1
				end
				if e0[i]==1
					one1+=1
				end
				if f0[N*2+1-i]==0
					zero2-=1
				end
				if f0[N*2+1-i]==1
					one2-=1
				end
				if zero1==zero2
					flg+=1
				end
				if one1==one2
					flg+=1
				end
			end
			if flg>=2
				r+=1
			end
			if !next_permutation(f0,length(f0))
				break
			end
		end
		if !next_permutation(e0,length(e0))
			break
		end
	end
	println(r)
	return 0
end

if get(ENV, "COMPILE_STATIC", "false") == "false"
    julia_main(ARGS)
end
