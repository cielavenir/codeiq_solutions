% ozc -x
functor
import
	Application Open
define
	class TextFile from Open.file Open.text end
	Stdin  = {New TextFile init(name:stdin)}
	Stdout = {New Open.file init(name:stdout)}

	fun {Calc R I N}
		local X in
			X=N-(I*(I-1) div 2)
			if X>=I then
				if X mod I==0 then
					{Calc (R+(X div I)) (I+1) N}
				else
					{Calc R (I+1) N}
				end
			else
				R
			end
		end
	end

	proc {Main2}
		case {Stdin getS($)} of false then
			skip
		elseof S then
			local N in
				N={String.toInt S}
				if N>0 then
					{Stdout write(vs:{Calc 0 2 N}#"\n")}
					{Main2}
				end
			end
		end
	end

	{Main2}
	{Application.exit 0}
end