extends Area2D

onready var C4tone = get_node("/root/Game/Keyboard/C4")

onready var toneMap = { "ui_C4": C4tone,}

var selected_note
var current_tone = ""
var toneTimer = 0

func _ready():
	pass

signal dropped(tone)

func _physics_process(_delta):	

		if toneTimer == 1:
			print("toneTimer is 1")
			# comment out  selected() for alternating global variable value
			#selected(0)
			testSelected()

		if toneTimer == 120:
			print("toneTimer is 120")
			testSelected()
			#toneMap[selected_note].play()
	
					
		if toneTimer == 240:
			print("toneTimer is 240")
			testSelected()
			print("Play C4tone")
			toneMap[selected_note].play()
		
		toneTimer += 1

func selected(lane):
	if lane == 0:
		selected_note = "ui_C4"
		emit_signal("dropped", selected_note)
		print("dropped_note signal sent:" + selected_note)
		return selected_note
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
		
func testSelected():
	print("test global Selected_note is: " + str(selected_note))
