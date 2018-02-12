#!/usr/bin/ruby
$memo={}
def dfs(n,m,q)
    return 0 if n*2<m
    return m==0 ? 1 : 0 if n==0
    $memo[[n,m,q]]||=(q..m).reduce(0){|s,k|s+dfs(n-(k+1)/2,m-k,k)}
end
n,m=gets.split.map &:to_i
p dfs n,m,1
