extends Node

var dialog = load("res://Dialog.gd")

var characters = ["character-1684872351.json", "character-1684872362.json"]
var questions = [
	dialog.Question.new(
		"Σε έναν ανθρώπινο οργανισμό:",
		["α. όλα τα κύτταρα έχουν το ίδιο σχήμα και την ίδια λειτουργία.", "β. υπάρχουν κύτταρα με το ίδιο σχήμα και την ίδια λειτουργία.", "γ. κάθε όργανο αποτελείται από κύτταρα του ίδιου σχήματος.", "δ. όλα τα κύτταρα έχουν το ίδιο σχήμα και διαφορετική λειτουργία."],
		["Χμμ, δεν είμαι τόσο σίγουρος", "Μπαα", "Δυστυχώς όχι", "Σωστά!"],
		[false, false, false, true]
	),
	dialog.Question.new(
		"O φάρυγγας, o οισοφάγος, το στομάχι, το λεπτό και παχύ έντερο αποτελούν όλα μαζί:",
		["α. έναν ιστό.", "β. ένα όργανο.", "γ. έναν οργανισμό.", "δ. ένα σύστημα οργάνων."],
		["Όχι", "Γκούχου γκούχου", "Νιετ", "Σωστά!"],
		[false, false, false, true]
	),
	dialog.Question.new(
		"Κύτταρα όμοια μορφολογικά και λειτουργικά αποτελούν:",
		["α. ένα όργανο.", "β. έναν ιστό.", "γ. έναν οργανισμό.", "δ. ένα σύστημα οργάνων."],
		["Όχι", "Σωστά!", "Γκούχου γκούχου", "Νιετ"],
		[false, true, false, false]
	),
	dialog.Question.new(
		"Ο ρόλος του επιθηλιακού ιστού:",
		["α. είναι προστατευτικός.", "β. σχετίζεται με την απορρόφηση ουσιών.", "γ. σχετίζεται με την παραγωγή ουσιών.", "δ. εκφράζεται με τα α, β, γ."],
		["Όχι", "Γκούχου γκούχου", "Νιετ", "Σωστά!"],
		[false, false, false, true]
	),
	dialog.Question.new(
		"Το αίμα είναι:",
		["α. μυϊκός ιστός.", "β. συνδετικός ιστός.", "γ. επιθηλιακός ιστός.", "δ. νευρικός ιστός."],
		["Όχι", "Σωστά!", "Γκούχου γκούχου", "Νιετ"],
		[false, true, false, false]
	),
	dialog.Question.new(
		"Το σύστημα που συντονίζει όλες τις λειτουργίες του οργανισμού είναι:",
		["α. το νευρικό.", "β. το πεπτικό.", "γ. το αναπνευστικό.", "δ. το κυκλοφορικό."],
		["Σωστά!", "Γκούχου γκούχου", "Όχι", "Νιετ"],
		[true, false, false, false]
	),
	dialog.Question.new(
		"Οι αδένες:",
		["α. συμβάλλουν στην απορρόφηση ορισμένων ουσιών.", "β. προστατεύουν εξωτερικές επιφάνειες.", "γ. παράγουν και εκκρίνουν διάφορες ουσίες.", "δ. αποτελούνται μόνο από όμοια κύτταρα."],
		["Γκούχου γκούχου", "Όχι", "Σωστά!", "Νιετ"],
		[false, false, true, false]
	),
	dialog.Question.new(
		"Πέψη είναι:",
		["α. η είσοδος θρεπτικών ουσιών στον οργανισμό.", "β. η αποβολή των άχρηστων ουσιών.", "γ. η κατεργασία των τροφών για να απορροφηθούν οι θρεπτικές ουσίες.", "δ. η σύνθεση μεγαλομορίων από μικρότερα μόρια."],
		["Γκούχου γκούχου", "Όχι", "Σωστά!", "Νιετ"],
		[false, false, true, false]
	),
	dialog.Question.new(
		"Η βασική ουσία που περιέχει το σάλιο είναι:",
		["α. η πεψίνη.", "β. η αμυλάση.", "γ. η λεκιθίνη.", "δ. η βλέννα."],
		["Γκούχου γκούχου", "Σωστά!", "Όχι", "Νιετ"],
		[false,  true, false, false]
	),
	dialog.Question.new(
		"Το σάλιο που εκκρίνεται από τους σιελογόνους αδένες:",
		["α. διασπά το άμυλο σε απλούστερους υδατάνθρακες.", "β. περιέχει την ουσία αδαμαντίνη που κάνει τα δόντια σκληρά.", "γ. επηρεάζει την περισταλτική κίνηση του εντέρου.", "δ. περιέχει ορμόνη που βοηθάει την μετακίνηση της επιγλωττίδας."],
		["Σωστά!", "Γκούχου γκούχου", "Όχι", "Νιετ"],
		[true, false, false, false]
	)
]

func _answers_handler(answer_idx: int, answer: bool):
	print("answer_num is: " + str(answer_idx) + ", answer is: " + str(answer))

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Starting the dialog")
	var ref = funcref(self, "_answers_handler")
	var timeline = dialog.new().create_timeline(questions, characters, ref)
	add_child(timeline)
	print("Dialog ended")