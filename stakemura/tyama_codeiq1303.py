#!/usr/bin/python
# -*- coding: utf-8 -*-
from __future__ import division, print_function, unicode_literals
import logging
import random

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
ch = logging.StreamHandler()
ch.setLevel(logging.INFO)
logger.addHandler(ch)

class Unit: # ユニット
	def __init__(self, team, name, HP, ATK, DEF, SPD):
		self.team = team
		self.name = name
		self.HP = HP
		self.ATK = ATK
		self.DEF = DEF
		self.SPD = SPD
	def __str__(self):
		return self.name
	def is_active(self):
		# 行動可能か
		return self.HP>0
	def is_player(self):
		# プレイヤーか
		return self.team==0
	def is_monster(self):
		# モンスターか
		return self.team!=0
	def calc_action_priority(self):
		# 行動の優先順位を求める
		var = random.uniform(0.75, 1.0)
		return self.SPD * var
	def calc_damage_core(self, target):
		return max(self.ATK/2 - target.DEF/4, 0)
	def calc_damage(self, target):
		# ダメージを計算する
		var = random.uniform(1-1/16, 1+1/16)
		return int(self.calc_damage_core(target) * var)
	def act_as_monster(self, units, order):
		# モンスターAI。ランダムに選んだプレイヤーを攻撃
		foes = [e for e in units if e.is_active() and e.is_player()]
		target = random.choice(foes)
		damage = self.calc_damage(target)
		target.HP = max(0, target.HP-damage)
		logger.debug("%8s -> %8s HP:%5d" % (str(self), str(target), -damage))
	def player_select_target(self, foes, order):
		# ターゲット選択
		# 課題として見た場合、手を加えるのはこのメソッドのみにすべき
		# selfのプロパティおよびfoesの中身は変更禁止
		return max(foes,key=lambda e: e.ATK*e.SPD*self.calc_damage_core(e))
	def act_as_player(self, units, order):
		# プレイヤーAI
		foes = [e for e in units if e.is_active() and e.is_monster()]
		target = self.player_select_target(foes,order)
		damage = self.calc_damage(target)
		target.HP = max(0, target.HP-damage)
		logger.debug("%8s -> %8s HP:%5d" % (str(self), str(target), -damage))

def do_battle(players, monsters): # バトルのシミュレーション
	teams = [players, monsters]
	while True:
		# 行動可能なユニットを求める
		active_units = [e for e in players+monsters if e.is_active()]
		# 行動が早い順にユニットソート
		active_units = sorted(active_units, key=Unit.calc_action_priority,
							  reverse=True)
		for order, me in enumerate(active_units):
			# 行動可能かチェック
			if not me.is_active():
				continue
			if me.team==0:
				# プレイヤーの行動
				me.act_as_player(active_units, order)
			else:
				# モンスターの行動
				me.act_as_monster(active_units, order)
			# 戦闘終了の判定
			if not any(e for e in teams[1-me.team] if e.is_active()):
				return me.team

if __name__ == '__main__':
	win = [0, 0]
	# n回バトルをシミュレーションする
	for n in range(0,50000): # PyPyだと5万回回せる模様
		logger.debug("--- Battle No.%d ---" % n)
		players = [
			Unit(0, "knight", 124, 55, 65, 32),
			Unit(0, "archer", 96, 85, 35, 40),
			Unit(0, "thief", 139, 37, 41, 68),
		]
		monsters = [
			Unit(1, "goblin", 88, 49, 21, 38),
			Unit(1, "raven", 96, 112, 52, 75),
			Unit(1, "ogre", 198, 60, 68, 39),
		]
		win[do_battle(players, monsters)] += 1
	# プレイヤーの勝率を100分率で表示
	print("Player win rate %7.5f%%" % (100.0 * win[0] / sum(win),))

# filter()を使わないように変更してみました。
# Player win rate 37.43200%