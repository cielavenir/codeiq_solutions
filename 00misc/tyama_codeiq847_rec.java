class Main{
	public static void main(String[]args){
///paste below///
		//ひつじのバー様は再帰解法を欲していらっしゃるようなので、forなしで解いてみました。
		//副作用として、初版と異なり、順列を求めたいリスト中に重複があると、順列中の重複した要素を削ることができません。
		//サイドストーリー良いですね。トリックスター(私はやったことがありませんが)の劇もそうですがシナリオがうまいです>_<
		//ちなみに私は辻リカという人がいるのかと昨日まで思っていました。辻リカバリーの略であることに気がついたのは今日であるぐらいには残念な人だったりします。
		if(args.length==0){//init
			String lst="012345";
			main(new String[]{lst,"",String.valueOf(lst.length()-1)});
		}else if(args[0].length()==0){//print
			System.out.println(args[1]);
		}else{//make
			int i=Integer.parseInt(args[2]);
			if(i>=0){
				main(new String[]{args[0],args[1],String.valueOf(i-1)});
				main(new String[]{args[0].substring(0,i)+args[0].substring(i+1),args[1]+args[0].charAt(i),String.valueOf(args[0].length()-1-1)});
			}
		}
///paste above///
	}
}