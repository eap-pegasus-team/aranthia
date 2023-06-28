extends Node2D


const Player = preload("res://Scenes/Player.tscn")
const Battle = preload("res://Scenes/Battle.tscn")
const AbjurClass = preload("res://AbjurationScene.tscn")
const EvocClass = preload("res://EvocationScene.tscn")
const TransmutClass = preload("res://TransmutationScene.tscn")
onready var class_scene = get_node("class_scene")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var battle_instance = null
var abjur_instance = null
var evoc_instance = null
var transmut_instance = null
var in_area = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_abjur_class_started():
	AudioStreamPlayer.PAUSE_MODE_STOP
	abjur_instance = AbjurClass.instance()
	$Overlay.visible = true
	if get_node("class_scene"):
		$class_scene.add_child(abjur_instance)
	print("Abjuration Class Started")

func _on_evoc_class_started():
	AudioStreamPlayer.PAUSE_MODE_STOP
	evoc_instance = EvocClass.instance()
	$Overlay.visible = true
	if get_node("class_scene"):
		$class_scene.add_child(evoc_instance)
	print("Evocation Class Started")

func _on_transum_class_started():
	AudioStreamPlayer.PAUSE_MODE_STOP
	transmut_instance = TransmutClass.instance()
	$Overlay.visible = true
	if get_node("class_scene"):
		$class_scene.add_child(transmut_instance)
	print("Abjuration Class Started")

func _on_Building1Area2D_body_entered(body):
	var in_area = true
	if body.is_in_group("player") and in_area == true:
		print("Entered")
		print(Input)
		$Player.set_process_unhandled_input(false)
		EventHandler.connect("abjur_exam_started", self, "_on_abjur_exam_started")
		EventHandler.connect("abjur_exam_passed", self, "_on_abjur_exam_passed")
		EventHandler.connect("abjur_exam_failed", self, "_on_abjur_exam_failed")
		EventHandler.emit_signal("abjur_exam_started")
#		get_tree().change_scene("res://AbjurationScene.tscn")

func _on_abjur_exam_started():
	abjur_instance = AbjurClass.instance()
	$Overlay.visible = true
	if get_node("Building1Area2D/abjurscene/abjur_scene"):
		$Building1Area2D/abjurscene.add_child(abjur_instance)
	print("Abjur Exame Started")

func _on_abjur_exam_passed():
	if get_node("Building1Area2D/abjurscene"):
		$EnemyOverworld.queue_free()
	print("Battle Finished")
	$Player.set_process_unhandled_input(true)
	var in_area = null
	$Overlay.visible = false

func _on_abjur_exam_failed():
	print("Exam Failed")
	$Player.set_process_unhandled_input(true)
	var in_area = null
	$Overlay.visible = false

func _on_Building2Area2D_body_entered(body):
	var in_area = true
#	If below somehow needs to include input check so player can interact instead of bumping with event
	if body.is_in_group("player") and in_area == true:
		print("Entered")
		print(Input)
		$Player.set_process_unhandled_input(false)
		EventHandler.connect("evoc_exam_started", self, "_on_evoc_exam_started")
		EventHandler.connect("evoc_exam_passed", self, "_on_evoc_exam_passed")
		EventHandler.connect("evoc_exam_failed", self, "_on_evoc_exam_failed")
		EventHandler.emit_signal("evoc_exam_started")
#		get_tree().change_scene("res://EvocationScene.tscn")

func _on_evoc_exam_started():
	evoc_instance = EvocClass.instance()
	$Overlay.visible = true
	if get_node("Building2Area2D/evocscene/evoc_scene"):
		$Building2Area2D/evocscene.add_child(evoc_instance)
	print("Evoc exam Started")

func _on_evoc_exam_passed():
	if get_node("Building2Area2D/evocscene"):
		$Building2Area2D/evocscene.queue_free()
	print("Exam Passed")
	$Player.set_process_unhandled_input(true)
	var in_area = null
	$Overlay.visible = false

func _on_evoc_exam_failed():
	print("Exam Failed")
	$Player.set_process_unhandled_input(true)
	var in_area = null
	$Overlay.visible = false

func _on_Building3Area2D_body_entered(body):
	var in_area = true
#	If below somehow needs to include input check so player can interact instead of bumping with event
	if body.is_in_group("player") and in_area == true:
		print("Entered")
		print(Input)
		$Player.set_process_unhandled_input(false)
		EventHandler.connect("transmut_exam_started", self, "_on_transmut_exam_started")
		EventHandler.connect("transmut_exam_passed", self, "_on_transmut_exam_passed")
		EventHandler.connect("transmut_exam_failed", self, "_on_transmut_exam_failed")
		EventHandler.emit_signal("transmut_exam_started")
#		get_tree().change_scene("res://TransmutationScene.tscn")

func _on_transmut_exam_started():
	transmut_instance = TransmutClass.instance()
	$Overlay.visible = true
	if get_node("Building3Area2D/transmutscene/transmut_scene"):
		$Building3Area2D/transmutscene.add_child(transmut_instance)
	print("Evoc Exam Started")

func _on_transmut_exam_passed():
	if get_node("Building3Area2D/transmutscene"):
		$Building3Area2D.queue_free()
	print("Evoc Exam Finished")
	$Player.set_process_unhandled_input(true)
	var in_area = null
	$Overlay.visible = false

func _on_transmut_exam_failed():
	print("Evoc Exam Failed")
	$Player.set_process_unhandled_input(true)
	var in_area = null
	$Overlay.visible = false

func _on_ExitToTerrain1Area2D_body_entered(body):
	var in_area = true
	$AudioStreamPlayer2D.stop()
	#gototerrain1
#	If below somehow needs to include input check so player can interact instead of bumping with event
	if body.is_in_group("player") and in_area == true:
		print("Entered")
		get_tree().change_scene("res://Scenes/Terrain1.tscn")

func _on_Building4Area2D_body_entered(body):
	var in_area = true
	print("Entered")
#	If below somehow needs to include input check so player can interact instead of bumping with event
	if body.is_in_group("player") and in_area == true:
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
	$Overlay.visible = true
	if get_node("Building4Area2D/battlescene/battle_scene"):
		$Building4Area2D/battlescene.add_child(battle_instance)
	print("Battle Started")

func _on_battle_finished():
	if get_node("EnemyOverworld/battlescene/Battle"):
		$EnemyOverworld.queue_free()
	print("Battle Finished")
	$Player.set_process_unhandled_input(true)
	var in_area = null
	$Overlay.visible = false
	
func _on_battle_escaped():
	print("Battle Escaped")
	$Player.set_process_unhandled_input(true)
	var in_area = null
	$Overlay.visible = false
