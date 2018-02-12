#!/usr/bin/env ruby

#CodeIQではnokogiriは使えないのでXMLパーサで妥協する
#ただしnokogiri移行をなるべく容易にするため、MultiSAXを使う

# MultiSAX: Ruby Gem to handle multiple SAX libraries
# https://github.com/cielavenir/multisax
module MultiSAX # minimal version
	class SAX
		@parser=nil
		def open(*list)
			list=[:libxml,:rexmlstream] if list.size==0
			list.each{|e_module|
				case e_module
					when :libxml
						begin
							require 'rubygems'
							require 'libxml'
						rescue LoadError;next end
						@parser=e_module;break
					when :rexmlstream
						require 'rexml/document'
						require 'rexml/parsers/streamparser'
						require 'rexml/streamlistener'
						@parser=e_module;break
				end
			}
			@parser
		end
		def reset() @parser=nil;@saxmodule=nil end

		def parse(source,listener)
			open if !@parser
			case @parser
				when :libxml
					listener.instance_eval{
						extend LibXML::XML::SaxParser::Callbacks
						alias :on_start_element :sax_tag_start
						alias :on_end_element :sax_tag_end
						alias :on_cdata_block :sax_cdata
						alias :on_characters :sax_text
						alias :on_comment :sax_comment
					}
				when :rexmlstream
					listener.instance_eval{
						extend REXML::StreamListener
						alias :tag_start :sax_tag_start
						alias :tag_end :sax_tag_end
						alias :cdata :sax_cdata
						alias :text :sax_text
						alias :comment :sax_comment
					}
			end

			if source.is_a?(String)
				case @parser
					when :libxml       then parser=LibXML::XML::SaxParser.string(source);parser.callbacks=listener;parser.parse
					when :rexmlstream  then REXML::Parsers::StreamParser.new(source,listener).parse
				end
			else
				case @parser
					when :libxml       then parser=LibXML::XML::SaxParser.io(source);parser.callbacks=listener;parser.parse
					when :rexmlstream  then REXML::Parsers::StreamParser.new(source,listener).parse
				end
			end
			listener
		end

	end
	Sax=SAX.new

	module Callbacks
		def sax_tag_start(tag,attrs) end
		def sax_tag_end(tag) end
		def sax_comment(text) end
		def sax_cdata(text) end
		def sax_text(text) end
	end
end

listener=MultiSAX::Sax.parse($<.read,Class.new{
	include MultiSAX::Callbacks
	def initialize
		@result=[]
		@content=[]
		@current_tag=[]
	end
	attr_reader :result

	def sax_tag_start(tag,attrs)
		@current_tag.push(tag)
		@result.push(['/'+@current_tag*'/',''.dup]) # dup is Ruby3 compat
		@content.push(@result[-1][1])
	end
	def sax_tag_end(tag)
		if (t=@current_tag.pop)!=tag then raise "xml is malformed /#{t}" end
		@content.pop
	end
	def sax_text(text)
		text.tr!("\n","") #strip!
		if !text.empty?
			#破壊的に追加することで@resultとオブジェクトを共有できる
			@content[-1] << text
		end
	end
}.new)

#このやり方でちゃんとグループ分け出来ているか不明
g=Hash[listener.result.group_by{|k,v|k}.map{|k,v|[k,v.size]}]
ctr=Hash.new 0
listener.result.each{|k,v|
	ctr[k]+=1
	puts '"%s%s","%s"'%[k,g[k]>1 ? '[%d]'%ctr[k] : '',v]
}
