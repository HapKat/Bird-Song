extends CanvasLayer

signal dialogue_finished
@onready var IMAGES = get_node("bird_IMAGES")

var bird_picture
var bird_text
var lines 
var current_bird

func _ready():
	self.hide()
	
func open(bird, index):
	self.visible = not self.visible
	$"../PlayerCharacter".walking = not $"../PlayerCharacter".walking
	current_bird = bird
	
	## Add bird icon
	var BIRDDIA: String = bird + "Dia"
	var birdDia = IMAGES.get_node(BIRDDIA)
	birdDia.show()
	
	## Add text
	lines = DialogueDatabase.DIALOGUES.get(bird)
	$text.text = lines[index]

func _on_return_pressed() -> void:
	self.hide()
	$"../Logbook icon".hide()
	emit_signal("dialogue_finished")
	var index = BirdStates.bird_progress.get(current_bird).dialogue_index
	print(index)
	index = index + 1
	print(index)
	
	
