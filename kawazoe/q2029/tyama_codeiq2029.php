#!/usr/bin/php
<?php
while($s=fgets(STDIN)){
	$n=$s;
	if($n==0)break;
	$r=0;
	for($i=2;;$i++){
		$x=$n-$i*($i-1)/2;
		if($x<$i)break;
		//32bit PHP requires fmod. what the hell?
		if(fmod($x,$i)==0)$r+=$x/$i;
	}
	echo $r.PHP_EOL;
}