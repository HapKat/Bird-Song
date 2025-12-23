extends Node2D  

@onready var PLAYER: Node2D = $PlayerCharacter

func _ready():
	pass

func _process(delta):
	# Open logbook when pressing E
	if Input.is_action_just_pressed("open_logbook"):
		$logbook_open.open()
	if Input.is_action_just_pressed("interact"):
		$BirdModule.printDialogue($PlayerCharacter.talking)
		$BirdModule.addToLogbook($PlayerCharacter.talking)
		
		
