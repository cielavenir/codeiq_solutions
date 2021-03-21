#!/usr/bin/php
<?php
function reverse(&$a,$start,$size){
	$end=$start+$size-1;
	for(;$start<$end;$start++){
		$z=$a[$start];$a[$start]=$a[$end];$a[$end]=$z;
		$end--;
	}
}
function unique_permutation($a,$_n=null){
	$siz=count($a);
	$n=$_n ?? $siz;
	if($n<0||$siz<$n)return;
	$i=0;
	for(;;){
		yield array_slice($a, 0, $n);
		reverse($a,$n,$siz-$n);
		for($i=$siz-2;$i>=0;$i--)if($a[$i]<$a[$i+1])break;
		if($i<0){
			//reverse($a,0,$siz);
			return;
		}
		$k=$i;
		for($i=$siz-1;$i>=$k+1;$i--)if($a[$k]<$a[$i])break;
		$l=$i;
		$z=$a[$k];$a[$k]=$a[$l];$a[$l]=$z;
		reverse($a,$k+1,$siz-($k+1));
	}
}

$N=6;
$e0=array_fill(0,$N*2,0);$f0=array_fill(0,$N*2,0);$i=0;$r=0;
for($i=0;$i<$N;$i++)$e0[$N+$i]=$f0[$N+$i]=1;
$e=array(0);
$f=array(0);
foreach(unique_permutation($e0) as $e_){
	for($i=0;$i<$N*2;$i++)$e[$i+1]=$e[$i]+$e0[$i];
	foreach(unique_permutation($f0) as $f_){
		$flg=0;
		$zero1=0;
		$zero2=$N;
		$one1=0;
		$one2=$N;
		for($i=0;$i<$N*2;$i++){
			if($e_[$i]==0)$zero1++;
			if($e_[$i]==1)$one1++;
			if($f_[$N*2-1-$i]==0)$zero2--;
			if($f_[$N*2-1-$i]==1)$one2--;
			if($zero1==$zero2)$flg++;
			if($one1==$one2)$flg++;
		}
		if($flg>=2)$r++;
	}
}
echo $r.PHP_EOL;
?>
