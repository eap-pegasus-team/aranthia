extends Area2D

onready var x = preload("res://Assets/x.png")
onready var o = preload("res://Assets/o.png")

var selected = false
export var pos = -1

func _ready():
	$mouseover.hide()


func _on_POS_mouse_entered():
	if(!selected and !Game.win):
		$mouseover.show()


func _on_POS_mouse_exited():
	$mouseover.hide()

func play_x():
	if(!selected and !Game.win):
		$x_o.set_texture(x)
		$mouseover.hide()
		selected = true
		Game.data_store[pos] = "x"
		Game.check_win(pos, "x")


func play_o(): 
	if(!selected and !Game.win):
		$x_o.set_texture(o)
		$mouseover.hide()
		selected = true
		Game.data_store[pos] = "o"
		Game.check_win(pos, "o")
	if(Game.win):
		$AudioStreamPlayer.play()

func _on_POS_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton and event.pressed):
		if(event.button_index == BUTTON_LEFT):
			play_x()
			Game.cpu_turn()
