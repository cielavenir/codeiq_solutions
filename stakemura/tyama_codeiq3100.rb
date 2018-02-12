#!/usr/bin/env ruby

=begin
ideoneではHTMLパーサが使えないのでXMLパーサで頑張るしかない。
そしてHTMLパーサが使えたとしてもDOMアクセスAPIは移植性がないのでライブラリごとに特化したコードしか書けない…
特化するならnokogiriとかの方がいいですよね、ってことで
今回はSAXにこだわりました(multisaxを本家にすれば自動でnokogiri等に対応します)が、
実務では全く非推奨な解答です。
=end

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

body=$<.read
body.force_encoding('UTF-8')
body.gsub!(/\<b\>(.*?)\<\/b\>/m,'\1')
body.gsub!(/\<u\>(.*?)\<\/u\>/m,'\1')
body.gsub!(/\<i\>(.*?)\<\/i\>/m,'\1')
body.gsub!(/\<strong\>(.*?)\<\/strong\>/m,'\1')
body.gsub!(/\<del\>(.*?)\<\/del\>/m,'\1')

xml='<table'+body.split('<table').last.split('</table>').first+'</table>'
listener=MultiSAX::Sax.parse(xml,Class.new{
	include MultiSAX::Callbacks
	def initialize
		@content=[]
		@current_tag=[]
		@first=true
		@fold=0
	end
	attr_reader :content, :fold

	def sax_tag_start(tag,attrs)
		@current_tag.push(tag)
	end
	def sax_tag_end(tag)
		if (t=@current_tag.pop)!=tag then raise "xml is malformed /#{t}" end
		@first=false if t=='tr'
	end
	def sax_cdata(text)
	end
	def sax_text(text)
		text.strip!
		if !text.empty?
			@content << text
			@fold+=1 if @first
		end
	end
	def sax_comment(text)
	end
}.new)
puts listener.content.each_slice(listener.fold).map{|e|
	e.map{|f|'"'+f.gsub('&lt;','<').gsub('&gt;','>').gsub('&amp;','&')+'"'}*','
}
