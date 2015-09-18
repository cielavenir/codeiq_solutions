x=134135523,i;
main(){
	for(;i<572;i++){
		putchar((i%26+'a')-((x&(1<<i%27))?0:32));
		if(i>268)x|=1<<16;
		if(i>322)x|=1<<14;
		if(i>484)x|=1<<8;
	}
}

/*
'bbaaabbbabbbbbababbbbbbbbbb'.chars.each_with_index.select{|c,i|c=='b'}.map{|c,i|1<<i}.reduce(:+)
*/