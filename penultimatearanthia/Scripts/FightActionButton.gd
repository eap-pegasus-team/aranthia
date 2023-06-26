extends "res://Scripts/ActionButton.gd"

const Slash = preload("res://Scenes/Slash.tscn")

func dice_roll(minimum, maximum):
	var roll = randi() % (maximum-minimum+1) + minimum
	return roll

func _on_pressed():
	var enemy = BattleUnits.Enemy
	var playerStats = BattleUnits.PlayerStats
	
	if enemy != null and playerStats != null:
		create_slash(enemy.global_position)
		var damage = dice_roll(1,6)
		enemy.take_damage(damage)
		playerStats.mp +=2
		playerStats.ap -= 1

func create_slash(position):
	var slash = Slash.instance()
	var main = get_tree().current_scene
	main.add_child(slash)
	slash.global_position = position
