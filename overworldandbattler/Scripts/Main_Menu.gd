extends CanvasLayer
export var MainGameScene: PackedScene

func _on_NewGameButton_button_up():
	pass
	get_tree().change_scene(MainGameScene.resource_path)
