extends Node2D

const BattleUnits = preload("res://assets/BattleUnits.tres")

export(int) var enemyHealth = 25 setget set_hp

export(int) var attacks = 1
export(int) var maxdamage = 6

onready var enemyHealthLabel = $HPLabel
onready var animationPlayer = $AnimationPlayer

signal died
signal end_turn

func set_hp(new_hp):
	enemyHealth = new_hp
	if enemyHealthLabel != null:
		enemyHealthLabel.text = str(enemyHealth) + " HP"

func dice_roll(minimum, maximum):
	var roll = randi() % (maximum-minimum+1) + minimum
	return roll

func attack():
	if self != null and not self.is_queued_for_deletion():
		yield(get_tree().create_timer(0.4), "timeout")
		animationPlayer.play("EnemyAttack")
		yield(animationPlayer,"animation_finished")
		emit_signal("end_turn")

func deal_damage():
	var damage = dice_roll(attacks,maxdamage)
	BattleUnits.PlayerStats.hp -= damage

func take_damage(amount):
	self.enemyHealth -= amount
	if is_dead():
		animationPlayer.play("Death")
		yield(animationPlayer,"animation_finished")
		emit_signal("died")
		queue_free()
	else:
		animationPlayer.play("Shake")
		yield(animationPlayer,"animation_finished")

func is_dead():
	return enemyHealth <= 0

func _ready():
	enemyHealthLabel.text = str(enemyHealth) + " HP"
	BattleUnits.Enemy = self

func _exit_tree():
	BattleUnits.Enemy = null
