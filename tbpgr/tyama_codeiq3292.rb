#!/usr/bin/env ruby
require 'json'
a=JSON.parse('['+gets.chomp+']')
if !a[0]||!a[1]||a[4]>=30
	p 0
else
	r=a[4]>=30 ? 0 : a[4]>=20 ? 10 : a[4]>=1 ? 20 : 30
	r+=10 if a[2]
	r+=10 if a[3]
	p r
end
