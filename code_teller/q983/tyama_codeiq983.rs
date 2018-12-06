use std::io::BufRead;

fn getline() -> String{
	let mut __ret=String::new();
	std::io::stdin().read_line(&mut __ret).ok();
	return __ret;
}

fn main(){
	let starting:i64=5;
	let bse=10;
	//loop {
	//	let s=getline();
	let stdin = std::io::stdin();
	for line in stdin.lock().lines() {
	match line {
        Ok(s) => {
		let mut n:i64=s.trim().parse().unwrap();
		n+=starting-2;
		let mut digits:i64=1;
		let mut expbase:i64=1;
		let mut x:i64=bse-1;
		while x<=n {
			digits+=1;
			expbase*=bse;
			n-=x;
			x=digits*expbase*(bse-1);
		}
		let mut num:i64=expbase+n/digits;
		let mut d:i64=digits-1-n%digits;
		while d>0 {
			num/=bse;
			d-=1;
		}
		println!("{}",num%bse);
		},
		Err(_) => ()
	}}
}