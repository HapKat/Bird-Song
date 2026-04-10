extends Node

@onready var LOGBOOK_NAMES = get_node("/root/mainScene/logbook_open/bird_names")
@onready var LOGBOOK_IMGS = get_node("/root/mainScene/logbook_open/bird_images")

var ListOfFoundBirds: Array = []
var current_bird 


func _ready():
	$"../DailogueScreen".open_rhythm_game.connect(_on_open_rhythm_game)

func openDialogue(bird):
	var index = BirdStates.bird_progress.get(bird, {}).get("dialogue_index", 0)
	$"../DailogueScreen".open(bird, index)
	current_bird = bird
	addToLogbook(bird)
	BirdStates.bird_progress[bird.name]["dialogue_index"] += 1
	
func _on_open_rhythm_game():
	openRhythmGame(current_bird)
	
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
	$"../PlayerCharacter".walking = not $"../PlayerCharacter".walking


func addToLogbook(bird):
		## change Text
		var BIRDTEXT: String = bird.name + "Text"
		var birdText = LOGBOOK_NAMES.get_node(BIRDTEXT)
		birdText.text = bird.name
		print("Added " + bird.name + " to Logbook")
		
		## change image
		var BIRDBLACKOUT: String = bird.name + "Blackout"
		var birdBlackout = LOGBOOK_IMGS.get_node(BIRDBLACKOUT)
		birdBlackout.hide()
		
		## show that bird was added in logbook icon
		$"../Logbook icon".newBirdAdded()
		
		## add bird to list
		ListOfFoundBirds.append(bird)
		print(ListOfFoundBirds)
	
