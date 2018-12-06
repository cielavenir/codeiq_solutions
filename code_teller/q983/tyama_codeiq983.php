#!/usr/bin/php
<?php
$starting=5;
$bse=10;
while($s=fgets(STDIN)){
	$n=$s; // cannot intval
	$n+=$starting-2;
	$digits=1;
	$expbase=1;
	$x;
	while(($x=$digits*$expbase*($bse-1))<=$n){
		$n-=$x;
		$digits++;
		$expbase*=$bse;
	}
	$num=$expbase+$n/$digits;
	$d=$digits-1-$n%$digits;
	for(;$d--;){
		$num/=$bse;
	}
	echo $num%$bse.PHP_EOL;
}