% ozc -x
functor
import
	Application Open
define
	class TextFile from Open.file Open.text end
	Stdin  = {New TextFile init(name:stdin)}
	Stdout = {New Open.file init(name:stdout)}

	proc {Main2}
		{Stdout write(vs:"ガールフレンドめっちゃほしい！\n")}
	end

	{Main2}
	{Application.exit 0}
end