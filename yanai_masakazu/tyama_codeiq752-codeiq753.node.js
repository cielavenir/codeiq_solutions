#!/usr/bin/node

function yourCode() {
	// 問題部分
	var arr = [];
	var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9];
	var shuffle = new Shuffle();
	var rnd = new Rnd();
	Shuffle = null; Rnd = null;

	for (var i = 0; i < 1000; i ++) {
		shuffle(nums);
		var a = +nums.slice(0, 3).join("");
		var b = +nums.slice(3, 6).join("");
		var c = Math.pow([a, b][rnd() % 2], 5);
		arr.push(
			//Prerequisite
			//a*a*a*a*a==c?0:1 //16
			//Level1
			//~~(c%10==b%10) //14
			//c%10==b%10|0 //12
			//(c-b)%10<1|0 //12
			//+!((c-b)%10) //12
			//(c-b)%10?0:1 //12
			//(c-a)%10&&1 //11
			//Level2
			//~~((s=new Array(0,b).join())[s.length-1]==(t=new Array(0,c).join())[t.length-1]) //80
			//(s=new Array(0,b).join())[s.length-1]==(t=new Array(0,c).join())[t.length-1]|0 //78
			//(s=b.toFixed())[s.length-1]==(t=c.toFixed())[t.length-1]|0 //58
			//b.toFixed().slice(-1)==c.toFixed().slice(-1)|0 //46
			//RegExp(c.toFixed().slice(-1)).test(b)|0 //39
			//(c-b).toFixed().slice(-1)<1^0 //29
			//(c-b).toFixed().slice(-1)>0^1 //29
			[c-b].join().slice(-1)<1^0 //26
			//name.slice.call(b-c,-1)<1^0 //27 (forbidden)
		);
	}
	return arr;

	// 使用する関数オブジェクトの宣言
	function Rnd() {
		var x = 991*199999*9999991;
		return function() {
			x = (x * 1103515245 + 12345)|0;
			return (x >> 16) & 32767;
		}
	}

	function Shuffle() {
		var rnd = new Rnd();
		return function(arr) {
			for(var i = arr.length - 1; i > 0; i--) {
				var j = rnd() % (i + 1);
				var tmp = arr[i];
				arr[i] = arr[j];
				arr[j] = tmp;
			}
		}
	}
}

console.log(yourCode().join(','));
//MD5  52ac053eafb388812cb84a4a4b1b27ef
//SHA1 7bd1c0a5abc4ed102522ef7d4995396613b330d4