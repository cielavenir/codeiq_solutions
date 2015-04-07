#!/usr/bin/ruby
# -*- coding: utf-8 -*-

class Unit # ユニット
	attr_reader :team,:hp,:atk,:_def,:spd
	def initialize(team, name, hp, atk, _def, spd)
		@team = team
		@name = name
		@hp = hp
		@atk = atk
		@_def = _def
		@spd = spd
	end
	def to_s
		return @name
	end
	def active?
		# 行動可能か
		return @hp>0
	end
	def player?
		# プレイヤーか
		return @team==0
	end
	def monster?
		# モンスターか
		return @team!=0
	end
	def calc_action_priority
		# 行動の優先順位を求める
		var = rand(0.75...1.0)
		return @spd * var
	end
	def calc_damage_core(target)
		return [@atk/2.0 - target._def/4.0, 0].max
	end
	def calc_damage(target)
		# ダメージを計算する
		var = rand(1-1/16.0 ... 1+1/16.0)
		return (calc_damage_core(target) * var).to_i
	end
	def take_damage(damage)
		@hp = [0, @hp-damage].max
	end
	def act_as_monster(units, order)
		# モンスターAI。ランダムに選んだプレイヤーを攻撃
		foes = units.select{|e|e.active? && e.player?}
		target = foes.sample
		damage = calc_damage(target)
		target.take_damage(damage) 
		#logger.debug("%8s -> %8s HP:%5d" % [self, target, -damage])
	end
	def player_select_target(foes, order)
		# ターゲット選択
		# 課題として見た場合、手を加えるのはこのメソッドのみにすべき
		# インスタンス変数は変更禁止
		return foes.max_by{|e|e.atk*e.spd*calc_damage_core(e)}
	end
	def act_as_player(units, order)
		# プレイヤーAI
		foes = units.select{|e|e.active? && e.monster?}
		target = player_select_target(foes.dup,order)
		damage = calc_damage(target)
		target.take_damage(damage) 
		#logger.debug("%8s -> %8s HP:%5d" % [self, target, -damage])
	end
end

def do_battle(players, monsters) # バトルのシミュレーション
	teams = [players, monsters]
	loop{
		# 行動可能なユニットを求める
		active_units = (players+monsters).select(&:active?)
		# 行動が早い順にユニットソート
		active_units = active_units.sort_by(&:calc_action_priority).reverse
		active_units.each_with_index{|me,order|
			# 行動可能かチェック
			next if !me.active?
			if me.team==0
				# プレイヤーの行動
				me.act_as_player(active_units, order)
			else
				# モンスターの行動
				me.act_as_monster(active_units, order)
			end
			# 戦闘終了の判定
			return me.team if teams[1-me.team].none?(&:active?)
		}
	}
end

if __FILE__ == $0
	win = [0, 0]
	# n回バトルをシミュレーションする
	10000.times{
		#logger.debug("--- Battle No.%d ---" % n)
		players = [
			Unit.new(0, "knight", 124, 55, 65, 32),
			Unit.new(0, "archer", 96, 85, 35, 40),
			Unit.new(0, "thief", 139, 37, 41, 68),
		]
		monsters = [
			Unit.new(1, "goblin", 88, 49, 21, 38),
			Unit.new(1, "raven", 96, 112, 52, 75),
			Unit.new(1, "ogre", 198, 60, 68, 39),
		]
		win[do_battle(players, monsters)] += 1
	}
	# プレイヤーの勝率を100分率で表示
	puts "Player win rate %7.5f%%" % [100.0 * win[0] / win.reduce(:+)]
end