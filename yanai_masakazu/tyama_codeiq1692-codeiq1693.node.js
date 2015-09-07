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
		var arr = ["sss\nsss\nsss", "sun\nuuu\nnus",
			"sun\nnus\nsun", "sns\nuuu\nnsn", "sun\nuuu\nnnn"];
		for (var i = 0; i < 1024; i ++) {
			var s = ""
			for (var j = 0; j < 9; j ++) {
				s += "sun"[rnd() % 3];
			}
			s = s.replace(/(...)(?!$)/g, "$1\n");
			arr.push(s);
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
				var r = 0;

//level1
a=q.replace(/sun|nus/g,'###')
for(b=q,i=3;i--;)b=b.replace(/s([\s\S]{3})u([\s\S]{3})n/,z='#$1#$2#').replace(/n([\s\S]{3})u([\s\S]{3})s/,z)
for(i=11;i--;)r+=a[i]=='#'|b[i]=='#'
//level2
//a=q.replace(RegExp(atob('c3VOfG51cw'),'ig'),'###')
//v=btoa('~{')[2],w=btoa('~~.')[3],x=btoa('~~')[1]
v=atob('c251'),w=v[2],x=v[1],v=v[0]
for(y=atob('KFtcc1xTIF17M30p'),a=b=q,q=RegExp,i=3;i--;)a=a.replace(q(v+w+x+'|'+x+w+v),'###'),b=b.replace(q(v+y+w+y+x),z='#$1#$2#').replace(q(x+y+w+y+v),z)
for(i=11;i--;)r+=a[i]=='#'||b[i]=='#'

				return r;
			})(q[i])
		);
	}
	return arr;
}

console.log(yourCode().join(','))
//MD5  ecba9c9918398f780e5b08ea3ae00bb8
//SHA1 1bbbe893cbdf434c20e94ce5a30da7b2aecd3687