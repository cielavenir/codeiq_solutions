#!/usr/bin/ruby
def comb(n,k)
	return 0 if k<0||n<k
	r=1
	k.times{|i|
		r=r*(n-i)/(i+1)
	}
	r
end
f1={2=>4,3=>5*3}
f2={3=>4,4=>20,5=>72,6=>225}

def f3(n)
	2*comb(n-1,3)*(0..3).reduce(0){|s,i|
		s+comb(n-4,i)
	}
end

n=gets.to_i
s=0
[2,3].product([2,3],[3,4,5,6],[3,4,5,6]).each{|x,y,z,w|
	k=n-x-y-z-w
	#p [x,y,z,w,k] if k>=4
	s += f1[x]*f1[y] * f2[z]*f2[w] * f3(k)
}
p s

__END__
$res=Hash.new 0
def dfs2(n,w,l,r,a)
	if n-r<l-w||n-r<=w-l
		$res[r]+=1
		#w-lが非負なら上位チームの勝利
		#p [w-l,a] if r==6
	else
		dfs2(n,w+1,l,r+1,a+[1])
		dfs2(n,w,l+1,r+1,a+[-1])
		dfs2(n,w,l,r+1,a+[0])
	end
end
#dfs2(3,0,0,0,[])
dfs2(6,1,0,0,[1])
p $res

def dfs3(w,l,r)
	if r==0
		w==4||l==4 ? 1 : 0
	elsif w==4||l==4
		0
	else
		x=0
		x+=dfs3(w+1,l,r-1)
		x+=dfs3(w,l+1,r-1)
		x+=dfs3(w,l,r-1)
		x
	end
end
p dfs3(0,0,10)==f3(10)
