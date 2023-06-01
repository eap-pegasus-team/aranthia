class_name Dialog extends Object


class Question:
	var question: String
	var choices_text: Array
	var answers_text: Array
	var answers: Array

	func _init(question: String, choices_text: Array, answers_text: Array, answers: Array):
		self.question = question
		self.choices_text = choices_text
		self.answers_text = answers_text
		self.answers = answers

var global_questions
var random_index

# Called when the node enters the scene tree for the first time.
func timeline(questions: Array, character_names: Array) -> Dialog:
	global_questions = questions
	random_index = randi() % len(questions)
	randomize()
	print("Ready method runs")
	print("Random index: " + str(random_index))
	var question = questions[random_index]
	var new_dialog = Dialogic.start("test_timeline")
	Dialogic.set_variable("char0", character_names[0])
	Dialogic.set_variable("char1", character_names[1])
	Dialogic.set_variable("question", question.question)
	for i in 2:
		var name = "choice" + str(i)
		Dialogic.set_variable(name, question.choices_text[i])
	for i in 2:
		var name = "answer" + str(i)
		Dialogic.set_variable(name, question.answers_text[i])	
	new_dialog.connect("dialogic_signal", self, "dialogic_signal")
	return new_dialog


func dialogic_signal(argument):
	print("Dialogic signal called with argument: " + argument)
	var idx = int(argument)
	print("Your answer was: " + str(global_questions[random_index].answers[idx]))
