#!/usr/bin/ruby
# -*- coding: utf-8 -*-

#工夫した点・苦労した点・感想等（ご自由にお書きください）：
=begin
[1回目]
・そもそも無限リストに対応した直積なんてものは作ることが可能なのでしょうか。
・直積の算出オーダーはπ(i=1->n)len(iter[i])であることですし、不可能としか思えませんが…。
・キャッシュを回避するには下で示唆されているように毎回iterをcnt分回せば良いですが、それだと時間がかかりすぎると思います。
ideoneによると、いちいち回す解法が0.008s、キャッシュ解法が0.002sでした。
ちなみに、itertools.teeを移植してみたのですが、「Ruby 1.8だとStopIteration発生時にrewindが発生するため正しい結果が得られない」上に、ideoneで0.016秒もかかってしまいました。

[2回目]
・無限リストに関連して、http://nabetani.sakura.ne.jp/hena/ord24eliseq/ のような問題なら、
1次元なのでキャッシュ不要です。100000件目の取得も難しくないです。
#一方100000件目の直積を得るのはかなり辛いですよね、という趣旨のことを言いたかったのです。すみません。
http://qiita.com/cielavenir/items/2a685d3080862f2c2c47
・やむを得ずAnswerQ3Testの親クラスを変更しましたが、内側はいじっていませんので、ご容赦下さい。ideoneで動作することは確認しています。
・ループ内で一度もyieldが発生しなかった場合はループを抜けるようにしました。これで全て有限の場合に対応出来ました。内部ではPythonも同様に修正しています。

C# キャッシュ版 http://ideone.com/GXplmw
C# いちいち回す版 http://ideone.com/jD8Nlo
Go キャッシュ版 http://ideone.com/MOHWAC
Go いちいち回す版 Goのchanは巻き戻すことができないので、作成は難しいと思われます。ゴルーチンは非同期なので、itertools.teeのような操作は危険かもしれませんし。

ところで、C#とGoのテストコードを書いている最中に気がついたのですが、takeの引数はexpected.sizeの方が良いと思います。
=end

#Ruby 1.8で動作させるにはprimeライブラリを何とかする必要がある
#if RUBY_VERSION<'1.9'
#	require 'rubygems'
#	require 'backports'
#end

=begin
class Enumerator
	def tee(n=2)
	    queue=n.times.map{[]}
		return queue.map{|myqueue|
			Enumerator.new{|y|
				loop{
					if myqueue.empty?
						v=self.next
						queue.each{|e|e.push(v)}
					end
					y<<myqueue.shift
				}
			}
		}
		#return queue.map{|e|gen[e]}
	end
end
=end

# いちいち回す解法
# 無限リスト（ストリーム）に対応した直積（Cartesian product）を生成して列挙するメソッド
def infinite_product *iters
	return to_enum(:infinite_product,*iters) unless block_given?
	# ここを適切に実装しなおしてテストが通るようにしてください。
 	# ただし、以下の条件を満たすこと：
 	# ・後述の別メソッド infinite_product_process を利用すること。
 	# ・yield 式を必ず利用すること。
	enums=iters.map{|e|e.is_a?(Enumerator) ? e : e.to_enum}
	cnt=0
	iter_end=false
	while !iter_end
		iter_end=true
		infinite_product_process(enums,[],cnt,0){|e|
			iter_end=false
			yield e
		}
		cnt+=1
	end
	# 桜先生からのワンポイントアドバイス：
	# ・今まで学んだことを最大限に活かしてね♪
	# ・Good Luck!
end

def infinite_product_process enums,result,cnt,d
	# メソッドの引数は変更しても可↑。ただし「ブロック引数 (&block)」は利用不可。
	# メソッドの引数を変更した場合は、下記の ↓ to_enum の引数も適切に変更すること。
	return to_enum(:infinite_product_process,enums,result,cnt,d) unless block_given?
	# ここを適切に実装してテストが通るようにしてください。
	# ただし、以下の条件を満たすこと：
	# ・yield 式を必ず利用すること。
	#enums[d],dup=enums[d].tee
	(cnt+1).times{|i|
		begin
			#v=dup.next
			v=enums[d].next
			if d<enums.size-1
				infinite_product_process(enums,result+[v],cnt-i,d+1){|e|yield e}
			elsif i==cnt
				yield result+[v]
			end
		rescue StopIteration
			break
		end
	}
	enums[d].rewind
	# 桜先生からのワンポイントアドバイス：
	# ・この infinite_product_process メソッドの使い方がポイント。
	# 　何を受け取って、何を返すか（何を yield の引数に引き渡すのか）。
	# 　あと、何回呼び出すのか、どこから呼び出すのか、とかもね。
	# ・あとは、えーと…ぐ、Good Luck!
end

# ※これ以降は変更しないこと。
if $0 == __FILE__
  require RUBY_VERSION<'1.9' ? 'test/unit' : 'minitest/autorun'
  require 'prime'

  # 素数を列挙する Enumerator を返すメソッド
  def primes
    Prime.to_enum
  end

  # 整数（>0）を列挙する Enumerable（≠Enumerator） を返すメソッド
  def nats
    (1..1.0/0)
  end

  # フィボナッチ数列を列挙するメソッド
  def fib
    return to_enum :fib unless block_given?
    a, b = 0, 1
    loop do
      yield b
      a, b = b, a + b
    end
  end

  # infinite_product メソッドのテストクラス
  class AnswerQ3Test < (RUBY_VERSION<'1.9' ? Test::Unit::TestCase : MiniTest::Unit::TestCase)
    # fib のみのテスト
    def test_fib_only
      expected = [[1], [1], [2], [3], [5], [8], [13], [21], [34], [55]]
      result = infinite_product(fib).take(10)
      assert_equal(expected, result)
    end 

    # nats と fib の infinite_product のテスト
    def test_product_nats_fib
      expected = [
        [1, 1],
        [1, 1], [2, 1],
        [1, 2], [2, 1], [3, 1],
        [1, 3], [2, 2], [3, 1], [4, 1],
        [1, 5], [2, 3], [3, 2], [4, 1], [5, 1],
        [1, 8], [2, 5], [3, 3], [4, 2], [5, 1], [6, 1]
      ]
      result = infinite_product(nats, fib).take(21)
      assert_equal(expected, result)
    end

    # primes と nats と fib の infinite_product のテスト
    def test_product_primes_nats_fib
      expected = [
        [2, 1, 1],
        [2, 1, 1], [2, 2, 1],
        [3, 1, 1],
        [2, 1, 2], [2, 2, 1], [2, 3, 1],
        [3, 1, 1], [3, 2, 1],
        [5, 1, 1],
        [2, 1, 3], [2, 2, 2], [2, 3, 1], [2, 4, 1],
        [3, 1, 2], [3, 2, 1], [3, 3, 1],
        [5, 1, 1], [5, 2, 1],
        [7, 1, 1],
        [2, 1, 5], [2, 2, 3], [2, 3, 2], [2, 4, 1], [2, 5, 1],
        [3, 1, 3], [3, 2, 2], [3, 3, 1], [3, 4, 1],
        [5, 1, 2], [5, 2, 1], [5, 3, 1],
        [7, 1, 1], [7, 2, 1],
        [11, 1, 1]
      ]
      result = infinite_product(primes, nats, fib).take(35)
      assert_equal(expected, result)
    end

    # nats と [1, 2, 3] の infinite_product のテスト
    def test_product_nats_1_3
      expected = [
        [1, 1],
        [1, 2], [2, 1],
        [1, 3], [2, 2], [3, 1],
                [2, 3], [3, 2], [4, 1],
                        [3, 3], [4, 2], [5, 1],
                                [4, 3], [5, 2], [6, 1]
      ]
      result = infinite_product(nats, 1..3).take(15)
      assert_equal(expected, result)
    end

    # [1, 2, 3] と nats の infinite_product のテスト
    def test_product_1_3_nats
      expected = [
        [1, 1],
        [1, 2], [2, 1],
        [1, 3], [2, 2], [3, 1],
        [1, 4], [2, 3], [3, 2],
        [1, 5], [2, 4], [3, 3],
        [1, 6], [2, 5], [3, 4]
      ]
      result = infinite_product(1..3, nats).take(15)
      assert_equal(expected, result)
    end

    # 有限リスト
    def test_product_1_2_x3
      expected = [
        [1, 1, 1],
        [1, 1, 2], [1, 2, 1], [2, 1, 1],
        [1, 2, 2], [2, 1, 2], [2, 2, 1],
        [2, 2, 2]
      ]
      # result = infinite_product([1, 2], [1, 2], [1, 2]).take(8)
      result = infinite_product([1, 2], [1, 2], [1, 2]).to_a
      assert_equal(expected, result)
    end

    def test_product_1_2_x4
      expected = [
        [1, 1, 1, 1],
        [1, 1, 1, 2], [1, 1, 2, 1], [1, 2, 1, 1], [2, 1, 1, 1],
        [1, 1, 2, 2], [1, 2, 1, 2], [1, 2, 2, 1], [2, 1, 1, 2], [2, 1, 2, 1], [2, 2, 1, 1],
        [1, 2, 2, 2], [2, 1, 2, 2], [2, 2, 1, 2], [2, 2, 2, 1],
        [2, 2, 2, 2]
      ]
      # result = infinite_product([1, 2], [1, 2], [1, 2], [1, 2]).take(16)
      result = infinite_product([1, 2], [1, 2], [1, 2], [1, 2]).to_a
      assert_equal(expected, result)
    end
  end
end