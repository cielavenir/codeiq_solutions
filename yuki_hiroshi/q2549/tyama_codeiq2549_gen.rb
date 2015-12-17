#!/usr/bin/ruby
require 'stringio'

template={
	C:<<-EOM,
typedef _T_ (*T_FUNC_)(_SIG_);
T_FUNC_ P_FUNC_;
P_FUNC_=(T_FUNC_)GetProcAddress(H,"_FUNC_");
	EOM

	CS:<<-EOM,
[DllImport(library,CallingConvention=CallingConvention.Cdecl)]static extern _T_ _FUNC_(_SIG_);
	EOM

	Nemerle:<<-EOM,
[DllImport(library,CallingConvention=CallingConvention.Cdecl)]static extern _FUNC_(_SIG_):_T_;
	EOM

	VB:<<-EOM,
<DllImport(library,CallingConvention:=CallingConvention.Cdecl)>shared function _FUNC_(_SIG_) as _T_
end function
	EOM

	FS:<<-EOM,
 [<DllImport(library,CallingConvention=CallingConvention.Cdecl)>]extern _T_ _FUNC_(_SIG_)
	EOM
}

type={
	C:->(k){k},
	CS:->(k){
		k=='char*'?'string':['void*','FILE*','mpz_t','mpf_t'].include?(k)?'IntPtr':k.end_with?('*')?'ref '+k[0..-2]:k
	},
	Nemerle:->(k){
		k=='char*'?'string':['void*','FILE*','mpz_t','mpf_t'].include?(k)?'IntPtr':k.end_with?('*')?'ref '+k[0..-2]:k
	},
	VB:->(k){
		k[0,3]='integer' if k.start_with?('int')
		k=='char*'?'string':['void*','FILE*','mpz_t','mpf_t'].include?(k)?'IntPtr':k.end_with?('*')?'ref '+k[0..-2]:k
	},
	FS:->(k){
		k=='char*'?'string':['void*','FILE*','mpz_t','mpf_t'].include?(k)?'IntPtr':k.end_with?('*')?'ref '+k[0..-2]:k
	},
}

signature={
	C:->(a){a*','},
	CS:->(a){a.map.with_index{|e,i|'%s %s'%[type[:CS].(e),(i+97).chr]}*','},
	Nemerle:->(a){a.map.with_index{|e,i|'%s:%s'%[(i+97).chr,type[:Nemerle].(e)]}*','},
	VB:->(a){a.map.with_index{|e,i|'%s as %s'%[(i+97).chr,type[:VB].(e)]}*','},
	FS:->(a){a.map.with_index{|e,i|'%s %s'%[type[:FS].(e),(i+97).chr]}*','},
}

lang=:CS

s=StringIO.new
DATA.each{|e|
	next if e.chomp.empty?
	t,f,*a=e.chomp.split
	s.puts template[lang].gsub('_FUNC_',f).gsub('_T_',t).gsub('_SIG_',signature[lang].(a))
}
if lang==:C
	puts s.string.lines.each_slice(3).map(&:to_a).transpose
else
	puts s.string
end

__END__
void __gmpz_init mpz_t
void __gmpz_clear mpz_t
void __gmpz_out_str FILE* int mpz_t
void __gmpz_set mpz_t mpz_t
void __gmpz_set_str mpz_t char* int
void __gmpz_set_si mpz_t long
int __gmpz_cmp_si mpz_t long
long __gmpz_get_si mpz_t

void __gmpz_abs mpz_t mpz_t
void __gmpz_add mpz_t mpz_t mpz_t
void __gmpz_add_ui mpz_t mpz_t long
void __gmpz_mul mpz_t mpz_t mpz_t
void __gmpz_mul_si mpz_t mpz_t long
void __gmpz_mul_ui mpz_t mpz_t long
void __gmpz_sub mpz_t mpz_t mpz_t
void __gmpz_sub_ui mpz_t mpz_t long
void __gmpz_ui_sub mpz_t long mpz_t
void __gmpz_tdiv_q mpz_t mpz_t mpz_t
void __gmpz_tdiv_r mpz_t mpz_t mpz_t
void __gmpz_tdiv_q_ui mpz_t mpz_t long
void __gmpz_tdiv_r_ui mpz_t mpz_t long