extends Control

# MAIN BUTTONS

func _on_start_pressed() -> void:
	print("Start game")
	get_tree().change_scene_to_file("res://generalGame/scenes/main_scene.tscn")

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("continue"):
		print("Start game")
		get_tree().change_scene_to_file("res://generalGame/scenes/main_scene.tscn")

func _on_credits_pressed() -> void:
	print("Show credits")
	get_tree().change_scene_to_file("res://TitleScreen/credits.tscn")

func _on_quit_pressed() -> void:
	print("Quit game")
	get_tree().quit()
