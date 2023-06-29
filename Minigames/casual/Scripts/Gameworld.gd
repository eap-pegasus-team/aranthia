extends Node2D

var enemy = preload("res://Scenes/Enemy.tscn")
var t = rand_range(0.3, 1)
onready var score

func _ready():
	$Timer.start(t)

func _on_Timer_timeout():
	var screen = get_viewport_rect().size
	var position = Vector2(rand_range(0, screen.x), -600)
	
	var enemy = load("res://Scenes/Enemy.tscn")
	enemy = enemy.instance()
	
	enemy.position = position
	add_child(enemy)
