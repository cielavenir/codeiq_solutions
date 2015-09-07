% ozc -x
functor
import
	Application Open
define
	class TextFile from Open.file Open.text end
	Stdout = {New Open.file init(name:stdout)}

	proc {F N}
		if N<123 then
			{Stdout write(vs:[N])}
			{F (N+1)}
		end
	end

	{F 65}
	{Application.exit 0}
end