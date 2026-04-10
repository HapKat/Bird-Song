extends Node2D  

@onready var PLAYER: Node2D = $PlayerCharacter

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(delta):
	# Open logbook when pressing F
	if Input.is_action_just_pressed("open_logbook"):
		$logbook_open.open()
	# starts interaction when pressing E
	if Input.is_action_just_pressed("interact"):
		if PLAYER.talking != "":
			$BirdModule.openDialogue(PLAYER.talking)			
		else:
			pass
		
		
