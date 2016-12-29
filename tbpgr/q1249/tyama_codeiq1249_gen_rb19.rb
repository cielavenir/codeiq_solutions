#!/usr/bin/ruby -rzlib
#code object
stage1=RubyVM::InstructionSequence.compile($<.read).to_a
#encode object
stage2=[Zlib.deflate(Marshal.dump(stage1),9)].pack('m0')
#loader
stage3="%w(fiddle dl zlib).each{|e|require e};class RubyVM::InstructionSequence;fn=Fiddle::Function.new(DL::Handle::DEFAULT['rb_iseq_load'],[Fiddle::TYPE_VOIDP]*3,Fiddle::TYPE_VOIDP);define_singleton_method(:load){|*a|fn.(*a.map(&DL.method(:dlwrap))).to_value}end;RubyVM::InstructionSequence.load(Marshal.load(Zlib.inflate('"+stage2+"'.unpack('m')[0])),nil,nil).eval"
#encode loader
stage4="eval '"+[stage3].pack('m0')+"'.unpack('m')[0]"
puts stage4
