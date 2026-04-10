extends CharacterBody2D

var player: Node = null
var player_in_chat_zone: bool = false

func _ready() -> void:
	$E.hide()
	add_to_group("bird")

func _process(_delta) -> void:
	if player_in_chat_zone and player != null:
		$E.show()
		player.talking = self

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "PlayerCharacter":
		player = body
		player_in_chat_zone = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "PlayerCharacter":
		player_in_chat_zone = false
		player.talking = null
		player = null
		$E.hide()
