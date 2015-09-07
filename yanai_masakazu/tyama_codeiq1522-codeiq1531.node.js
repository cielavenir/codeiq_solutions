//usr/bin/env node $0 $@;exit

function yourCode() {
	// windowおよびそのプロパティのいくつかを自動ノックアウト
	/* @knockoutWindow */

	// 疑似乱数
	var rnd = (function() {
		var z = 12345, x = z;
		return function() {
			return (x = (x*z+z)&0x7FFFFFFF) >> 16;
		}
	})();

	// 問題生成
	var q = (function() {
		var arr = [];
		for (var i = 0; i < 1000; i ++) {
			var res = 
				[(rnd() % 3), "+-"[rnd() % 2]
				,(rnd() % 3), "+-"[rnd() % 2]
				,(rnd() % 3), "+-"[rnd() % 2]
				,(rnd() % 3)]

			var r = 1 + (rnd() % (res.length / 2 | 0)) * 2;
			res[r] = "=";

			arr.push(res.join(""));
		}
		return arr;
	})();

	// ★問題のコード
	var arr = [];
	for (var i = 0; i < q.length; i ++) {
		arr.push(
			(function(q) {
				var $, jQuery, yourCode, arr, i;
				arguments.callee = null;

				// 答えを変数「r」に入れて戻す
				var r;
				//level1
				//r=q.split('=');r=eval(r[0])==eval(r[1])^0
				//r=+eval(q.replace('=','=='))
				//level2
				//b=function(s){a=s[0]|0;for(i=2;i<s.length;i+=2)a+=(s[i-1]=='+'?1:-1)*s[i];return a}
				//r=q.split('=');r=b(r[0])==b(r[1])^0
				for(r=q.split('='),j=-1;++j<(i=2);r[j]=a)for(s=r[j],a=s[0]|0;i<s.length;i+=2)a+=(s[i-1]=='+'?1:-1)*s[i];r=r[0]==r[1]^0
				return r;
			})(q[i])
		);
	}

	return arr;
}

if(typeof process!=='undefined'){
	console.log(yourCode().join(','));
}else{
	print(yourCode().join(','));
}
//MD5  432209725e06b9d64b866e50565b6a68
//SHA1 119478e0aabf4630be8b28a9fd95b88b38fd750a