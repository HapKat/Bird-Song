extends Node

func _ready() -> void:
	get_tree().change_scene_to_file("res://TitleScreen/title_screen.tscn")

var exampleVar: int = 1


## We can use this for debugging
func DeveloperMode():
	get_tree().change_scene_to_file("res://generalGame/TitleScreen.tscn")
	exampleVar = 2
	
	
