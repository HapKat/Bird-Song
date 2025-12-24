extends CanvasLayer

func _ready():
	self.hide()
	print("ready")

func _on_button_pressed() -> void:
	self.hide()

func open():
	#get_tree().pause = true
	self.show()
