#!/usr/bin/env node

function yourCode() {
	// windowおよびそのプロパティのいくつかを自動ノックアウト
	/* @knockoutWindow */

	// 疑似乱数
	var rnd = (function() {
		var z = 123456789, x = z;
		return function(){return(x=(x*z+z)&0x7FFFFFFF)>>16}
	})();

	// 問題生成
	var q = (function() {
		var arr = [];
		for (var i = 0; i < 1024; i ++) {
			var p = [2, 19, 3, 17, 5, 13, 7, 11];
			var a = [
			 [+p.splice(rnd()%6, 1), +p.splice(rnd()%6, 1)]
			,[+p.splice(rnd()%5, 1), +p.splice(rnd()%5, 1)]
			,[+p.splice(rnd()%4, 1), +p.splice(rnd()%3, 1)]
			];
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
				var r = 0;
				//level1
				for(i=m=0;3>i;i++)if(x=q[i][0],y=q[i][1],z=(x>3&y>3)*x/y,z>m)m=z,r=i
				//level2
				//本当は3>=i+1が正しいのだが、tanの誤差により、4>=i+1となってしまう。。
				f=function(y,x){return Math.tan(Math.atan2(y,x))};for(i=m=0;~~f(4,i+1);i++)if(x=q[i][0],y=q[i][1],z=!!(~~f(x,4)*~~f(y,4))*f(x,y),~~f(z,m))m=z,r=i
				
				return r;
			})(q[i])
		);
	}
	return arr;
}

console.log(yourCode().join(','))
//MD5  c96823d2d99e0e676a23073512edbf42
//SHA1 0de853cab8736b63ee9cbfd443e11b212cc02722