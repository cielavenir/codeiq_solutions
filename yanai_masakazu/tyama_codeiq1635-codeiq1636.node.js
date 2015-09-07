#!/usr/bin/env node

function yourCode() {
	// windowおよびそのプロパティのいくつかを自動ノックアウト
	/* @knockoutWindow */

	// 疑似乱数
	var rnd = (function() {
		var z = 12345, x = z;
		return function() {return (x=(x*z+z)&0x7FFFFFFF)>>16}
	})();

	// 問題生成
	var q = (function() {
		var arr = [];
		for (var i = 0; i < 256; i ++) {
			var a = [];
			for (var j = 0; j < 7; j ++) {
				a.push(1 << rnd() % 3);
			}
			a[1 + rnd() % 5] = 0;
			arr.push(a);
		}
		return arr;
	})();

	// ★問題のコード
	var arr = [];
	for (var i = 0; i < q.length; i ++) {
		arr.push(
			(function(q) {
				var $, jQuery, yourCode, arr, i, rnd;
				arguments.callee = null;

				// 答えを変数「r」に入れて戻す
				var r = [];
				//lv1
				//for(i=7;i--;)r[i]=+(q[i]?q[i]>3:q[i-1]+q[i+1]>5)
				//lv2
				for(i=7;i--;)r[i]=[q[i]/4,(q[i-1]+q[i+1])/6][+!q[i]]^0
				return r;
			})(q[i])
		);
	}

	return arr;
}

console.log(yourCode().join(','))
//MD5  5f943b5144b39e99de735b0d0d73d5ce
//SHA1 bac5c653ef15e984e5bfca341964096870959bba