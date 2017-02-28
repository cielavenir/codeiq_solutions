#!/usr/bin/env ruby
def triangle(n) n*-~n/2 end
def solve(m,n)
	if m<=0
		0
	elsif m==1
		1
	elsif m>n-1
		triangle(m)-triangle(n-m-1)
	#elsif m==n-1
	#	triangle(n-1)
	else
		dupes=n-m+1
		(m-1)*dupes+1 + solve(m-dupes,n-dupes)
	end
end
m,n=gets.split.map(&:to_i)
p solve(m,n)

__END__
6 8
||||||
|     |||||
|          |||||
 |    |    |    |||
  |    |    |   |  ||
   |    |    |  |    ||
    |    |    |  | | |
     |    |    |  | | |

5 8
|||||
|    ||||
|        ||||
|            ||||
 |   |   |   |   |
  |   |   |   |  |
   |   |   |   | |
    |   |   |   ||
