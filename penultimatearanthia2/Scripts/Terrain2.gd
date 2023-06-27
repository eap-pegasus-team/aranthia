extends Node2D


const AbjurClass = preload("res://AbjurationScene.tscn")
const EvocClass = preload("res://EvocationScene.tscn")
const TransmutClass = preload("res://TransmutationScene.tscn")
onready var class_scene = get_node("class_scene")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var abjur_instance = null
var evoc_instance = null
var transmut_instance = null

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
		get_tree().change_scene("res://AbjurationScene.tscn")

func _on_abjur_exam_started():
	pass

func _on_abjur_exam_passed():
	pass

func _on_abjur_exam_failed():
	pass

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
		get_tree().change_scene("res://EvocationScene.tscn")

func _on_evoc_exam_started():
	pass

func _on_evoc_exam_passed():
	pass

func _on_evoc_exam_failed():
	pass

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
		get_tree().change_scene("res://TransmutationScene.tscn")

func _on_transmut_exam_started():
	pass

func _on_transmut_exam_passed():
	pass

func _on_transmut_exam_failed():
	pass

func _on_ExitToTerrain1Area2D_body_entered(body):
	var in_area = true
	$AudioStreamPlayer2D.stop()
	#gototerrain1
#	If below somehow needs to include input check so player can interact instead of bumping with event
	if body.is_in_group("player") and in_area == true:
		print("Entered")
		get_tree().change_scene("res://Scenes/Terrain1.tscn")


func _on_Building1Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.
