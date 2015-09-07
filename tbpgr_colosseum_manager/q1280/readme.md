##補足
###末尾ヌル文字について
- 採点は https://github.com/tbpgr/codeiq_q872_checker の文字列を変更したものを使用しているそうです。
- HTMLElement#innerHTMLでは、 **全てのヌル文字は無視されます。**
- よって、プログラム中で余計なヌル文字を出力しても正解になります。
  - 参考：[Restricted Base32記事](https://codeiq.jp/magazine/2014/12/19417/)
  - http://ideone.com/DyQ2kg
- JavaでOutput Limit Exceededを引き起こすのに有効なようです。http://gmk.hatenablog.jp/entry/2015/02/10/125237

###インポート文について
- 以下のプログラム(death9_2.cを整形したもの)において、(A)は **引数付きインポート文** として扱われるので、(A)+(B)の文字数、すなわち2+40=42文字が答案全体の文字数となるようです。
- あくまで(A)の文字数自体はカウントされることに注意が必要です。

```c
i; //(A)
main(){
	//your code goes here
	for(;i<208;)putchar(i%26+(i++%8?97:65)); //(B)
}
```

###Pythonの__future__
- 以前やりとりをしたので、折角この場なので書いておきます。`from __future__ import print_function`は残念ながら **引数付きインポート文** に含まれます。
- `print('A',end='')`としたい場合、「import __future__」をインポート文に指定し、`__future__.__builtins__['print']`を呼び出せばよいです。効率は落ちますが。