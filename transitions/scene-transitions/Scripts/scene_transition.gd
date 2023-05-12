extends CanvasLayer

func change_scene(target: String, type: String = 'dissolve') -> void:
	if type == 'dissolve':
		transition_dissolve(target)
	else:
		transition_waves(target)

func transition_dissolve(target: String) -> void:
	$AnimationPlayer.play('dissolve')
	yield($AnimationPlayer,'animation_finished')
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards('dissolve')

func transition_waves(target: String) -> void:
	$AnimationPlayer.play('waves_in')
	yield($AnimationPlayer,'animation_finished')
	get_tree().change_scene(target)
	$AnimationPlayer.play('waves_out')
