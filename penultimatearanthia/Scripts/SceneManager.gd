extends Node2D

const Main = preload("res://Scenes/Main.tscn")
const Main_menu = preload("res://Scenes/Main_Menu.tscn")
const Settings = preload("res://Scenes/Options_Menu.tscn")
const Terrain1 = preload("res://Scenes/Terrain1.tscn")

#onready var music_position = null

func _ready():
	EventHandler.connect("battle_started", self, "_on_battle_started")
	EventHandler.connect("battle_finished", self, "_on_battle_finished")
	EventHandler.connect("battle_escaped", self, "_on_battle_escaped")

func _on_TransitionScreen_transitioned():
	$AudioStreamPlayer.stop()
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Terrain1.instance())
	print("Swapped in Main Scene")
#	if _on_NewGameButton_pressed():
#		$CurrentScene.add_child(Main.instance())
#	elif _on_OptionsButton_pressed():
#		$CurrentScene.add_child(Settings.instance())
#	elif _on_ReturnButton_pressed():
#		$CurrentScene.add_child(Main_menu.instance())

func _on_NewGameButton_pressed():
	$TransitionScreen.transition()
#	$CurrentScene.get_child(0).queue_free()
#	$CurrentScene.add_child(Terrain1.instance())
	

func _on_OptionsButton_pressed():
#	$TransitionScreen.transition()
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Settings.instance())

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_ReturnButton_pressed():
#	$TransitionScreen.transition()
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(Main_menu.instance())

func _on_TextureButton_pressed():
	var master_bus = AudioServer.get_bus_index("Master")
	var textureA = "res://Assets/mute_0.png"
	var textureB = "res://Assets/unmute_0.png"
	
	if !AudioServer.is_bus_mute(0):
		print("no mute")
		get_node("MuteAudio/TextureButton").set_normal_texture(load(textureA))
		AudioServer.set_bus_mute(master_bus,true)
	elif AudioServer.is_bus_mute(0):
		print("mute")
		get_node("MuteAudio/TextureButton").set_normal_texture(load(textureB))
		AudioServer.set_bus_mute(master_bus,false)
	else:
		print("ERROR")

func _on_battle_started():
#	music_position = $AudioStreamPlayer.get_playback_position()
	$AudioStreamPlayer.stop()
	
func _on_battle_finished():
#	$AudioStreamPlayer.play(music_position)
	$AudioStreamPlayer.play()
	

func _on_battle_escaped():
#	$AudioStreamPlayer.play(music_position)
	$AudioStreamPlayer.play()
