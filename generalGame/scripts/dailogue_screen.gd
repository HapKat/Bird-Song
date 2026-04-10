extends CanvasLayer

signal open_rhythm_game
@onready var IMAGES = get_node("images")

var lines 
var current_character
var icon
var ICON

func _ready():
	self.hide()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("return"):
		return_pressed()
	
func open(character, index):
	current_character = character
	self.visible = not self.visible
	$"../PlayerCharacter".walking = not $"../PlayerCharacter".walking
	current_character = character
	
	## Add icon
	ICON = character.name + "Dia"
	icon = IMAGES.get_node(ICON)
	print(ICON)
	icon.show()
	
	## Add text
	lines = DialogueDatabase.DIALOGUES.get(character.name)
	if lines == null:
		print("No dialogue found for: ", character.name)
		return
	$text.text = lines[index]

func _on_return_pressed() -> void:
	return_pressed()

func return_pressed():
	icon = null
	var index
	if current_character.is_in_group("bird"):
		index = BirdStates.bird_progress.get(current_character.name).dialogue_index
		emit_signal("open_rhythm_game")
		self.hide()
		$"../Logbook icon".hide()
	elif current_character.is_in_group("npc"):
		index = NPCStates.npc_progress.get(current_character.name).dialogue_index
		self.hide()
		$"../PlayerCharacter".walking = not $"../PlayerCharacter".walking
