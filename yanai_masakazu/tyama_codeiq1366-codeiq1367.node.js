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

	// 指定回数分のアルファベットを取得
	var alph = function(n) {
		var res = "", c = "abcdefghijklmnopqrstuvwxyz";
		for (;n--;) {
			res += c[rnd() % c.length];
		}
		return res;
	}

	// 問題生成
	var q = (function() {
		var arr = [];
		for (var i = 0; i < 1000; i ++) {
			var r = rnd();
			var s = alph(1 + r % 8);
			switch(rnd() % 4) {
			case 0: arr.push(r % 100); break;	 // 数字
			case 1: arr.push(s); break;		   // 文字列
			case 2: arr.push(s.split("")); break; // 配列
			case 3: arr.push(!(r % 2)); break;	// 真偽
			}
		}
		return arr;
	})();

	// 問題のコード
	var arr = [];
	for (var i = 0; i < q.length; i ++) {
		arr.push(
			(function(q) {
				var $, jQuery, eval, yourCode, arr, i;
				arguments.callee = null;

				// 無名関数の戻り値として答えを戻す
				var r;

				//level1
				//r=q[0]?q.concat(q,q):!!q===q?!q:q*3 //35
				r=q[0]?q.concat(q,q):+q===q?q*3:!q //34
				//level2
				//return q[0]?q.concat(q,q):q.toFixed?q*3:!q //42

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
//MD5  947d17e877fceac33db5bf5b87a4620f
//SHA1 e11c5ef48bda8b6706d9f9cea499736d72775881