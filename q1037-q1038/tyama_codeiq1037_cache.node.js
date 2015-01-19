//usr/bin/env node --harmony $0 $@;exit
var infinite_product=function*(enums){
	var flags=enums.map(function(e){return true;});
	var arr=enums.map(function(e){return [];});
	var cnt=0;
	var iter_end=false;
	for(;!iter_end;){
		iter_end=true;
		for(var i=0;i<enums.length;i++){
			if(flags[i]){
				var f=enums[i].next()
				flags[i]=!f.done;
				if(flags[i])arr[i].push(f.value);
			}
		}
		var it=infinite_product_process(arr,[],cnt,0);
		for(;;){
			var f=it.next();
			if(f.done)break;
			iter_end=false;
			yield f.value;
		}
		cnt++;
	}
}

var infinite_product_process=function*(arr,result,cnt,d){
	if(d==arr.length-1){
		if(0<=cnt&&cnt<arr[d].length)yield result.concat([arr[d][cnt]]);
	}else{
		var l=Math.min(arr[d].length,cnt+1);
		for(var i=0;i<l;i++){
			var it=infinite_product_process(arr,result.concat([arr[d][i]]),cnt-i,d+1);
			for(;;){
				var f=it.next();
				if(f.done)break;
				yield f.value;
			}
		}
	}
}

var primes=function*(){
	for(var i=2;;i++){
		var j=2;
		for(;i%j;j++);
		if(j==i)yield i;
	}
}
var nats=function*(){
	for(var i=1;;i++)yield i;
}
var fib=function*(){
	var a=0;
	var b=1;
	for(;;){
		yield b;
		var c=a+b;
		a=b;
		b=c;
	}
}
var elems=function*(a){
	for(var i=0;i<a.length;i++)yield a[i];
}

var take=function(n,gen){
	var r=[];
	for(var i=0;i<n;i++){
		var f=gen.next();
		if(f.done)break;
		r.push(f.value);
	}
	return r;
}
var to_a=function(gen){
	var r=[];
	for(;;){
		var f=gen.next();
		if(f.done)break;
		r.push(f.value);
	}
	return r;
}

var compare=function(a,b){
	if(a.length!=b.length)return false;
	for(var i=0;i<a.length;i++){
		if(a[i].length!=b[i].length)return false;
		for(var j=0;j<a[i].length;j++)
			if(a[i][j]!=b[i][j])return false;
	}
	return true;
}

if(typeof process!=='undefined'){
	var print=function(x){
		console.log(x);
	}
}

var ok=true;
(function(){
	var expected = [[1], [1], [2], [3], [5], [8], [13], [21], [34], [55]];
	var result = take(expected.length,infinite_product([fib()]));
	if(!compare(expected,result)){ok=false;print("test_fib_only failed");}
})();
(function(){
	var expected = [
		[1, 1],
		[1, 1], [2, 1],
		[1, 2], [2, 1], [3, 1],
		[1, 3], [2, 2], [3, 1], [4, 1],
		[1, 5], [2, 3], [3, 2], [4, 1], [5, 1],
		[1, 8], [2, 5], [3, 3], [4, 2], [5, 1], [6, 1]
	];
	var result = take(expected.length,infinite_product([nats(),fib()]));
	if(!compare(expected,result)){ok=false;print("test_product_nats_fib failed");}
})();
(function(){
	var expected = [
		[2, 1, 1],
		[2, 1, 1], [2, 2, 1],
		[3, 1, 1],
		[2, 1, 2], [2, 2, 1], [2, 3, 1],
		[3, 1, 1], [3, 2, 1],
		[5, 1, 1],
		[2, 1, 3], [2, 2, 2], [2, 3, 1], [2, 4, 1],
		[3, 1, 2], [3, 2, 1], [3, 3, 1],
		[5, 1, 1], [5, 2, 1],
		[7, 1, 1],
		[2, 1, 5], [2, 2, 3], [2, 3, 2], [2, 4, 1], [2, 5, 1],
		[3, 1, 3], [3, 2, 2], [3, 3, 1], [3, 4, 1],
		[5, 1, 2], [5, 2, 1], [5, 3, 1],
		[7, 1, 1], [7, 2, 1],
		[11, 1, 1]
	];
	var result = take(expected.length,infinite_product([primes(),nats(),fib()]));
	if(!compare(expected,result)){ok=false;print("test_product_primes_nats_fib failed");}
})();
(function(){
	var expected = [
		[1, 1],
		[1, 2], [2, 1],
		[1, 3], [2, 2], [3, 1],
		[2, 3], [3, 2], [4, 1],
		[3, 3], [4, 2], [5, 1],
		[4, 3], [5, 2], [6, 1]
	];
	var result = take(expected.length,infinite_product([nats(),elems([1,2,3])]));
	if(!compare(expected,result)){ok=false;print("test_product_nats_1_3 failed");}
})();
(function(){
	var expected = [
		[1, 1],
		[1, 2], [2, 1],
		[1, 3], [2, 2], [3, 1],
		[1, 4], [2, 3], [3, 2],
		[1, 5], [2, 4], [3, 3],
		[1, 6], [2, 5], [3, 4]
	];
	var result = take(expected.length,infinite_product([elems([1,2,3]),nats()]));
	if(!compare(expected,result)){ok=false;print("test_product_1_3_nats failed");}
})();
(function(){
	var expected = [
		[1, 1, 1],
		[1, 1, 2], [1, 2, 1], [2, 1, 1],
		[1, 2, 2], [2, 1, 2], [2, 2, 1],
		[2, 2, 2]
	];
	var result = take(expected.length,infinite_product([elems([1,2]),elems([1,2]),elems([1,2])]));
	if(!compare(expected,result)){ok=false;print("test_product_1_2_x3 failed");}
})();
(function(){
	var expected = [
		[1, 1, 1, 1],
		[1, 1, 1, 2], [1, 1, 2, 1], [1, 2, 1, 1], [2, 1, 1, 1],
		[1, 1, 2, 2], [1, 2, 1, 2], [1, 2, 2, 1], [2, 1, 1, 2], [2, 1, 2, 1], [2, 2, 1, 1],
		[1, 2, 2, 2], [2, 1, 2, 2], [2, 2, 1, 2], [2, 2, 2, 1],
		[2, 2, 2, 2]
	];
	var result = take(expected.length,infinite_product([elems([1,2]),elems([1,2]),elems([1,2]),elems([1,2])]));
	if(!compare(expected,result)){ok=false;print("test_product_1_2_x4 failed");}
})();
if(ok)print("all tests done");