fn reverse<T>(a:&mut[T],start_:usize,size:usize){
	let mut start=start_;
	let mut end=start+size-1;
	while start<end {
		{
			let p1: *mut T = &mut a[start];
			let p2: *mut T = &mut a[end];
			unsafe {p1.swap(p2);}
		}
		end-=1;
		start+=1;
	}
}

fn next_permutation<T: std::cmp::PartialOrd>(a:&mut[T],n:usize)->bool{
	if n<0||a.len()<n {return false}
	reverse(a,n,a.len()-n);
	let mut i=a.len()-2;
	loop {
		if a[i]<a[i+1] {break}
		if i==0 {
			reverse(a,0,a.len());
			return false;
		}
		i-=1;
	}
	let k=i;
	i=a.len()-1;
	while i>=k+1 {
		if a[k]<a[i] {break}
		i-=1;
	}
	let l=i;
	{
		let p1: *mut T = &mut a[k];
		let p2: *mut T = &mut a[l];
		unsafe {p1.swap(p2);}
	}
	reverse(a,k+1,a.len()-(k+1));
	return true;
}

fn main(){
	let N=6;
	let mut e0=vec![0 as i64; N*2];
	let mut f0=vec![0 as i64; N*2];
	let mut i=0;
	let mut r=0;
	while i<N {
		e0[N+i]=1;
		f0[N+i]=1;
		i+=1;
	}
	e0.sort();
	f0.sort();
	let mut e=vec![0 as i64; N*2+1];
	let mut f=vec![0 as i64; N*2+1];
	loop {
		i=0;
		while i<N*2 {
			e[i+1]=e[i]+e0[i];
			i+=1;
		}
		loop {
			i=0;
			while i<N*2 {
				f[i+1]=f[i]+f0[i];
				if e[i]==f[i]&&e[i+1]==f[i+1] {break}
				i+=1;
			}
			if i==N*2 {r+=1;}
			if !next_permutation::<i64>(&mut f0,N*2) {break}
		}
		if !next_permutation::<i64>(&mut e0,N*2) {break}
	}
	println!("{}",r);
}
