//usr/bin/env node $0 $@;exit
var main=function(){
	var starting=5;
	var bse=10;
	for(;;){
		var n=Number(readline())
		if(!n)break;
		n+=starting-2
		var digits=1
		var expbase=1
		var x=bse-1
		while(x<=n){
			n-=x
			digits+=1
			expbase*=bse
			x=digits*expbase*(bse-1)
		}
		var num=expbase+(n/digits)^0
		var d=digits-1-n%digits
		for(;d--;){
			num=num/bse^0
		}
		print(num%bse)
	}
};

/// IO ///
if(typeof process!=='undefined'){
	//node.js
	var print=function(x){
		console.log(x);
	}
	var readline=(function(){
		var T=[],cnt=0;
		var stdin = process.openStdin();
		stdin.setEncoding('utf8');

		var input_fragment="";
		stdin.on('data', function(input) {
			var ref=(input_fragment+input).split("\n");
			input_fragment=ref.pop();
			for(var i=0;i<ref.length;i++){
				if(ref[i]=='')continue;
				T.push(ref[i]);
			}
		});
		stdin.on('end', function(z) {
			if(input_fragment){
				var ref=(input_fragment+"\n").split("\n");
				input_fragment=ref.pop();
				for(var i=0;i<ref.length;i++){
					if(ref[i]=='')continue;
					T.push(ref[i]);
				}
			}
			main();
		});

		return function(){
			if(T.length<=cnt)return null;
			return T[cnt++];
		};
	})();
}else{
	//v8
	main();
}