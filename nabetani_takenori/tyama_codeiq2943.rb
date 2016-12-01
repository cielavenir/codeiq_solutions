#!/usr/bin/ruby
def cross(a,b) (a.conj*b).imag end
def dot(a,b) (a.conj*b).real end
def contains(poly,pt)
	f = false
	poly.size.times{|i|
		a=poly[i]-pt
		b=poly[(i+1)%poly.size]-pt
		a,b=b,a if a.imag>b.imag
		if a.imag<=0 && 0<b.imag
			f=!f if cross(a,b)<0
		end
		return 'B' if cross(a,b)==0 && dot(a,b)<=0
	}
	f ? 'A' : 'D'
end

puts gets.split.map{|e|
	poly=e.scan(/\d+,\d+/).map{|f|Complex(*f.split(',').map(&:to_i))}
	pt=poly.pop
	if poly.include?(pt)
		'C'
	else
		contains(poly,pt)
	end
}*''