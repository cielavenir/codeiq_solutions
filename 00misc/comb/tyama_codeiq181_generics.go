// +build go1.18

package comb

type combination[T any] []int
	
func combinationGeneratorGeneric[T any](n int, k int) <- chan combination[T] {
	ch := make(chan combination[T])
	go func(){
		if k<0 {k=0}
		if n<k {n=k} //fixme
		indexes := make([]int,k)
		for i := 0; i < k; i++ {
			indexes[i] = i
		}
		for indexes[0] <= n-k {
			c := make(combination[T],k)
			//c.indexes = make([]int,k)
			for i := 0; i < k; i++ {
				c[i] = indexes[i]
			}
			ch <- c

			var i int
			for i=k-1;i>0&&indexes[i]==n-k+i;i-- {}
			indexes[i]++
			for i=i+1;i<k;i++ {
				indexes[i] = indexes[i-1] + 1
			}
		}
		close(ch)
	}()
	return ch
}

func CombinationGenerator(n int, k int) <- chan combination[string] {
	return combinationGeneratorGeneric[string](n,k)
}

func (comb combination[T]) Index(strs []T,actual *[]T){
	s:=make([]T,len(comb))
	for i:=0;i<len(comb);i++ {
		s[i]=strs[comb[i]]
	}
	*actual=s
}
