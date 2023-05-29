extends Node2D


class Question:
	var question
	var choices_text
	var answers_text
	var answers
	
	func _init(question, choices_text, answers_text, answers):
		self.question = question
		self.choices_text = choices_text
		self.answers_text = answers_text
		self.answers = answers

var questions = [
	Question.new(
		"This is the question 1", 
		["Choice number 1", "Choice number 2"],
		["Correct!", "Wrong!"],
		[true, false]
	),
	Question.new(
		"This is the question 2", 
		["Choice number 3", "Choice number 4"],
		["Correct!", "Wrong!"],
		[false, true]
	),
	Question.new(
		"This is the question 3", 
		["Choice number 5", "Choice number 6"],
		["Correct!", "Wrong!"],
		[false, true]
	)
]

var random_index = randi() % 3

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	print("Ready method runs")
	print("Random index: " + str(random_index))
	var question = questions[random_index]
	var new_dialog = Dialogic.start("test_timeline")
	Dialogic.set_variable("AName", "Vasilis")
	Dialogic.set_variable("BName", "Silisav")
	Dialogic.set_variable("question", question.question)
	for i in 2:
		var name = "choice" + str(i)
		Dialogic.set_variable(name, question.choices_text[i])
	for i in 2:
		var name = "answer" + str(i)
		Dialogic.set_variable(name, question.answers_text[i])	
	add_child(new_dialog)
	new_dialog.connect("dialogic_signal", self, "dialogic_signal")


func dialogic_signal(argument):
	print("Dialogic signal called with argument: " + argument)
	var idx = int(argument)
	print("Your answer was: " + str(questions[random_index].answers[idx]))
