#!/usr/bin/env node

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
		var m = "mother";
		for (var i = 0; i < 256; i ++) {
			var a = [];
			for (var j = 0; j < m.length; j ++) {
				var n = m.split("");
				while(n.length) {
					a.push(n.splice(rnd() % n.length, 1)[0]);
				}
			}
			arr.push(a.join(""));
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
				var r = "";
				//level1
				//z='mother';i=0;for(c of q)r+=c==z[i]?z[i++]:'_'
				//for(c of q)r+=c=='mother'[i^=0]&&++i?c:'_'
				//level2
				//r=Array((a=q.indexOf('m')+1)+~0+1).join('_')+'m'+Array((b=q.indexOf('o',a)+1)+~a+1).join('_')+'o'+Array((c=q.indexOf('t',b)+1)+~b+1).join('_')+'t'+Array((d=q.indexOf('h',c)+1)+~c+1).join('_')+'h'+Array((e=q.indexOf('e',d)+1)+~d+1).join('_')+'e'+Array((f=q.indexOf('r',e)+1)+~e+1).join('_')+'r'+Array(q.length+~f+2).join('_')
				//z='mother';f=function(i,x){return i+~5?Array((y=q.indexOf(z[i],x)+1)+~x+1).join('_')+z[i]+f(i+1,y):Array(q.length+~x+2).join('_')};r=f(0,0)
				//r=(f=function(j){return q[j]?(!q[j].localeCompare('mother'[i])&&++i?q[j]:'_')+f(j+1):''})(i=0)
				//r=(f=function(j){return q[j]?(q[j].match('^'+'mother'[i])&&++i?q[j]:'_')+f(j+1):''})(i=0)
				//(f=function(j){r+=q[j].match('mother%'[i])&&++i?q[j]:'_',q[j+=1]&&f(j)})(i=0)
				q.split(r).map(function(c){r+=c.match('mother%'[i^=0])&&++i?c:'_'})
				//q.split(r).map(function(c){r+=!'mother%'[i^=0].indexOf(c)&&++i?c:'_'})
				//q.split(i=r).map(function(c){r+=c.match('mother%'[+i])&&++i?c:'_'})
				//Array.from(q).map(function(c){r+=c.match('mother%'[i^=0])&&++i?c:'_'})

				return r;
			})(q[i])
		);
	}

	return arr;
}

console.log(yourCode().join(','))
//MD5  219d9dbb7e27e7e7f1740f2f8264723e
//SHA1 c914958ac4de456d6f98d4ba39f7d54a6e082c3b