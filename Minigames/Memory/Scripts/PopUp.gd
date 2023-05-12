extends Control

var playButton

func _ready():
	playButton = get_node('CenterContainer/Panel/VBoxContainer/Button')
	playButton.connect("pressed",self,"newGame")
	get_tree().set_pause(true)

func newGame():
	get_tree().set_pause(false)
	GameManager.resetGame()
	self.queue_free()

func win():
	$CenterContainer/Panel/VBoxContainer/Label.text = "WINNER" 
	$CenterContainer/Panel/VBoxContainer/TextureRect.set_texture(load("res://Assets/cards/cardJocker_red.png"))
	$CenterContainer/Panel/VBoxContainer/Label2.text = "You found " + str(GameManager.score) + " pairs in " + str(GameManager.seconds) + " seconds, and flipped " + str(GameManager.moves) + " pairs of cards" 
	$CenterContainer/Panel/VBoxContainer/Button.text = "Play Again?" 
