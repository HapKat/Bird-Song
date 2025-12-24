extends Node2D  

@onready var PLAYER: Node2D = $PlayerCharacter
@onready var CURRENTBIRD: String = PLAYER.talking

func _ready():
	pass

func _process(delta):
	# Open logbook when pressing E
	if Input.is_action_just_pressed("open_logbook"):
		$logbook_open.open()
	if Input.is_action_just_pressed("interact"):
		if $PlayerCharacter.talking != "":
			$BirdModule.printDialogue(PLAYER.talking)
			$BirdModule.addToLogbook(PLAYER.talking)
			$BirdModule.openRhythmGame(PLAYER.talking)
		else:
			pass
		
		
