extends CanvasLayer

func _ready():
	self.hide()
	print("ready")


func open():
	#get_tree().pause = true
	self.show()
	$"../PlayerCharacter".walking = false

func _on_return_pressed() -> void:
	self.hide()
