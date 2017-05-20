#!/usr/bin/ruby
H=Hash.new{|h,k|h[k]=[]}
n,m=gets.split.map(&:to_i)
root=1
roots=[*1..n]
2.upto(n){|i|
	H[i/2]<<i
}
#yield from (Python3の文法)を使いたい…
def preorder(node)
	return to_enum(:preorder,node) if !block_given?
	proc.call(node)
	H[node].each{|e|preorder(e,&proc) if e!=-1}
end
def inorder(node)
	return to_enum(:inorder,node) if !block_given?
	children=H[node]
	inorder(children[0],&proc) if children[0]&&children[0]!=-1
	proc.call(node)
	inorder(children[1],&proc) if children[1]&&children[1]!=-1
end
def postorder(node,&proc)
	return to_enum(:postorder,node) if !block_given?
	H[node].each{|e|postorder(e,&proc) if e!=-1}
	proc.call(node)
end
r=preorder(root).to_a
p r[m-1]
