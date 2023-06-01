extends Node

var dialog = load("res://Dialog.gd")

var characters = ["FirstCharName", "SecondCharName"]
var questions = [
	dialog.Question.new(
		"This is the question 1",
		["Choice number 1", "Choice number 2"],
		["Correct!", "Wrong!"],
		[true, false]
	),
	dialog.Question.new(
		"This is the question 2", 
		["Choice number 3", "Choice number 4"],
		["Wrong!", "Correct!"],
		[false, true]
	),
	dialog.Question.new(
		"This is the question 3", 
		["Choice number 5", "Choice number 6"],
		["Correct!", "Wrong!"],
		[true, false]
	)
]

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Starting the dialog")
	var a = dialog.new().timeline(questions, characters)
	add_child(a)
	var b = dialog.new().timeline(questions, characters)
	print("Dialog ended... starting 2nd dialog")
	add_child(b)

