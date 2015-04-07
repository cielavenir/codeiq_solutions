#!/usr/bin/ruby
#coding:utf-8

#多項式乗算
#mul([2,1,1],[1,4,3]) => [2, 9, 11, 7, 3]
#(2+x+x^2)*(1+4x+3x^2) is 2+9x+11x^2+7x^3+3x^4
def add(a,b)
	return [a.size,b.size].max.times.map{|i|(a[i]||0)+(b[i]||0)}
end
def mul(a,b)
	r=[]
	b.size.times{|i|
		r=add(r,[0]*i+a.map{|e|b[i]*e})
	}
	return r
end

def calc(a,t)
	r=0
	a.each_with_index{|e,i|r+=e*t**i}
	return Math.sqrt(r)
end

def interpolate_catmull_rom(p0, p1, p2, p3)
	c1 = (-p0 + 3 * p1 - 3 * p2 + p3) / 2.0
	c2 = (2 * p0 - 5 * p1 + 4 * p2 - p3) / 2.0
	c3 = (-p0 + p2) / 2.0
	c4 = (2 * p1) / 2.0
	#return [c4,c3,c2,c1] #c4+c3*t+c2*t**2+c1*t**3
	return [c3,2*c2,3*c1] #c3+2c2*t+3c1*t**2
end

if __FILE__==$0
	num=1000
	points=$<.map{|e|e.split(',').map(&:to_f)}
	points.pop
	s=0
	points.size.times{|j|
		a=interpolate_catmull_rom(*4.times.map{|i|points[(j+i)%points.size][0]})
		b=interpolate_catmull_rom(*4.times.map{|i|points[(j+i)%points.size][1]})
		c=add(mul(a,a),mul(b,b))
		#s+=integrate(sqrt(c[0]+c[1]*t+c[2]*t**2+c[3]*t**3+c[4]*t**4),t,0,1)
		num.times{|i|
			t1=i*1.0/num
			t2=(i+1)*1.0/num
			#s+=calc(c,t1)/num # rectangular
			#s+=(t2-t1)/2*(calc(c,t1)+calc(c,t2)) #trepezoidal
			s+=(t2-t1)/6*(calc(c,t1)+4*calc(c,(t1+t2)/2)+calc(c,t2)) #simpson
		}
	}
	p s
end

#Ruby 1.8/2.0
#6252.38460294
#http://ideone.com/HdARxN