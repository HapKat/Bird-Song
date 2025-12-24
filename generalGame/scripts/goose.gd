extends CharacterBody2D

var player
var player_in_chat_zone: bool

func _ready() -> void:
	$E.hide()

func _process(_delta) -> void:
	if player_in_chat_zone == true:
		$E.show()
		$"../PlayerCharacter".talking = "Goose"


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "PlayerCharacter":        
		player = body
		player_in_chat_zone = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "PlayerCharacter":        
		player_in_chat_zone = false
		$E.hide()
		$"../PlayerCharacter".talking = ""
