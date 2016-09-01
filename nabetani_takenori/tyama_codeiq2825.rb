#!/usr/bin/ruby

right=[0,1]
22.times{
	num=(right[-1]-right[-2])/2*5
	if (right[-1]-right[-2]).odd?
		num+=right[-1].odd? ? 3 : 2
	end
	right<<right[-1]+num
}
left=right.map{|e|e+1}
right.shift
left.pop
LEVELS=left.zip(right).map{|x,y|Range.new(x,y)}

def getlevel(n)
	r=LEVELS.size.times.find{|i|LEVELS[i].include?(n)}
	raise if !r
	r
end

def getparent(n)
	level=getlevel(n)
	raise if level==0
	leftexcl=LEVELS[level].begin-1
	coora,coorb=(n-leftexcl-1).divmod(5)
	upperlevel_near=LEVELS[level-1].begin+coora*2
	threshold = upperlevel_near.even? ? 1 : 2
	coorb<=threshold ? upperlevel_near : upperlevel_near+1
end

while line=gets
	a=line.chomp.split(',').map(&:to_i)
	if a.include?(1)
		puts '-'
		next
	end
	a=a.map{|e|getparent(e)}
	level=a.map{|e|getlevel(e)}
	minlevel=level.min
	a=a.map.with_index{|e,i|
		#compose getparent() for level[i]-minlevel times
		([method(:getparent)]*(level[i]-minlevel)).reduce(e){|s,f|f[s]}
	}
	while a.any?{|e|e!=a[0]}
		a=a.map{|e|getparent(e)}
	end
	p a[0]
end