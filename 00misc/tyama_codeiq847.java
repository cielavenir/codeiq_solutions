class Main{
	public static void main(String[]args){
///paste below///
		//see http://qiita.com/cielavenir/items/4347fd0c6c69fa60804a
		int[] a=new int[]{0,1,2,3,4,5};
		int revstart,revend;
		int i,t,j;
		for(;;){
			for(j=0;j<a.length;j++)System.out.print(a[j]);
			System.out.println();
			//next_permutation
			for(i=a.length-2;i>=0;i--)if(a[i]<a[i+1])break;
			if(i<0){
				revstart=0;
				revend=a.length-1;
				for(;revstart<revend;revstart++){
					t=a[revstart];a[revstart]=a[revend];a[revend]=t;
					revend--;
				}
				break;
			}
			int k=i;
			for(i=a.length-1;i>=k+1;i--)if(a[k]<a[i])break;
			int l=i;
			t=a[k];a[k]=a[l];a[l]=t;
			revstart=k+1;
			revend=a.length-1;
			for(;revstart<revend;revstart++){
				t=a[revstart];a[revstart]=a[revend];a[revend]=t;
				revend--;
			}
		}
///paste above///
	}
}