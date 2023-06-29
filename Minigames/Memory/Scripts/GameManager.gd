extends Node

onready var Game = get_node("/root/Game/")

var deck = Array()
var cardBack = preload("res://Assets/cards/cardBack_red2.png")

var card1
var card2

var matchTimer = Timer.new()
var flipTimer = Timer.new()
var secondsTimer = Timer.new()

var score = 0
var seconds = 0
var moves = 0

var scoreLabel
var timerLabel
var movesLabel
var goal = 26


var resetButton

var popUp = preload("res://Scenes/PopUp.tscn")

func _ready():
	fillDeck()
	dealDeck()
	setupTimers()
	setupHUD()
	var splash = popUp.instance()
	Game.add_child(splash)

func resetGame():
	for c in range(deck.size()):
		deck[c].queue_free()
	deck.clear()
	score = 0
	seconds = 0
	moves = 0
	scoreLabel.text = str(score)
	timerLabel.text = str(seconds)
	movesLabel.text = str(moves)
	fillDeck()
	dealDeck()

func setupHUD():
	scoreLabel = Game.get_node('HUD/Panel/Sections/SectionScore/score')
	timerLabel = Game .get_node('HUD/Panel/Sections/SectionTimer/seconds')
	movesLabel = Game.get_node('HUD/Panel/Sections/SectionMoves/moves')
	scoreLabel.text = str(score) 
	timerLabel.text = str(seconds)
	movesLabel.text = str(moves)
	resetButton = Game.get_node('HUD/Panel/Sections/SectionButtons/ButtonReset')
	resetButton.connect("pressed",self,"resetGame")

func setupTimers():
	flipTimer.connect("timeout",self,"turnOverCards")
	flipTimer.set_one_shot(true)
	add_child(flipTimer)
	
	matchTimer.connect("timeout",self,"matchCardsAndScore")
	matchTimer.set_one_shot(true)
	add_child(matchTimer)
	
	secondsTimer.connect("timeout",self,"countSeconds")
	add_child(secondsTimer)
	secondsTimer.start()

func countSeconds():
	seconds += 1
	timerLabel.text = str(seconds)

func fillDeck():
	var s = 1
	var v = 1
	while s < 5:
		v = 1
		while v < 14:
			deck.append(Card.new(s,v))
			v += 1
		s += 1

func dealDeck():
	deck.shuffle()
	var c = 0
	while c < deck.size():
		Game.get_node('grid').add_child(deck[c])
		c += 1

func chooseCard(var c):
	if card1 == null:
		card1 = c
		card1.flip()
		card1.set_disabled(true)
	elif card2 == null:
		card2 = c
		card2.flip()
		card2.set_disabled(true)
		moves += 1
		movesLabel.text = str(moves)
		checkCards()

func checkCards():
	if card1.value == card2.value:
		matchTimer.start(1)
	else:
		flipTimer.start(1)

func turnOverCards():
	card1.flip()
	card2.flip()
	card1.set_disabled(false)
	card2.set_disabled(false)
	card1 = null
	card2 = null

func matchCardsAndScore():
	score += 1
	scoreLabel.text = str(score)
	card1.set_modulate(Color(0.6,0.6,0.6,0.5))
	card2.set_modulate(Color(0.6,0.6,0.6,0.5))
	card1 = null
	card2 = null
	print(score)
	if score == goal:
		print("You win!")
		var winScreen = popUp.instance()
		Game.add_child(winScreen)
		winScreen.win()
