extends Node2D  

@onready var PLAYER: Node2D = $PlayerCharacter

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(delta):
	# quit game when press esc
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	# Open logbook when pressing F
	if Input.is_action_just_pressed("open_logbook"):
		$logbook_open.open()
	# starts interaction when pressing E
	if Input.is_action_just_pressed("interact"):
		if PLAYER.talking != null:
			print("talking")
			if PLAYER.talking.is_in_group("bird"):
				$BirdModule.openDialogue(PLAYER.talking)		
			elif 	PLAYER.talking.is_in_group("npc"):
				$NPCModule.openDialogue(PLAYER.talking)
		else:
			pass
		
		
