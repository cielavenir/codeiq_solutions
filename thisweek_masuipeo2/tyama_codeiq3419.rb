#!/usr/bin/ruby
def f10(a)
	r=0
	a.each_with_index{|e,i|
		r+=e*(10-i)
	}
	r=11-r%11
	r=0 if r==11
	r
end
def f13(a)
	r=0
	a.each_with_index{|e,i|
		r+=e*[1,3][i%2]
	}
	r=10-r%10
	r=0 if r==10
	r
end

if false
	f=[0]*10
	[*0..9].permutation(8){|a|
		x=f10([4]+a)
		y=f13([9,7,8,4]+a)
		f[x]+=1 if x==y
	}
else
	#埋め込んでいいですよね
	f=[18289, 14751, 18271, 14726, 18362, 14549, 18394, 14578, 18358, 14628]
end
p f[gets.to_i]
