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
var global_answer_handler
var count_true = 0

func create_timeline(questions: Array, characters: Array, answer_handler: FuncRef) -> Dialog:
	global_answer_handler = answer_handler
	randomize()
	questions.shuffle()
	global_questions = questions
	var timeline = Dialogic.start()
	timeline.dialog_node.dialog_script = {
		"events": [
			{
				"background": "res://pics/classroom.png",
				"event_id": "dialogic_021"
			},
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
			# Question #1
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
			},
			# Question #2
			{
				"character": characters[0],
				"event_id": "dialogic_010",
				"options": [

				],
				"portrait": "",
				"question": questions[1].question
			},
			{
				"choice": questions[1].choices_text[0],
				"condition": "",
				"definition": "",
				"event_id": "dialogic_011",
				"value": ""
			},
			{
				"character": characters[1],
				"event_id": "dialogic_001",
				"portrait": "",
				"text": questions[1].answers_text[0]
			},
			{
				"emit_signal": "0",
				"event_id": "dialogic_040"
			},
			{
				"choice": questions[1].choices_text[1],
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
				"text": questions[1].answers_text[1]
			},
			{
				"choice": questions[1].choices_text[2],
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
				"text": questions[1].answers_text[2]
			},
			{
				"choice": questions[1].choices_text[3],
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
				"text": questions[1].answers_text[3]
			},
			{
				"event_id": "dialogic_013"
			},
			# Question #3
			{
				"character": characters[0],
				"event_id": "dialogic_010",
				"options": [

				],
				"portrait": "",
				"question": questions[2].question
			},
			{
				"choice": questions[2].choices_text[0],
				"condition": "",
				"definition": "",
				"event_id": "dialogic_011",
				"value": ""
			},
			{
				"character": characters[1],
				"event_id": "dialogic_001",
				"portrait": "",
				"text": questions[2].answers_text[0]
			},
			{
				"emit_signal": "0",
				"event_id": "dialogic_040"
			},
			{
				"choice": questions[2].choices_text[1],
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
				"text": questions[2].answers_text[1]
			},
			{
				"choice": questions[2].choices_text[2],
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
				"text": questions[2].answers_text[2]
			},
			{
				"choice": questions[2].choices_text[3],
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
				"text": questions[2].answers_text[3]
			},
			{
				"event_id": "dialogic_013"
			},
			# Question #4
			{
				"character": characters[0],
				"event_id": "dialogic_010",
				"options": [

				],
				"portrait": "",
				"question": questions[3].question
			},
			{
				"choice": questions[3].choices_text[0],
				"condition": "",
				"definition": "",
				"event_id": "dialogic_011",
				"value": ""
			},
			{
				"character": characters[1],
				"event_id": "dialogic_001",
				"portrait": "",
				"text": questions[3].answers_text[0]
			},
			{
				"emit_signal": "0",
				"event_id": "dialogic_040"
			},
			{
				"choice": questions[3].choices_text[1],
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
				"text": questions[3].answers_text[1]
			},
			{
				"choice": questions[3].choices_text[2],
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
				"text": questions[3].answers_text[2]
			},
			{
				"choice": questions[3].choices_text[3],
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
				"text": questions[3].answers_text[3]
			},
			{
				"event_id": "dialogic_013"
			},
			# Question #5
			{
				"character": characters[0],
				"event_id": "dialogic_010",
				"options": [

				],
				"portrait": "",
				"question": questions[4].question
			},
			{
				"choice": questions[4].choices_text[0],
				"condition": "",
				"definition": "",
				"event_id": "dialogic_011",
				"value": ""
			},
			{
				"character": characters[1],
				"event_id": "dialogic_001",
				"portrait": "",
				"text": questions[4].answers_text[0]
			},
			{
				"emit_signal": "0",
				"event_id": "dialogic_040"
			},
			{
				"choice": questions[4].choices_text[1],
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
				"text": questions[4].answers_text[1]
			},
			{
				"choice": questions[4].choices_text[2],
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
				"text": questions[4].answers_text[2]
			},
			{
				"choice": questions[4].choices_text[3],
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
				"text": questions[4].answers_text[3]
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
	var answer = global_questions[global_question_idx].answers[idx]
	print("Your answer was: " + str(answer))
	global_answer_handler.call_func(idx, answer)
	global_question_idx = global_question_idx + 1
	
	if answer == true:
		count_true = count_true + 1
	print ("Σωστές απαντήσεις: ", count_true)
	
	if count_true >=3 and global_question_idx == 5:
		print("Συγχαρητήρια!!! Πέρασες το μάθημα!!!")
