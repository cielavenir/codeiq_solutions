#!/usr/bin/python
# -*- coding: utf-8 -*-

# 使用した Python のバージョン：
# ・Python(Python 2.7.x)/Python3(Python 3.x)
# 工夫した点・苦労した点・感想等（ご自由にお書きください）：
# ・そもそも無限リストに対応した直積なんてものは作ることが可能なのでしょうか。
# 直積の算出オーダーはπ(i=1->n)len(iter[i])であることですし、不可能としか思えませんが…。
# 実際このコードでは今まで出た要素を全てキャッシュする必要が生じます。
#
# ・キャッシュを回避するには下で示唆されているように毎回iterをcnt分回せば良いですが、それだと時間がかかりすぎると思います。
# 一応無駄に回さないようにリミッターを付けましたけれど。

import collections #iter変換に使う

# キャッシュ解法
# 無限リスト（ストリーム）に対応した直積（Cartesian product）を生成して列挙する関数（generator 関数）
def infinite_product(*iters):
	# ここを適切に実装しなおしてテストが通るようにしてください。
	# ただし、以下の条件を満たすこと：
	# ・後述の別関数 infinite_product_process を利用すること。
	# ・yield 式を必ず利用すること。
	enums=[e if isinstance(e,collections.Iterator) else iter(e) for e in iters]
	flags=[True for e in iters]
	arr=[[] for e in iters]
	cnt=0
	iter_end=False
	while not iter_end:
		iter_end=True
		for i in range(len(iters)):
			if flags[i]:
				try:
					arr[i].append(next(enums[i]))
				except StopIteration:
					flags[i]=False
		for e in infinite_product_process(arr,[],cnt,0):
			iter_end=False
			yield e
		cnt+=1
	# 桜先生からのワンポイントアドバイス：
	# ・今まで学んだことを最大限に活かしてね♪
	# ・Good Luck!

def infinite_product_process(arr,result,cnt,d):
	# この関数の引数は変更しても可↑↑。
	# ここを適切に実装してテストが通るようにしてください。
	# ただし、以下の条件を満たすこと：
	# ・yield 式を必ず利用すること。
	if d==len(arr)-1:
		if 0<=cnt and cnt<len(arr[d]): yield tuple(result+[arr[d][cnt]])
	else:
		for i in range(min(len(arr[d]),cnt+1)):
			for e in infinite_product_process(arr,result+[arr[d][i]],cnt-i,d+1): yield e
	# 桜先生からのワンポイントアドバイス：
	# ・この infinite_product_process 関数の使い方がポイント。
	# 　何を受け取って、何を返すか（何を yield 式に引き渡すのか）。
	# 　あと、何回呼び出すのか、どこから呼び出すのか、とかもね。
	# ・あとは、えーと…ぐ、Good Luck!

# ここに Lv.2 問題で作成した IteratorCloner クラスを転記してください。
# ※利用せずに解けた場合は、ここには何も記述しないでください。
# ※Lv.2 問題に挑戦していない方は、ここには何も記述せず上記2関数内で完結するようがんばって実装してください。
# v--ココカラ
# ^--ココマデ

# ※これ以降は変更しないこと。
if __name__ == '__main__':
    import unittest
    from itertools import count, islice
    try:
        # for Python2
        from itertools import ifilter
    except ImportError:
        # for Python3
        ifilter = filter


    def primes():
        """Generator function of Prime numbers."""
        g = count(2)
        while True:
            prime = next(g)
            yield prime
            g = ifilter(lambda x, prime=prime: x%prime, g)


    def nats():
        """Generator function of Integers(>0)."""
        return count(1)


    def fib():
        """Generator function of Fibonacci numbers."""
        a, b = 0, 1
        while True:
            yield b
            a, b = b, a + b


    class Q99Test(unittest.TestCase):
        """Test class for infinite_product()."""

        def test_fib_only(self):
            """Test for Fibonacci numbers."""
            expected = [(1,), (1,), (2,), (3,), (5,), (8,), (13,), (21,), (34,), (55,)]
            result = list(islice(infinite_product(fib()), 10))
            self.assertEqual(result, expected)


        def test_product_nats_fib(self):
            """Test for product of Integers(>0) and Fibonacci numbers."""
            expected = [
                (1, 1),
                (1, 1), (2, 1),
                (1, 2), (2, 1), (3, 1),
                (1, 3), (2, 2), (3, 1), (4, 1),
                (1, 5), (2, 3), (3, 2), (4, 1), (5, 1),
                (1, 8), (2, 5), (3, 3), (4, 2), (5, 1), (6, 1)
            ]
            result = list(islice(infinite_product(nats(), fib()), 21))
            self.assertEqual(result, expected)


        def test_product_primes_nats_fib(self):
            """Test for product of Primes and Integers(>0) and Fibonacci numbers."""
            expected = [
                (2, 1, 1),
                (2, 1, 1), (2, 2, 1),
                (3, 1, 1),
                (2, 1, 2), (2, 2, 1), (2, 3, 1),
                (3, 1, 1), (3, 2, 1),
                (5, 1, 1),
                (2, 1, 3), (2, 2, 2), (2, 3, 1), (2, 4, 1),
                (3, 1, 2), (3, 2, 1), (3, 3, 1),
                (5, 1, 1), (5, 2, 1),
                (7, 1, 1),
                (2, 1, 5), (2, 2, 3), (2, 3, 2), (2, 4, 1), (2, 5, 1),
                (3, 1, 3), (3, 2, 2), (3, 3, 1), (3, 4, 1),
                (5, 1, 2), (5, 2, 1), (5, 3, 1),
                (7, 1, 1), (7, 2, 1),
                (11, 1, 1)
            ]
            result = list(islice(infinite_product(primes(), nats(), fib()), 35))
            self.assertEqual(result, expected)


        def test_product_nats_1_3(self):
            """Test for product of Integers(>0) and [1, 2, 3]."""
            expected = [
                (1, 1),
                (1, 2), (2, 1),
                (1, 3), (2, 2), (3, 1),
                        (2, 3), (3, 2), (4, 1),
                                (3, 3), (4, 2), (5, 1),
                                        (4, 3), (5, 2), (6, 1)
            ]
            result = list(islice(infinite_product(nats(), range(1, 4)), 15))
            self.assertEqual(result, expected)


        def test_product_1_3_nats(self):
            """Test for product of [1, 2, 3] and Integers(>0)."""
            expected = [
                (1, 1),
                (1, 2), (2, 1),
                (1, 3), (2, 2), (3, 1),
                (1, 4), (2, 3), (3, 2),
                (1, 5), (2, 4), (3, 3),
                (1, 6), (2, 5), (3, 4)
            ]
            result = list(islice(infinite_product(range(1, 4), nats()), 15))
            self.assertEqual(result, expected)

        def test_product_1_2_x3(self):
            """Test [1, 2] x 3"""
            expected = [
                (1, 1, 1),
                (1, 1, 2), (1, 2, 1), (2, 1, 1),
                (1, 2, 2), (2, 1, 2), (2, 2, 1),
                (2, 2, 2)
            ]
            # result = list(islice(infinite_product([1, 2], [1, 2], [1, 2]), 8))
            result = list(infinite_product([1, 2], [1, 2], [1, 2]))
            self.assertEqual(result, expected)

        def test_product_1_2_x4(self):
            """Test [1, 2] x 4"""
            expected = [
                (1, 1, 1, 1),
                (1, 1, 1, 2), (1, 1, 2, 1), (1, 2, 1, 1), (2, 1, 1, 1),
                (1, 1, 2, 2), (1, 2, 1, 2), (1, 2, 2, 1), (2, 1, 1, 2), (2, 1, 2, 1), (2, 2, 1, 1),
                (1, 2, 2, 2), (2, 1, 2, 2), (2, 2, 1, 2), (2, 2, 2, 1),
                (2, 2, 2, 2)
            ]
            # result = list(islice(infinite_product([1, 2], [1, 2], [1, 2], [1, 2]), 16))
            result = list(infinite_product([1, 2], [1, 2], [1, 2], [1, 2]))
            self.assertEqual(result, expected)

    # run tests
    unittest.main()