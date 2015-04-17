#!/usr/bin/ruby
#coding:utf-8
### primeモジュールを使えば、文字通りやるだけである… ###
### http://ideone.com/gOVcWI ###
require 'prime'

### https://bugs.ruby-lang.org/issues/11007 ###
class Prime
  class PseudoPrimeGenerator
    # see +Enumerator+#with_index.
    def with_index(offset = 0)
      return enum_for(:with_index) unless block_given?
      # if offset == 0, use each_with_index, which is faster because of C implementation.
      return each_with_index(&proc) if offset == 0

      each do |prime|
        yield prime, offset
        offset += 1
      end
    end
  end
end

### 以下、実際の答案 ###
#Q1
f=[3,0,2]
c=1
idx=(3..1/0.0).find{|i|
	f[i]=f[i-3]+f[i-2]
	f[i]%i==0 && (c+=1)==30
}
P=f[idx]
puts 'P = '+P.to_s
#Q2
Q=P.prime_division.max.first
puts 'Q = '+Q.to_s
#Q3
r=0
R=Prime.each.with_index(1){|e,i|
	break r if e>Q
	r+=e if i.prime?
}
puts 'R = '+R.to_s

__END__
【解答】
P = 63088012960224
Q = 120739
R = 72834276
【言語】
Ruby
【コード】