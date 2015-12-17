//usr/bin/env go run $0 $@;exit
package main

import (
	"fmt";
	"math/big"
)

func mul(a1 *big.Int,b1 *big.Int,c1 *big.Int,d1 *big.Int,a2 *big.Int,b2 *big.Int,c2 *big.Int,d2 *big.Int){
	var a0,b0,c0,d0,t,u big.Int
	t.Mul(a1,a2)
	u.Mul(b1,c2)
	a0.Add(&t,&u)
	t.Mul(a1,b2)
	u.Mul(b1,d2)
	b0.Add(&t,&u)
	t.Mul(c1,a2)
	u.Mul(d1,c2)
	c0.Add(&t,&u)
	t.Mul(c1,b2)
	u.Mul(d1,d2)
	d0.Add(&t,&u)

	a1.Set(&a0)
	b1.Set(&b0)
	c1.Set(&c0)
	d1.Set(&d0)
}

func main(){
	var a1,b1,c1,d1,a2,b2,c2,d2 big.Int
	a1.SetInt64(1)
	b1.SetInt64(0)
	c1.SetInt64(0)
	d1.SetInt64(1)
	a2.SetInt64(1)
	b2.SetInt64(1)
	c2.SetInt64(1)
	d2.SetInt64(0)

	var N int
	fmt.Scanf("%d",&N)
	N=(N+3)/2*2
	for ;N>0;N>>=1 {
		if N%2==1 {mul(&a1,&b1,&c1,&d1,&a2,&b2,&c2,&d2)}
		mul(&a2,&b2,&c2,&d2,&a2,&b2,&c2,&d2)
	}
	d1.SetInt64(1)
	c1.Sub(&c1,&d1);
	fmt.Println(c1.String())
}