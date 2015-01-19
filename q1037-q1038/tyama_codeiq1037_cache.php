#!/usr/bin/php
<?php
function infinite_product($enums){
	$flags=array_map(function($e){return TRUE;},$enums);
	$arr=array_map(function($e){return [];},$enums);
	$cnt=0;
	$iter_end=FALSE;
	for(;!$iter_end;){
		$iter_end=TRUE;
		for($i=0;$i<count($enums);$i++){
			if($flags[$i]){
				if(!count($arr[$i])){
					//actually not rewinding; the first iteration is rewind() in PHP.
					$enums[$i]->rewind();
				}else{
					$enums[$i]->next();
				}
				$flags[$i]=$enums[$i]->valid();
			}
			if($flags[$i]){
				$arr[$i][]=$enums[$i]->current();
			}
		}
		foreach(infinite_product_process($arr,[],$cnt,0) as $e){
			$iter_end=FALSE;
			yield $e;
		}
		$cnt++;
	}
}

function infinite_product_process($arr,$result,$cnt,$d){
	if($d==count($arr)-1){
		if(0<=$cnt&&$cnt<count($arr[$d]))yield array_merge($result,[$arr[$d][$cnt]]);
	}else{
		$l=min(count($arr[$d]),$cnt+1);
		for($i=0;$i<$l;$i++){
			foreach(infinite_product_process($arr,array_merge($result,[$arr[$d][$i]]),$cnt-$i,$d+1) as $e)yield $e;
		}
	}
}

function primes(){
	for($i=2;;$i++){
		$j=2;
		for(;$i%$j>0;$j++);
		if($j==$i)yield $i;
	}
}
function nats(){
	for($i=1;;$i++)yield $i;
}
function fib(){
	$a=0;
	$b=1;
	for(;;){
		yield $b;
		$c=$a+$b;
		$a=$b;
		$b=$c;
	}
}
function elems($a){
	foreach($a as $e)yield $e;
}

function take($n,$gen){
	$r=[];
	$gen->rewind();
	for($i=0;$i<$n;$i++){
		if(!$gen->valid())break;
		$r[]=$gen->current();
		$gen->next();
	}
	return $r;
}
function to_a($gen){
	$r=[];
	foreach($gen as $e)$r[]=$e;
	return $r;
}

class ProductTest extends PHPUnit_Framework_TestCase{
	public function test_fib_only(){
		$expected = [[1], [1], [2], [3], [5], [8], [13], [21], [34], [55]];
		$result = take(count($expected),infinite_product([fib()]));
		$this->assertEquals($expected,$result);
	}
	public function test_product_nats_fib(){
		$expected = [
			[1, 1],
			[1, 1], [2, 1],
			[1, 2], [2, 1], [3, 1],
			[1, 3], [2, 2], [3, 1], [4, 1],
			[1, 5], [2, 3], [3, 2], [4, 1], [5, 1],
			[1, 8], [2, 5], [3, 3], [4, 2], [5, 1], [6, 1]
		];
		$result = take(count($expected),infinite_product([nats(),fib()]));
		$this->assertEquals($expected,$result);
	}
	public function test_product_primes_nats_fib(){
		$expected = [
			[2, 1, 1],
			[2, 1, 1], [2, 2, 1],
			[3, 1, 1],
			[2, 1, 2], [2, 2, 1], [2, 3, 1],
			[3, 1, 1], [3, 2, 1],
			[5, 1, 1],
			[2, 1, 3], [2, 2, 2], [2, 3, 1], [2, 4, 1],
			[3, 1, 2], [3, 2, 1], [3, 3, 1],
			[5, 1, 1], [5, 2, 1],
			[7, 1, 1],
			[2, 1, 5], [2, 2, 3], [2, 3, 2], [2, 4, 1], [2, 5, 1],
			[3, 1, 3], [3, 2, 2], [3, 3, 1], [3, 4, 1],
			[5, 1, 2], [5, 2, 1], [5, 3, 1],
			[7, 1, 1], [7, 2, 1],
			[11, 1, 1]
		];
		$result = take(count($expected),infinite_product([primes(),nats(),fib()]));
		$this->assertEquals($expected,$result);
	}
	public function test_product_nats_1_3(){
		$expected = [
			[1, 1],
			[1, 2], [2, 1],
			[1, 3], [2, 2], [3, 1],
			[2, 3], [3, 2], [4, 1],
			[3, 3], [4, 2], [5, 1],
			[4, 3], [5, 2], [6, 1]
		];
		$result = take(count($expected),infinite_product([nats(),elems([1,2,3])]));
		$this->assertEquals($expected,$result);
	}
	public function test_product_1_3_nats(){
		$expected = [
			[1, 1],
			[1, 2], [2, 1],
			[1, 3], [2, 2], [3, 1],
			[1, 4], [2, 3], [3, 2],
			[1, 5], [2, 4], [3, 3],
			[1, 6], [2, 5], [3, 4]
		];
		$result = take(count($expected),infinite_product([elems([1,2,3]),nats()]));
		$this->assertEquals($expected,$result);
	}
	public function test_product_1_2_x3(){
		$expected = [
			[1, 1, 1],
			[1, 1, 2], [1, 2, 1], [2, 1, 1],
			[1, 2, 2], [2, 1, 2], [2, 2, 1],
			[2, 2, 2]
		];
		$result = to_a(infinite_product([elems([1,2]),elems([1,2]),elems([1,2])]));
		$this->assertEquals($expected,$result);
	}
	public function test_product_1_2_x4(){
		$expected = [
			[1, 1, 1, 1],
			[1, 1, 1, 2], [1, 1, 2, 1], [1, 2, 1, 1], [2, 1, 1, 1],
			[1, 1, 2, 2], [1, 2, 1, 2], [1, 2, 2, 1], [2, 1, 1, 2], [2, 1, 2, 1], [2, 2, 1, 1],
			[1, 2, 2, 2], [2, 1, 2, 2], [2, 2, 1, 2], [2, 2, 2, 1],
			[2, 2, 2, 2]
		];
		$result = to_a(infinite_product([elems([1,2]),elems([1,2]),elems([1,2]),elems([1,2])]));
		$this->assertEquals($expected,$result);
	}
}