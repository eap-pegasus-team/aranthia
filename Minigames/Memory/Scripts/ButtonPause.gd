extends TextureButton


func _ready():
	pass

func _pressed():
	if !get_tree().is_paused():
		get_tree().set_pause(true)
		set_normal_texture(load("res://Assets/ui/play.png"))
	elif get_tree().is_paused():
		set_normal_texture(load("res://Assets/ui/pause.png"))
		get_tree().set_pause(false)
