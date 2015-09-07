#!/usr/bin/php
<?php

$N=10;
$F=array(3,5,7,11,13,17,19,23,29,31);
function solve($ma){
	global $N,$F;
	$i=1;
	$j;
	$n;
	$r=0;
	for(;$i<1<<$N;$i++){
		$n=0;
		$divisor=1;
		for($n=$j=0;$j<$N;$j++)if($i&(1<<$j)){$n++;$divisor*=$F[$j];}
		$items=$ma/$divisor^0;
		$r+=(($n%2*2-1)*($items*($items+1)/2)*$divisor);
	}
	return $r;
}
echo solve(100000).PHP_EOL;
echo solve(1000000000).PHP_EOL;