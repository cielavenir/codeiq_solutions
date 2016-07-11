// cpp_rational (C) by @cielavenir under 2-clause BSDL.

static inline long long gcd2(long long x,long long y){return y?gcd2(y,x%y):x;}
static inline long long gcd(long long x,long long y){
	if(x<0)x=-x;
	if(y<0)y=-y;
	return gcd2(x,y);
}
static inline long long lcm(long long x,long long y){return y/gcd(x,y)*x;}

#ifdef BOOST
#include <boost/rational.hpp>
typedef boost::rational<long long> RLL;
#else
#include <ostream>
template<typename I>
class rational{
	I num,den;
public:
	rational(I _num=0,I _den=1){assign(_num,_den);}
	rational& operator=(I n){return assign(n,1);}
	rational& assign(I n,I d){
		if(n==0){
			d=1;
		}else{
			I g=gcd(n,d);
			n/=g;
			d/=g;
			if(d<0){
				n=-n;
				d=-d;
			}
		}
		num=n;
		den=d;
		return *this;
	}

	//utility
	I numerator() const{return num;}
	I denominator() const{return den;}
	rational reverse() const{return rational(den,num);}

	//arithmetic
	//To avoid license issue, we use ruby/rational.c implementation.
	rational& operator+=(const rational<I> &other){
		I g=gcd(den,other.den);
		I a=other.den/g*num;
		I b=den/g*other.num;
		I c=a+b;
		b=den/g;
		g=gcd(c,g);
		num=c/g;
		den=other.den/g*b;
		return *this;
	}
	rational& operator-=(const rational<I> &other){return *this+=-other;}
	rational& operator*=(const rational<I> &other){
		I g1=gcd(num,other.den);
		I g2=gcd(den,other.num);
		num=(num/g1)*(other.num/g2);
		den=(den/g2)*(other.den/g1);
		return *this;
	}
	rational& operator/=(const rational<I> &other){return *this*=other.reverse();}

	//arithmetic with copy
	rational operator+(const rational<I> &other) const{return rational(*this)+=other;}
	rational operator-(const rational<I> &other) const{return rational(*this)-=other;}
	rational operator*(const rational<I> &other) const{return rational(*this)*=other;}
	rational operator/(const rational<I> &other) const{return rational(*this)/=other;}

	//unary
	rational& operator++(){num+=den;return *this;}
	rational& operator--(){num-=den;return *this;}
	operator bool() const{return !!num;}
	bool operator!() const{return !num;}
	rational operator+() const{return *this;}
	rational operator-() const{return rational(-num,den);}

	//comparison
	bool operator==(const rational<I> &other) const{return num==other.num&&den==other.den;}
	bool operator!=(const rational<I> &other) const{return num!=other.num||den!=other.den;}
	bool operator<(const rational<I> &other) const{return num*other.den<other.num*den;}
	bool operator>(const rational<I> &other) const{return num*other.den>other.num*den;}
	bool operator<=(const rational<I> &other) const{return num*other.den<=other.num*den;}
	bool operator>=(const rational<I> &other) const{return num*other.den>=other.num*den;}
};
namespace std{
	//cpp_inspect compat
	template<typename I>
	ostream& operator<<(ostream& out,const rational<I> &r){
		return out<<r.numerator()<<"/"<<r.denominator();
	}
}
template<typename I>
rational<I> abs(const rational<I> &r){
	if(r.numerator()>=0)return r;
	return rational<I>(-r.numerator(),r.denominator());
}
template<typename T,typename I>
T rational_cast(const rational<I> &r){
	return static_cast<T>(r.numerator())/static_cast<T>(r.denominator());
}
typedef rational<long long> RLL;
#endif

// cpp_range (generic range class, very small equivalent of boost::irange)
// (C) @cielavenir under Boost Software License.
// note: end position is exclusive.

#ifdef BOOST
#include <boost/range.hpp>
#define make_range boost::irange
#else
#include <iterator>
template<typename T>
class range{
public:
	struct iterator{
		const T a,b;
		T p;
		const long long d; //because T might be unsigned.
		iterator(T _a,T _b,T _p,long long _d=1):a(_a),b(_b),p(_p),d(_d){}

	public:
		typedef T value_type;
		typedef T& reference;
		typedef T* pointer;
		typedef std::ptrdiff_t difference_type;
		typedef std::random_access_iterator_tag iterator_category;

		//copy
		iterator(const iterator &other):a(other.a),b(other.b),p(other.p),d(other.d){}
		iterator& operator=(const iterator &other){
			if(a==other.a && b==other.b && d==other.d)p=other.p;
			return *this;
		}

		//advance
		iterator& operator+=(T n){p+=n*d;return *this;}
		iterator& operator-=(T n){return *this+=(-n);}
		iterator& operator++(){return *this+=1;}
		iterator& operator--(){return *this-=1;}
		iterator operator+(T n) const{return iterator(a,b,p+n*d);}
		iterator operator-(T n) const{return *this+(-n);}

		//difference
		T operator-(const iterator& other) const{return p-other.p;}

		//equality
		bool operator==(const iterator& other) const{return a==other.a && b==other.b && d==other.d && p==other.p;}
		bool operator!=(const iterator& other) const{return !(*this==other);}

		//compare
		bool operator<(const iterator& other) const{return a==other.a && b==other.b && d==other.d && p*d<other.p*d;}
		bool operator>(const iterator& other) const{return a==other.a && b==other.b && d==other.d && p*d>other.p*d;}

		//reference
		const T& operator*() const{return p;}
	};

private:
	const T a,b;
	T siz;
	long long d;
public:
	range(T _a,T _b,long long _d=1):a(_a),b(_b){
		d=_d;
		if(d==0)d=1; //
		siz=( (d>0?(b-a):(a-b)) - 1)  / (d>0?d:-d);
	}

	T operator[](T n){return a+n*d;}
	iterator begin(){return iterator(a,a+d*siz,a,d);}
	iterator end(){return iterator(a,a+d*siz,a+d*(siz+1),d);}
	iterator rbegin(){return iterator(b-d*siz,b,b,-1*d);}
	iterator rend(){return iterator(b-d*siz,b,b-d*(siz+1),-1*d);}
	T size(){return siz+1;}
};
template<typename T>
range<T> make_range(T a,T b,long long d=1){return range<T>(a,b,d);}
#endif

#include <algorithm>
#include <cstdio>
int main(){
	int N;
	scanf("%d",&N);
	range<int> r=make_range(1,N+1);
	printf("%d\n",*std::min_element(r.begin(),r.end(),[&](const int &i,const int &j)->bool{
		return (RLL(N,N-i+1)-RLL(i+N+2,2) < RLL(N,N-j+1)-RLL(j+N+2,2));
	}));
}