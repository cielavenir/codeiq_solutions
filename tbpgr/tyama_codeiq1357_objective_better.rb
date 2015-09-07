#!/usr/bin/ruby

class FizzBuzzApplication
	def initialize
		@specs=[]
	end
	def add_spec(spec)
		@specs<<spec
	end
	alias_method :<<,:add_spec
	def run(range)
		ret=''
		range.each{|i|
			@specs.each{|spec|
				if spec.satisfied?(i)
					ret+=spec.message+"\n"
					break
				end
			} && ret+=i.to_s+"\n"
		}
		ret
	end
end

class FizzBuzzSpecification
	attr_reader :message
	def initialize(arg,message)
		@arg=arg
		@message=message
	end
end

class FizzBuzzSpecificationDiv < FizzBuzzSpecification
	def satisfied?(n)
		n%@arg==0
	end
end

class FizzBuzzSpecificationContains < FizzBuzzSpecification
	def satisfied?(n)
		n.to_s.include?(arg.to_s)
	end
end

app=FizzBuzzApplication.new
app<<FizzBuzzSpecificationDiv.new(15,'FizzBuzz')
app<<FizzBuzzSpecificationDiv.new(3,'Fizz')
app<<FizzBuzzSpecificationDiv.new(5,'Buzz')
puts app.run(1..100)