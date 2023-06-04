class_name Dialog extends Node

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
var global_question_idx = 0

func trigger_timeline(questions: Array, characters: Array, number_of_questions: int) -> Dialog:
	questions.shuffle()
	global_questions = questions
	# var timeline_events: Array = []
	# for i in number_of_questions:
	# 	timeline_events.append(create_timeline(questions[i], characters))
	var timeline = Dialogic.start()
	timeline.dialog_node.dialog_script = {
		"events": [
			{
				"animation": "[Default]",
				"animation_length": 0,
				"animation_wait": true,
				"change_mirror_portrait": false,
				"change_z_index": false,
				"character": characters[0],
				"event_id": "dialogic_002",
				"mirror_portrait": false,
				"portrait": "Default",
				"portrait_definition": "",
				"position": {
					"0": true,
					"1": false,
					"2": false,
					"3": false,
					"4": false
				},
				"type": 0,
				"z_index": 0
			},
			{
				"animation": "[Default]",
				"animation_length": 0,
				"animation_wait": true,
				"change_mirror_portrait": false,
				"change_z_index": false,
				"character": characters[1],
				"event_id": "dialogic_002",
				"mirror_portrait": false,
				"portrait": "Default",
				"portrait_definition": "",
				"position": {
					"0": false,
					"1": false,
					"2": false,
					"3": false,
					"4": true
				},
				"type": 0,
				"z_index": 0
			},
			{
				"character": characters[0],
				"event_id": "dialogic_010",
				"options": [

				],
				"portrait": "",
				"question": questions[0].question
			},
			{
				"choice": questions[0].choices_text[0],
				"condition": "",
				"definition": "",
				"event_id": "dialogic_011",
				"value": ""
			},
			{
				"character": characters[1],
				"event_id": "dialogic_001",
				"portrait": "",
				"text": questions[0].answers_text[0]
			},
			{
				"emit_signal": "0",
				"event_id": "dialogic_040"
			},
			{
				"choice": questions[0].choices_text[1],
				"condition": "",
				"definition": "",
				"event_id": "dialogic_011",
				"value": ""
			},
			{
				"emit_signal": "1",
				"event_id": "dialogic_040"
			},
			{
				"character": characters[1],
				"event_id": "dialogic_001",
				"portrait": "",
				"text": questions[0].answers_text[1]
			},
			{
				"choice": questions[0].choices_text[2],
				"condition": "",
				"definition": "",
				"event_id": "dialogic_011",
				"value": ""
			},
			{
				"emit_signal": "2",
				"event_id": "dialogic_040"
			},
			{
				"character": characters[1],
				"event_id": "dialogic_001",
				"portrait": "",
				"text": questions[0].answers_text[2]
			},
			{
				"choice": questions[0].choices_text[3],
				"condition": "",
				"definition": "",
				"event_id": "dialogic_011",
				"value": ""
			},
			{
				"emit_signal": "3",
				"event_id": "dialogic_040"
			},
			{
				"character": characters[1],
				"event_id": "dialogic_001",
				"portrait": "",
				"text": questions[0].answers_text[3]
			},
			{
				"event_id": "dialogic_013"
			}
		]
	}
	timeline.connect("dialogic_signal", self, "dialogic_signal_handler")
	return timeline


func dialogic_signal_handler(argument):
	print("Dialogic signal called with argument: " + argument)
	var idx = int(argument)
	print("Your answer was: " + str(global_questions[global_question_idx].answers[idx]))
	global_question_idx = global_question_idx + 1
