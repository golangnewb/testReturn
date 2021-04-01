extends Node2D

var note = load("res://Scenes/Note.tscn")
var lane
var instance
var current_note = ""
var _err

# Called when the node enters the scene tree for the first time.
func _ready():
	_err = $Note.connect("dropped", self, "_on_Note_dropped")
	if _err != OK:
		print("error connecting $Note.connect(dropped_note, self, on_Note_dropped)")
		print(_err)
		
	randomize() # randomizes the sead of random number generator
	spawn_notes()

func _on_Note_dropped(tone):
	print("Game has dropped_note of:" + tone)
	current_note = tone
	return current_note

# randomly select a Tone/Note
func spawn_notes():
	#lane = randi() % 3
	instance = note.instance()
	###### Uncomment  intance.call_deffered() to get alternating global selected_note values
	#instance.call_deferred("selected", 0)
	###########################
	# $Note.selected(0)
	# I tried this but the result was the same.
	add_child(instance)
