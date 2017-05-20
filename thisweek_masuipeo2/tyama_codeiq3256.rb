#!/usr/bin/env ruby
$memo={}
def dfs(n,at,bt,a,b)
    return 1 if at==a&&bt==b
    return 0 if at<a||bt<b||((a-b).abs>=2&&(a>=n||b>=n))
    $memo[[a,b]]||=dfs(n,at,bt,a+1,b)+dfs(n,at,bt,a,b+1)
end

n,a,b=gets.split.map &:to_i
p dfs(n,a,b,0,0)
