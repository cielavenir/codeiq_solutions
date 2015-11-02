//usr/bin/env node $0 $@;exit

//IO
//console.log(JSON.stringify(JSON.parse(require('fs').readFileSync('/dev/stdin','utf8')).map(function(e){
//})))
//buf=new Buffer(1e5);console.log(JSON.stringify(JSON.parse(buf.toString(null,0,require('fs').readSync(process.stdin.fd,buf,0,1e5))).map(function(e){
//})))
//process.stdin.resume(),process.stdin.setEncoding("utf8"),process.stdin.on("data",function(q){console.log(JSON.stringify(JSON.parse(q).map(function(e){
//})))})
//p=process;p.stdin.resume(),p.stdin.setEncoding('utf8'),p.stdin.on('data',function(q){console.log(JSON.stringify(JSON.parse(q).map(function(e){
//})))})
//process.stdin.on('data',function(q){console.log(JSON.stringify(JSON.parse(q).map(function(e){
//})))})
//print(readline().match(/\w+/g).map(function(e){
//})))

//Logic
//Lv1
//return x=parseInt(e,36),y=(x/674^0),Math.abs((y+(Math.abs(y*674-x)>336))*674-x)
//Lv2
//return Object['c'+'onstructor']('return x=p'+'arseInt("'+e+'",36),y=(x/674^0),Math.abs((y+(Math.abs(y*674-x)>336))*674-x)')()

//Answer
print(readline().match(/\w+/g).map(function(e){
return Object['c'+'onstructor']('return x=p'+'arseInt("'+e+'",36),y=(x/674^0),Math.abs((y+(Math.abs(y*674-x)>336))*674-x)')()
}))