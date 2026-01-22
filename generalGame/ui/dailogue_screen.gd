extends CanvasLayer

signal dialogue_finished
@onready var images = get_node("bird_images")

var bird_picture
var bird_text

func _ready():
	self.hide()
	
func open(bird):
	self.visible = not self.visible
	$"../PlayerCharacter".walking = not $"../PlayerCharacter".walking
	
	## Add bird icon
	var BIRDDIA: String = bird + "Dia"
	var birdDia = images.get_node(BIRDDIA)
	birdDia.show()
	
	## Add text
	$text.text = ".."

func _on_return_pressed() -> void:
	self.hide()
	$"../Logbook icon".hide()
	emit_signal("dialogue_finished")
	
	
