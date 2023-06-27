extends Node

const Slash = preload("res://Scenes/Slash.tscn")
const BattleUnits = preload("res://assets/BattleUnits.tres")

export(Array, PackedScene) var enemies = []

onready var playerStats = $PlayerStats
onready var battleActionButtons = $UI/BattleActionButtons
onready var animationPlayer = $AnimationPlayer
onready var nextRoomButton = $UI/CenterContainer/NextRoomButton
onready var enemyPosition = $EnemyPosition


func _ready():
	randomize()
	create_new_enemy()
	start_player_turn()
	var enemy = BattleUnits.Enemy
	if enemy != null:
		enemy.connect("died", self, "_on_Enemy_died")

func start_enemy_turn():
	battleActionButtons.hide()
	var enemy = BattleUnits.Enemy
	if enemy != null and not enemy.is_queued_for_deletion():
		enemy.attack()
		yield(enemy, "end_turn")
	start_player_turn()

func start_player_turn():
	if $PlayerStats.canHeal == false:
		$UI/BattleActionButtons/HealButton.text == ""
	battleActionButtons.show()
	playerStats.ap = playerStats.max_actions
	yield(playerStats, "end_turn")
	start_enemy_turn()
	
func dice_roll(minimum, maximum):
	var roll = randi() % (maximum-minimum+1) + minimum
	return roll

func _on_FightButton_pressed():
	var enemy = BattleUnits.Enemy
	if ($UI/BattleActionButtons/FightButton.text == "FIGHT"):
		$UI/BattleActionButtons/FightButton.text = "STRIKE"
		$UI/BattleActionButtons/DefendButton.text = "MAGIC"
	elif ($UI/BattleActionButtons/FightButton.text == "STRIKE"):
		if enemy != null and playerStats != null:
			create_slash(enemy.global_position)
			var damage = dice_roll(1,6)
			enemy.take_damage(damage)
			playerStats.ap -= 1
		$UI/BattleActionButtons/FightButton.text = "FIGHT"
		$UI/BattleActionButtons/DefendButton.text = "DEFEND"

func _on_DefendButton_pressed():
	var enemy = BattleUnits.Enemy
	if ($UI/BattleActionButtons/DefendButton.text == "DEFEND"):
		if enemy != null and playerStats != null:
			var defense = dice_roll(1,4)
			playerStats.ap -= 1
	elif ($UI/BattleActionButtons/DefendButton.text == "MAGIC"):
		if enemy != null and playerStats != null:
			var damage = dice_roll(1,4)
			enemy.take_damage(damage)
			playerStats.ap -= 1
		$UI/BattleActionButtons/FightButton.text = "FIGHT"
		$UI/BattleActionButtons/DefendButton.text = "DEFEND"

func _on_HealButton_pressed():
	if ($UI/BattleActionButtons/HealButton.text == "HEAL"):
		var main = get_tree().current_scene
		var playerStats = main.find_node("PlayerStats")
		if playerStats != null:
			var healAmount = dice_roll(1,4)
			if playerStats.mp >= 1:
				playerStats.hp += healAmount
				playerStats.ap -= 1
				playerStats.mp -= 1
			else:
				print("No mana")
				start_enemy_turn()


func _on_EscapeButton_pressed():
	if ($UI/BattleActionButtons/EscapeButton.text == "ESCAPE"):
		$UI.hide()
		animationPlayer.play("FadeToNewRoom")
		yield(animationPlayer, "animation_finished")
#		get_tree().reload_current_scene()
		EventHandler.emit_signal("battle_escaped")
		self.queue_free()

func create_slash(position):
	var slash = Slash.instance()
	var main = get_tree().current_scene
	main.add_child(slash)
	slash.global_position = position

func create_new_enemy():
	enemies.shuffle()
	var Enemy = enemies.front()
	var enemy = Enemy.instance()
	enemyPosition.add_child(enemy)
	
func _on_Enemy_died():
	nextRoomButton.show()
	battleActionButtons.hide()
	
func _on_NextRoomButton_pressed():
	$UI/StatsPanel.hide()
	nextRoomButton.hide()
	animationPlayer.play("FadeToNewRoom")
	yield(animationPlayer, "animation_finished")
#	var playerStats = BattleUnits.PlayerStats
#	playerStats.ap = playerStats.max_actions
#	battleActionButtons.show()
#	create_new_enemy()
#	get_tree().reload_current_scene()
	EventHandler.emit_signal("battle_finished")
	self.queue_free()
