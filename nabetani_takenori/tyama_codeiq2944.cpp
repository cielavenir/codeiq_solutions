#include <iostream>
#include <string>
#include <complex>
#include <vector>
#include <algorithm>
using namespace std;
typedef long long val_t;
//typedef __int128_t val_t;

// cpp_rational (C) by @cielavenir under 2-clause BSDL.

val_t gcd2(val_t x,val_t y){return y?gcd2(y,x%y):x;}
val_t gcd(val_t x,val_t y){
	if(x<0)x=-x;
	if(y<0)y=-y;
	return gcd2(x,y);
}
val_t lcm(val_t x,val_t y){return y/gcd(x,y)*x;}

#ifdef BOOST
#include <boost/rational.hpp>
typedef boost::rational<val_t> RLL;
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
	return r.numerator()>=0 ? r : -r;
}
template<typename T,typename I>
T rational_cast(const rational<I> &r){
	return static_cast<T>(r.numerator())/static_cast<T>(r.denominator());
}
typedef rational<val_t> RLL;
#endif

typedef RLL number;
typedef complex<number> point;

#if defined(__clang__)
/// complex multiplication is completely broken on clang ///
bool isnan(const RLL&){return false;}
bool isinf(const RLL&){return false;}
RLL copysign(const RLL&x, const RLL&y){
	RLL r=abs(x);
	if(y.numerator()<0)r=-r;
	return r;
}
#endif

/// http://www.prefield.com/algorithm/geometry/convex_intersect.html ///

namespace std {
  bool operator < (const point& a, const point& b) {
    return real(a) != real(b) ? real(a) < real(b) : imag(a) < imag(b);
  }
}
number cross(const point& a, const point& b) {
  return imag(conj(a)*b);
  //return a.real()*b.imag()-a.imag()*b.real();
}
number dot(const point& a, const point& b) {
  return real(conj(a)*b);
  //return a.real()*b.real()+a.imag()*b.imag();
}

typedef vector<point> polygon;

#define curr(P, i) P[i]
#define next(P, i) P[(i+1)%P.size()]
enum { OUT, ON, IN };
int contains(const polygon& P, const point& p) {
  bool in = false;
  for (int i = 0; i < P.size(); ++i) {
    point a = curr(P,i) - p, b = next(P,i) - p;
    if (imag(a) > imag(b)) swap(a, b);
    if (imag(a) <= number(0) && number(0) < imag(b))
      if (cross(a, b) < number(0)) in = !in;
    if (cross(a, b) == number(0) && dot(a, b) <= number(0)) return ON;
  }
  return in ? IN : OUT;
}

bool intersect_1pt(const point& a, const point& b,
                   const point& c, const point& d, point &r) {
  number D =  cross(b - a, d - c);
  if(D==number(0)) return false;
  number t =  cross(c - a, d - c) / D;
  number s = -cross(a - c, b - a) / D;
  r = a + t * (b - a);
  return t>=number(0) && t<=number(1) && s>=number(0) && s<=number(1);
}
polygon convex_intersect(const polygon &P, const polygon &Q) {
  const int n = P.size(), m = Q.size();
  int a = 0, b = 0, aa = 0, ba = 0;
  enum { Pin, Qin, Unknown } in = Unknown;
  polygon R;
  do {
    int a1 = (a+n-1) % n, b1 = (b+m-1) % m;
    number C = cross(P[a] - P[a1], Q[b] - Q[b1]);
    number A = cross(P[a1] - Q[b], P[a] - Q[b]);
    number B = cross(Q[b1] - P[a], Q[b] - P[a]);
    point r;
    if (intersect_1pt(P[a1], P[a], Q[b1], Q[b], r)) {
      if (in == Unknown) aa = ba = 0;
      R.push_back( r );
      in = B > number(0) ? Pin : A > number(0) ? Qin : in;
    }
    if (C == number(0) && B == number(0) && A == number(0)) {
      if (in == Pin) { b = (b + 1) % m; ++ba; }
      else           { a = (a + 1) % m; ++aa; }
    } else if (C >= number(0)) {
      if (A > number(0)) { if (in == Pin) R.push_back(P[a]); a = (a+1)%n; ++aa; }
      else       { if (in == Qin) R.push_back(Q[b]); b = (b+1)%m; ++ba; }
    } else {
      if (B > number(0)) { if (in == Qin) R.push_back(Q[b]); b = (b+1)%m; ++ba; }
      else       { if (in == Pin) R.push_back(P[a]); a = (a+1)%n; ++aa; }
    }
  } while ( (aa < n || ba < m) && aa < 2*n && ba < 2*m );
  if (in == Unknown) {
    if (contains(Q, P[0])) return P;
    if (contains(P, Q[0])) return Q;
  }
  return R;
}

int main(){
	string s;
	for(;cin>>s;){
		vector<long long>v;
		long long x=-1;
		for(auto &e:s){
			if('0'<=e&&e<='9'){
				if(x<0)x=0;
				x=x*10+e-'0';
			}else if(x>=0){
				v.push_back(x);
				x=-1;
			}
		}
		if(v.size()!=12)return 1;
		polygon poly1={
			point(v[0],v[1]),point(v[2],v[3]),point(v[4],v[5])
		},poly2={
			point(v[6],v[7]),point(v[8],v[9]),point(v[10],v[11])
		};
		//poly1/poly2は反時計回りに与えられない可能性がある
		if(cross(poly1[1]-poly1[0],poly1[2]-poly1[0])<number(0)){
			swap(poly1[1],poly1[2]);
		}
		if(cross(poly2[1]-poly2[0],poly2[2]-poly2[0])<number(0)){
			swap(poly2[1],poly2[2]);
		}
		polygon poly3=convex_intersect(poly1,poly2);
		for(int i=poly3.size()-1;i>=0;i--){
			if(poly3[i]==poly3[(i+1)%poly3.size()])poly3.erase(poly3.begin()+i);
		}
		for(int i=poly3.size()-1;i>=0;i--){
			if(cross(
				poly3[(i+poly3.size()-1)%poly3.size()]-poly3[i],
				poly3[(i+1)%poly3.size()]-poly3[i]
			)==number(0))poly3.erase(poly3.begin()+i);
		}

		int n=poly3.size();
		cout<<(n<3?"-":to_string(n));
	}
	cout<<endl;
}