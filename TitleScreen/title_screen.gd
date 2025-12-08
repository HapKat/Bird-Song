extends Control

# MAIN BUTTONS
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://generalGame/scenes/main_scene.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://TitleScreen/credits.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
