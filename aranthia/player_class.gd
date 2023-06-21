extends Node

class Player:
	var hasAbjuration: bool
	var hasEvocation: bool
	var hasTransmutation: bool

var player: Player

func _ready():
	player = Player.new()
