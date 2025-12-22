extends Node2D  # or whatever your main scene root is

var logbook_scene = preload("res://generalGame/ui/logbook_open.tscn")
var logbook_instance: Control

func _ready():
	# instance the logbook and add it to the scene, but hide it
	logbook_instance = logbook_scene.instantiate()
	logbook_instance.visible = false
	add_child(logbook_instance)

func _process(delta):
	# Open/close logbook when pressing E
	if Input.is_action_just_pressed("open_logbook"):
		print("e pressed")
		logbook_instance.visible = not logbook_instance.visible
