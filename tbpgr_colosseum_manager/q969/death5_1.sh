for i in `seq 1 50`;do
	if [ $((i%15)) -eq 0 ];then
		echo -n 'FIZZBUZZ'
	elif [ $((i%3)) -eq 0 ];then
		echo -n 'fizz'
	elif [ $((i%5)) -eq 0 ];then
		echo -n 'buzz'
	else
		echo -n $i
	fi
done