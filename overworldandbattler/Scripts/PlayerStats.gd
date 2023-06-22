extends Node

const BattleUnits = preload("res://assets/BattleUnits.tres")

var max_hitpoints = 25
var hp = max_hitpoints setget set_hp
var max_actions = 3
var ap = max_actions setget set_ap
var max_mana = 10
var mp = max_mana setget set_mp

signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)
signal end_turn

func set_hp(value):
	hp = clamp(value, 0, max_hitpoints)
	emit_signal("hp_changed", hp)

func set_ap(value):
	ap = clamp(value, 0, max_actions)
	emit_signal("ap_changed", ap)
	if ap == 0:
		emit_signal("end_turn")

func set_mp(value):
	mp = clamp(value, 0, max_mana)
	emit_signal("mp_changed", mp)

func _ready():
	BattleUnits.PlayerStats = self

func _exit_tree():
	BattleUnits.PlayerStats = null
