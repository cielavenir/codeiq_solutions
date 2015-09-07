% ozc -x
functor
import
	Application Open
define
	class TextFile from Open.file Open.text end
	Stdin  = {New TextFile init(name:stdin)}
	Stdout = {New Open.file init(name:stdout)}

	proc {Fib N A B}
		if N>1 then
			{Stdout write(vs:","#B)}
			{Fib (N-1) B (A+B)}
		end
	end

	proc {Main}
		local N in
			N={String.toInt {Stdin getS($)}}
			{Stdout write(vs:0)}
			{Fib N 0 1}
		end
	end

	{Main}
	{Application.exit 0}
end