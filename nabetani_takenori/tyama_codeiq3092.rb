#!/usr/bin/env ruby
#いろいろ判定さぼってるので、極大極小を両方とも持つグラフには対応不可
a,b,c,x,y=gets.split.map(&:to_i)
o=->f{f}
raise if a==0
if a<0
	a=-a;b=-b;c=-c;y=-y-1
	o=->f{f.to_s.tr('LlUuS','UuLlS')}
end
f=Proc.new{|x,y|a*x**2+b*x+c}
mx=-b/2.0/a
my=f.(mx)
r=[[x,y],[x+1,y],[x,y+1],[x+1,y+1]].map{|x,y|f.(x)<=>y}

#4点が全て放物線の下にある場合は特殊ケース
if r.all?{|e|e>=0} && x<=mx&&mx<=x+1
	if my<y+1
		puts o.('S');exit
	elsif my==y+1
		puts o.('l');exit
	end
end

puts o.(r.all?{|e|e>0} ? :L : r.all?{|e|e>=0} ? :l : r.all?{|e|e<0} ? :U : r.all?{|e|e<=0} ? :u : :S)
