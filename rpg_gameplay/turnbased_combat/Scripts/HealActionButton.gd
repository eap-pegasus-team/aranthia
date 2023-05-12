extends "res://Scripts/ActionButton.gd"

func dice_roll(minimum, maximum):
	var roll = randi() % (maximum-minimum+1) + minimum
	return roll
	
func _on_pressed():
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
	else:
		pass
