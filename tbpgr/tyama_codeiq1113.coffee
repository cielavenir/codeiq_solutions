# Description:
#   Intercal生成
#
#   指定された文字列を生成するIntercalプログラムを生成します
#
# Commands:
#   intercal text - textを出力するIntercalプログラムを返す
#
# Author:
#   ciel
module.exports = (robot) ->
	robot.respond /intercal (.+)$/i, (msg) ->
		text = unescape encodeURIComponent msg.match[1]
		last = 0
		siz = text.length
		please = ((siz+3)/4^0)-2
		send = 'DO ,1 <- #'+siz+"\n"
		for i in [0..text.length-1]
			c = text.charCodeAt(i)
			c = (c & 0x55) << 1 | (c & 0xaa) >> 1
			c = (c & 0x33) << 2 | (c & 0xcc) >> 2
			c = (c & 0x0f) << 4 | (c & 0xf0) >> 4
			last2 = c
			c = (last-c)&0xff
			last = last2
			if i<=please
				send += 'PLEASE '
			send += 'DO ,1 SUB #'+(i+1)+' <- #'+(c&0xff)+"\n"
		send += "PLEASE READ OUT ,1\n"
		send += "PLEASE GIVE UP\n"
		msg.send send
# Examples:
###
Hubot > hubot intercal I ♥ CodeIQ.
Hubot > DO ,1 <- #13
PLEASE DO ,1 SUB #1 <- #110
PLEASE DO ,1 SUB #2 <- #142
PLEASE DO ,1 SUB #3 <- #189
DO ,1 SUB #4 <- #174
DO ,1 SUB #5 <- #244
DO ,1 SUB #6 <- #161
DO ,1 SUB #7 <- #66
DO ,1 SUB #8 <- #204
DO ,1 SUB #9 <- #208
DO ,1 SUB #10 <- #128
DO ,1 SUB #11 <- #20
DO ,1 SUB #12 <- #8
DO ,1 SUB #13 <- #22
PLEASE READ OUT ,1
PLEASE GIVE UP
###