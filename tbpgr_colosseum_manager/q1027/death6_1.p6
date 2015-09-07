print(2);
for 3..999 -> $i {
	$i%2 or next;
	loop (my $j=3;$i%$j;$j+=2){}
	$j==$i&&print(':'~$i)
}