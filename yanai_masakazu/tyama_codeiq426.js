//interface:yourCode(string typ, number a, number b) -> number
var res=0;
if (typ == "*") {
	// 掛け算の場合
	for(;b;b>>=1){
		if(b&1)res+=a;
		a+=a;
	}
} else if (typ == "/") {
	// 割り算の場合
	for(;a>=b;){
		var i=0;
		for(;a>=b<<i;i++);
		i--;
		a-=b<<i;
		res|=1<<i;
	}
}
// 結果を戻して終了
return res;