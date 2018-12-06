% ozc -x
functor
import
	Application Open
define
	class TextFile from Open.file Open.text end
	Stdin  = {New TextFile init(name:stdin)}
	Stdout = {New Open.file init(name:stdout)}

	fun {Calc2 D Num Bse}
		if D==0 then
			Num mod Bse
		else
			{Calc2 (D-1) (Num div Bse) Bse}
		end
	end
	fun {Calc Digits Expbase Bse X N}
		if X>N then
			{Calc2 (Digits-1-N mod Digits) (Expbase+N div Digits) Bse}
		else
			{Calc (Digits+1) (Expbase*Bse) Bse ((Digits+1)*(Expbase*Bse)*(Bse-1)) (N-X)}
		end
	end

	proc {Main2}
		case {Stdin getS($)} of false then
			skip
		elseof S then
			local N in
				N={String.toInt S}
				{Stdout write(vs:{Calc 1 1 10 9 (N+3)}#"\n")}
				{Main2}
			end
		end
	end

	{Main2}
	{Application.exit 0}
end