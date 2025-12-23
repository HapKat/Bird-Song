extends Node

@onready var logbook = get_node("/root/mainScene/logbook_open/bird_names")
@onready var gooseText = logbook.get_node("gooseText")


func printDialogue(bird):
	print("Hello I'm the " + bird)

func addToLogbook(bird):
	gooseText.text = bird
	print("Added " + bird + " to Logbook")
	$"../logbook_open".newBirdAdded()
