//usr/bin/env node $0 $@;exit

function yourCode() {
	// windowおよびそのプロパティのいくつかを自動ノックアウト
	/* @knockoutWindow */

	// 問題生成用関数
	var nst = function(arr, cnt) {
		var resArr = [];
		for (var i = 0; i < arr.length; i ++) {
			if (cnt <= 1) {
				resArr.push([arr[i]]);
			} else {
				var nstArr = nst(arr, cnt - 1);
				for (var j = 0; j < nstArr.length; j ++) {
					resArr.push([arr[i]].concat(nstArr[j]));
				}
			}
		}
		return resArr;
	};

	// 問題
	// [0, 0, 0, 0, 0, 0, 0, 0]
	// [0, 0, 0, 0, 0, 0, 0, 1]
	// ～
	// [2, 2, 2, 2, 2, 2, 2, 1]
	// [2, 2, 2, 2, 2, 2, 2, 2]
	// のような組み合わせの配列
	var q = nst([0, 1, 2], 8);

	// 問題のコード
	var arr = [];
	for (var i = 0; i < q.length; i ++) {
		arr.push(
			(function(f) {
				var $, jQuery, eval;
				var yourCode, q, arr, nst, i;
				arguments.callee = null;

				// 答えを変数「r」に入れて戻す
				var r;
//for(s=i=0;i<f.length;)s+=!(f[i++]-2);
//l=f.length;s=(l-f.sort().indexOf(2))%++l
//s=(f.join().match(/2/g)||[]).length
//s=--(f.join()+2).match(/2/g).length
				//level1
				//r=--(g=f.join('')+2).match(/2/g).length+(g.match(101)?3:g.match(10)?2:g.match('01')?2:g.match(0)?1:0)
				//for(e of['','0','01','10','101'])if((g=f.join('')+2).match(e))r=--g.match(/2/g).length+e.length
				//for(e of['',0,'01',10,101])if((g=f.join('')+2).match(e))r=--g.match(/2/g).length+(''+e).length
				for(e of['',0,'01',10,101])if((g=f.join('')+2).match(e))r=--(g.match(/2/g).join('')+e).length
				//level2
				//r=--(g=f.join('')+2).match(/2/g).length+Math.max.apply(0,[101,10,'01',0].map(function(e){return!!g.match(e)*(''+e).length}))
				//r=--(g=f.join('')+2).match(/2/g).length+Math.max(!!g.match(101)*3,!!g.match(10)*2,!!g.match('01')*2,!!g.match(0))
				//for(e of[r=0,'01',10,101])r=Math.max(!!(g=f.join('')+2).match(e)*(''+e).length,r);r+=--g.match(/2/g).length
				for(e of['',r=0,'01',10,101])r=Math.max(!!(g=f.join('')+2).match(e)*--(g.match(/2/g).join('')+e).length,r)
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
//MD5  0d1abe1765c6fbeda27a84920c8d5302
//SHA1 0d090e5103daeaacbc8012c5b8ef1981b750b884