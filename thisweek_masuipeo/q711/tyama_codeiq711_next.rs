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
	loop {
		loop {
			let mut flg=0;
			let mut zero1=0;
			let mut zero2=N;
			let mut one1=0;
			let mut one2=N;
			i=0;
			while i<N*2 {
				if e0[i]==0 {zero1 += 1}
				if e0[i]==1 {one1  += 1}
				if f0[i]==0 {zero2 -= 1}
				if f0[i]==1 {one2  -= 1}
				if zero1==zero2 {flg+=1}
				if one1==one2 {flg+=1}
				i+=1
			}
			if flg>=2 {r+=1}
			if !next_permutation::<i64>(&mut f0,N*2) {break}
		}
		if !next_permutation::<i64>(&mut e0,N*2) {break}
	}
	println!("{}",r);
}
