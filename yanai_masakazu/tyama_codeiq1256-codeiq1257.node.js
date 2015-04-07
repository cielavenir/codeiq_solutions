#!/usr/bin/env node

//ra: Array
//es: escape
//co: encodeURI
function yourCode() {
	var q = [
		 [5, 13, 31]
		,[5, 31, 13]
		,[13, 5, 31]
		,[13, 31, 5]
		,[31, 5, 13]
		,[31, 13, 5]
	];

	// 問題のコード
	var arr = [];
	for (var i = 0; i < q.length; i ++) {
		arr.push(
			(function(a, b, c) {
				var $, jQuery, eval;
				var yourCode, q, arr;
				arguments.callee = null;
				// 答えを変数「r」に入れて戻す
				var r;

				//level1
				//r=a*b*c
				//level2
				m=function(x,y){for(z=i^i,j=~z;++j<x;)z+=y;return z};r=m(a,m(b,c))
				//with(Math)r=imul(a,imul(b,c))

				return r;
			}).apply({}, q[i])
		);
	}
	return arr;
}

console.log(yourCode().join(','));
//MD5  09c6ba21b800865549dcfc824f16b3f0
//SHA1 f4d4447efdd071212ceabcbc175ead8479e20a34