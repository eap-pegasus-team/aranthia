extends Node2D

const Player = preload("res://Scenes/Player.tscn")
var in_area = false


# Called when the node enters the scene tree for the first time.
func _ready():
#	Player.scale = Vector2(1.5, 1.5)
#	Player.scale.x = -1
#	Player.scale.x *= -1
#	$Player/AnimatedSprite.scale = Vector2(1, 1)
#	$Player/AnimatedSprite.scale.x = 0.5
#	$Player/AnimatedSprite.scale.x *= 0.5
	if Input.is_action_just_pressed("ui_up"):
		print("pressed")
		Player.scale = Vector2(1.5, 1.5)
		Player.scale.x = -1
		Player.scale.x *= -1

func scale():
	if Input.is_action_just_pressed("ui_up"):
		Player.AnimatedSprite.scale = Vector2(1.5, 1.5)
		Player.AnimatedSprite.scale.x = -1
		Player.AnimatedSprite.scale.x *= -1

func _on_Area2D_body_entered(body):
	var in_area = true
	print("Entered")
	$AudioStreamPlayer2D.stop()
	#gototerrain2
#	If below somehow needs to include input check so player can interact instead of bumping with event
#	if body.is_in_group("player") and in_area == true:
#		print(Input)
#		Player.set_process_unhandled_input(false)
##		EventHandler.connect("battle_started", self, "_on_battle_started")
##		EventHandler.connect("battle_finished", self, "_on_battle_finished")
##		EventHandler.connect("battle_escaped", self, "_on_battle_escaped")
##		EventHandler.emit_signal("battle_started")
##		if get_node("EnemyOverworld/battlescene/battle_scene"):
##			$EnemyOverworld/battlescene.get_child(0).queue_free()
##			$EnemyOverworld/battlescene.add_child(battle_instance)

