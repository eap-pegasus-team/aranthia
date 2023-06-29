extends Area2D

func _process(delta):
	position.y += rand_range(5,10)

func _on_Enemy_area_entered(area):
	queue_free()
