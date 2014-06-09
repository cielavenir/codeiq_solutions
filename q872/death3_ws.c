main(i){
	printf("   \t\n"); //push 1
	for(i=0;i<57;i++)printf(" \n "); //duplicate
	printf("   \t     \t\n"); //push 65
	for(i=0;i<58;i++){
		if(i<57)printf(" \n "); //duplicate
		printf("\t\n  "); //print
		if(i<57)printf("\t   "); //add
	}
	//printf("\n\n\n");
}