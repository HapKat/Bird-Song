extends CanvasLayer

func _ready():
	self.hide()


func open():
	self.visible = not self.visible
	$"../PlayerCharacter".walking = not $"../PlayerCharacter".walking

func _on_return_pressed() -> void:
	self.hide()
	$"../PlayerCharacter".walking = true
	
	
	
	
	
