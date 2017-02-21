import java.util.*;
class Main{
	static ArrayList<ArrayList<Double>> a;
	static boolean compare(int i,int j){
		double xa=a.get(i).get(0),xb=a.get(i).get(1),xc=a.get(i).get(2);
		double ya=a.get(j).get(0),yb=a.get(j).get(1),yc=a.get(j).get(2);
		// 指数変換 n=z**Math.log(n,z)
		// xb**xc * Math.log(xa) <=> yb**yc * Math.log(ya)
		// xb**xc * Math.log(xa) <=> (xb**Math.log(yb,xb))**yc * Math.log(ya)
		// xb**(xc - Math.log(yb,xb)*yc) <=> Math.log(ya)/Math.log(xa)
		return Math.pow(xb,xc - Math.log(yb)/Math.log(xb)*yc) < Math.log(ya)/Math.log(xa);
	}
	public static void main(String[]args){
		Scanner cin=new Scanner(System.in);
		a=new ArrayList<ArrayList<Double>>();
		for(;cin.hasNext();){
			ArrayList<Double> e=new ArrayList<Double>();
			for(String s:cin.nextLine().split(","))e.add(Double.parseDouble(s));
			a.add(e);
		}
		int result=0;
		for(int i=1;i<a.size();i++)if(compare(result,i))result=i;
		System.out.println(result);
	}
}