module.exports = (robot) ->
	robot.respond /hoge1/i, (msg) ->
		msg.send 'メッセージ送信' #Q1
	robot.respond /hoge2/i, (msg) ->
		msg.send msg.random ([1,2,3,4,5]) #Q2
	robot.hear /hoge3/i, (msg) -> #Q3
		msg.send 'メッセージ送信'
	robot.respond /hoge4/i, (msg) ->
		# tbpgr の blog のトップページ を取得します
		robot.http("http://d.hatena.ne.jp/tbpg/") #Q4
			.get() (err, res, body) ->
				msg.send body
	robot.respond /fizzbuzz (\d+)$/i, (msg) ->
		num = parseInt(msg.match[1]) #Q5
		ret = if num%15 == 0 then 'FizzBuzz' else (if num%3 == 0 then 'Fizz' else (if num%5 == 0 then 'Buzz' else num))
		msg.send ret