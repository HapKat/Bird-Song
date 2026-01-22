extends Node

@onready var logbook_names = get_node("/root/mainScene/logbook_open/bird_names")
@onready var logbook_imgs = get_node("/root/mainScene/logbook_open/bird_images")

var ListOfFoundBird: Array = []

func printDialogue(bird):
	print("Hello I'm the " + bird)
	
func openRhythmGame(bird):
	$"..".hide()
	$"../Logbook icon".hide()
	$"../PlayerCharacter/Camera2D".enabled = false
	var game_scene = preload("res://rhythmGame/levels/game_level.tscn").instantiate()
	$"../GameSceneHolder".add_child(game_scene)
	game_scene.game_finished.connect(_on_game_finished)
	$"../PlayerCharacter/Camera2D".enabled = true
	
func _on_game_finished():
	# Remove game scene
	$"../GameSceneHolder".get_child(0).queue_free()

	# Show main world again
	$"..".show()
	$"../Logbook icon".show()


func addToLogbook(bird):
		## change Text
		var BIRDTEXT: String = bird + "Text"
		var birdText = logbook_names.get_node(BIRDTEXT)
		birdText.text = bird
		print("Added " + bird + " to Logbook")
		
		
		## change image
		var BIRDBLACKOUT: String = bird + "Blackout"
		var birdBlackout = logbook_imgs.get_node(BIRDBLACKOUT)
		birdBlackout.hide()
		
		## show that bird was added in logbook icon
		$"../Logbook icon".newBirdAdded()
		
		## add bird to list
		ListOfFoundBird.append(bird)
		print(ListOfFoundBird)
	
