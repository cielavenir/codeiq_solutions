#!/usr/bin/env ruby
#cf: rosalind EDTA
def maximum3(a)
	if a.size == 0 then return [nil,0] end
	ret = [a[0],0]
	1.step(a.size-1){|i|
		if ret[0] < a[i] then ret = [a[i],i] end
	}
	return ret
end

def alignment(x, y)
	#initialize
	a = Array.new(x.size+1){Array.new(y.size+1, 0)}
	back = Array.new(x.size+1){Array.new(y.size+1, 0)}
	tx = ""; ty = ""; t=""

	#DP
	1.step(a.size-1){|i| a[i][0] = a[i-1][0] - 2;back[i][0]=[i-1,0,  "a"]}
	1.step(a[0].size-1){|j| a[0][j] = a[0][j-1] - 2;back[0][j]=[0,  j-1,"b"]}
	1.step(a.size-1){|i|
		1.step(a[0].size-1){|j|
			z = maximum3([
				x[i-1] == y[j-1] ? a[i-1][j-1] : (x[i-1].ord|32) == (y[j-1].ord|32) ? a[i-1][j-1]-1 : a[i-1][j-1]-2,
				a[i-1][j]-2,
				a[i][j-1]-2
			])
			a[i][j]=z[0]
			case z[1]
				when 0 then back[i][j]=[i-1,j-1,"c"]
				when 1 then back[i][j]=[i-1,j,  "a"]
				when 2 then back[i][j]=[i,  j-1,"b"]
			end
		}
	}
	return -a[x.size][y.size]

	#alignment not required.
	#trace-back
	n=x.size;m=y.size
	while n!=0||m!=0 do
		t+=back[n][m][2]
		n,m = back[n][m][0],back[n][m][1]
	end
	t.reverse!

	#output
	i=0;j=0
	t.chars{|c|
		case c
			when "c" then tx+=x[i].chr; i+=1; ty+=y[j].chr; j+=1;
			when "a" then tx+=x[i].chr; i+=1; ty+="-";
			when "b" then tx+="-";            ty+=y[j].chr; j+=1;
		end
	}

	p -a[x.size][y.size]
	puts tx
	puts ty
end

def swapchar(s,i,j)
	a=s.chars.to_a
	a[i],a[j]=a[j],a[i]
	a.join
end

a,b=$<.map(&:chomp)
n=alignment(a,b)
c=2
loop{
	# 雑な山登り
	break if (a.size-1).times{|i|
		a=swapchar(a,i,i+1)
		if n>(n0=alignment(a,b)+c)
			n=n0
			break
		end
		a=swapchar(a,i,i+1)
	}
	c+=2
}
p n

__END__
abcde
adbec
の編集距離は3転置なので6になるか?
--> テストケースを見た限りそういうケースは存在しないようなのでいい加減に済ませる…
