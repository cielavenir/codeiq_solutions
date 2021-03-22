#!/usr/bin/perl6
sub reverse(@a,$_start,$size){
	my $start=$_start;
	my $end=$start+$size-1;
	loop (;$start < $end;$start++) {
		my $z=@a[$start];@a[$start]=@a[$end];@a[$end]=$z;
		$end--;
	}
}
sub unique_permutation(@a_,$n=elems(@a_)){
	return lazy gather {
		my $siz=elems(@a_);
		if $n < 0 || $siz < $n {last;}
		my @a=sort(@a_);
		my $i=0;
		loop (;;) {
			take @a[0..^$n];
			reverse(@a,$n,$siz-$n);
			loop ($i=$siz-2;$i >= 0;$i--) { if @a[$i] < @a[$i+1] {last;}}
			if $i < 0 {
				#reverse(@a,0,$siz);
				last;
			}
			my $k=$i;
			loop ($i=$siz-1;$i >= $k+1;$i--) { if @a[$k] < @a[$i] {last;}}
			my $l=$i;
			my $z=@a[$k];@a[$k]=@a[$l];@a[$l]=$z;
			reverse(@a,$k+1,$siz-($k+1));
		}
	}
}

my $N=6;
my @e0;
my @f0;
my $i;
my $r=0;
loop ($i=0;$i < $N;$i++) {
	@e0[$i]=@f0[$i]=0;
	@e0[$N+$i]=@f0[$N+$i]=1;
}
for unique_permutation(@e0) -> @e_ {
	for unique_permutation(@f0) -> @f_ {
		my $flg=0;
		my $zero1=0;
		my $zero2=$N;
		my $one1=0;
		my $one2=$N;
		loop ($i=0;$i < $N*2;$i++) {
			if @e_[$i]==0 {$zero1++;}
			if @e_[$i]==1 {$one1++;}
			if @f_[$N*2-1-$i]==0 {$zero2--;}
			if @f_[$N*2-1-$i]==1 {$one2--;}
			if $zero1==$zero2 {$flg++;}
			if $one1==$one2 {$flg++;}
		}
		if $flg>=2 {$r++;}
	}
}
say $r;
