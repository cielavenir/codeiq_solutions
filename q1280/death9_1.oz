functor
import
	Application Open
define
	class TextFile from Open.file Open.text end
	Stdout = {New Open.file init(name:stdout)}

	proc {F N}
		if N<208 then
			{Stdout write(vs:[97+N mod 26-(8-N mod 8)div 8*32])}
			{F (N+1)}
		end
	end

	{F 0}
	{Application.exit 0}
end