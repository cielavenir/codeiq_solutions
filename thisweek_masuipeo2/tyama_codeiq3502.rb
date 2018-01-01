#!/usr/bin/ruby
def naive_check(n,k)
    [*1...n].combination(k-1).any?{|a|
        a=[0]+a
        h={}
        a.combination(2){|x,y|h[(x-y)%n]=h[y-x]=1}
        h.size==n-1
    }
end
n=gets.to_i
(p 1;exit) if n==1
p (2..1/0.0).find{|i|naive_check(n,i)}