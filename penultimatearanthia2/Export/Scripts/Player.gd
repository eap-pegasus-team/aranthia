extends KinematicBody2D

onready var animatedSprite = $AnimatedSprite
onready var ray = $RayCast2D

var playing = false
var grid_size = 16
var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
	}

func _unhandled_input(event):
	for direction in inputs.keys():
		if event.is_action_pressed(direction):
			move(direction)

func move(direction):
	var vector_pos = inputs[direction] * grid_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_pos
	if inputs[direction] == Vector2.UP:
		animatedSprite.animation = "back"
		animatedSprite.play("back")
		if Input.action_release(direction):
			animatedSprite.stop()
	if inputs[direction] == Vector2.DOWN:
		animatedSprite.animation = "front"
		animatedSprite.play("front")
		if Input.action_release(direction):
			animatedSprite.stop()
	if inputs[direction] == Vector2.LEFT:
		animatedSprite.play("left")
		animatedSprite.animation = "left"
		if Input.action_release(direction):
			animatedSprite.stop()
	if inputs[direction] == Vector2.RIGHT:
		animatedSprite.play("right")
		animatedSprite.animation = "right"
		if Input.action_release(direction):
			animatedSprite.stop()
