#!/usr/bin/env ruby
$memo={}
def dfs(n,k,prev)
	return 1 if n==0
	return 0 if n<0
	$memo[[n,k,prev]]||=[-1,0,1].reduce(0){|s,i|
		#1:山を登る(下った直後に登るのは禁止)
		#0:水平に進む
		#-1:山を下る(接地は禁止)
		#進んだ後高さの数だけの点数(当問題では丸太)を消費するものとする
		#ただし下った場合は消費しない)
		nk=k+i
		if nk==0 || i==1&&prev==-1
			s
		else
			s+dfs(n-(i==-1 ? 0 : nk),nk,i)
		end
	}
end
p dfs(gets.to_i-1,1,0)
__END__
愚直に山を作るよりもカタラン数の考え方に持ち込んだほうが楽ということに気づきました…
