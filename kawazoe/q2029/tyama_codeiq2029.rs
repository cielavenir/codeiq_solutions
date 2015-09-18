use std::io::BufRead;

fn getline() -> String{
	let mut __ret=String::new();
	std::io::stdin().read_line(&mut __ret).ok();
	return __ret;
}

fn main(){
	//loop {
	//	let s=getline();
	let stdin = std::io::stdin();
	for line in stdin.lock().lines() {
	match line {
        Ok(s) => {
		let n:i64=s.trim().parse().unwrap();
		if n>0 {
		let mut r:i64=0;
		let mut i:i64=2;
		loop {
			let x:i64=n-i*(i-1)/2;
			if x<i {break}
			if x%i==0 {r+=x/i}
			i+=1
		}
		println!("{}",r);
		}
		},
		Err(_) => ()
	}}
}