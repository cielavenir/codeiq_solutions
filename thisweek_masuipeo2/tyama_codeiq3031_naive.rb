#!/usr/bin/ruby
require 'base64'
class Array
  def unique_permutation(n=self.size)
    return to_enum(:unique_permutation,n) unless block_given?
    return if n<0||self.size<n
    a=self.sort
    yield a[0,n]
    loop{
      a=a[0,n]+a[n..-1].reverse
      k=(a.size-2).downto(0).find{|i|a[i]<a[i+1]}
      break if !k
      l=(a.size-1).downto(k+1).find{|i|a[k]<a[i]}
      a[k],a[l]=a[l],a[k]
      a=a[0,k+1]+a[k+1..-1].reverse
      yield a[0,n]
    }
  end
end

#naive-2
HEAD_TO_TAIL={
'A'=>'P',
'B'=>'P',
'C'=>'P',
'D'=>'Q',
'E'=>'Q',
'F'=>'Q',
'G'=>'Q',
'H'=>'R',
'I'=>'R',
'J'=>'R',
'K'=>'R',
'L'=>'S',
'M'=>'S',
'N'=>'S',
'O'=>'S',
'P'=>'T',
'Q'=>'T',
'R'=>'T',
'S'=>'T',
'T'=>'U',
#'U'=>'U',
'V'=>'U',
'W'=>'U',
'X'=>'V',
'Y'=>'V',
'Z'=>'V',
'a'=>'X',
'b'=>'X',
'c'=>'X',
'd'=>'Y',
'e'=>'Y',
'f'=>'Y',
'g'=>'Y',
'h'=>'Z',
'i'=>'Z',
'j'=>'Z',
'k'=>'Z',
}

T=[*'A'..'Z',*'a'..'z']
N=gets.to_i
#A={1=>1,2=>2,3=>127}
r=0
HEAD_TO_TAIL.each{|k,v|
	(T-[k,v]).combination(N-2){|a0|
		(a0+[k,v]).repeated_combination(2*N){|a1|
			(a0+a1).unique_permutation{|a2|
				a=[k]+a2+[v]
				b=a.join
				s=Base64.strict_encode64(b)
				if s==s.reverse
					puts b
					r+=1
				end
			}
		}
	}
}
(T-['U']).combination(N-1){|a0|
	(a0+['U']).repeated_combination(2*N-1){|a1|
		(a0+a1).unique_permutation{|a2|
			a=['U']+a2+['U']
			b=a.join
			s=Base64.strict_encode64(b)
			if s==s.reverse
				puts b
				r+=1
			end
		}
	}
}
p r

__END__
#naive-1
T.combination(N){|a0|
	a0.repeated_combination(2*N){|a1|
		(a0+a1).unique_permutation{|a|
			b=a.join
			s=Base64.strict_encode64(b)
			if s==s.reverse
				#puts b
				r+=1
			end
		}
	}
}
p r

__END__
s.encode.reverse.decode == s
s.encode.reverse == s.encode

__END__
UUU

DQQDQQ
fYYfYY
