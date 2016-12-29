#!/usr/bin/env ruby
n=gets.to_i
pas=[1]
n.times{pas=[1]+pas.each_cons(2).map{|x,y|x+y}+[1]}
p (2..n-2).reduce(0){|s,i|s+pas[i]*(i-1)*(n-i-1)}

__END__
N<=14の必然性が感じられない(多倍長のことを考慮してもN<=50までは大丈夫)のですが、
ソート問題の高速解が出せなかったのであまり大声では言えないですね…
なお、今回は久々にHaskellの答案を用意しました。
