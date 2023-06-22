extends Node2D

const Player = preload("res://Scenes/Player.tscn")
const Battle = preload("res://Scenes/Battle.tscn")
onready var battlescene = get_node("EnemyOverworld/battlescene/battle_scene")

var battle_instance = null
var in_area = null

func _on_EnemyOverworld_body_entered(body):
	var in_area = true
	print("Entered")
#	If below somehow needs to include input check so player can interact instead of bumping with event
	if body.is_in_group("player") and in_area == true and Input.is_action_pressed("ui_accept"):
		print(Input)
		$Player.set_process_unhandled_input(false)
		EventHandler.connect("battle_started", self, "_on_battle_started")
		EventHandler.connect("battle_finished", self, "_on_battle_finished")
		EventHandler.connect("battle_escaped", self, "_on_battle_escaped")
		EventHandler.emit_signal("battle_started")
#		if get_node("EnemyOverworld/battlescene/battle_scene"):
#			$EnemyOverworld/battlescene.get_child(0).queue_free()
#			$EnemyOverworld/battlescene.add_child(battle_instance)

func _on_battle_started():
	AudioStreamPlayer.PAUSE_MODE_STOP
	battle_instance = Battle.instance()
	if get_node("EnemyOverworld/battlescene/battle_scene"):
		$EnemyOverworld/battlescene.add_child(battle_instance)
	print("Battle Started")

func _on_battle_finished():
	if get_node("EnemyOverworld/battlescene/Battle"):
		$EnemyOverworld.queue_free()
	print("Battle Finished")
	$Player.set_process_unhandled_input(true)
	var in_area = null
	
func _on_battle_escaped():
	print("Battle Escaped")
	$Player.set_process_unhandled_input(true)
	var in_area = null
